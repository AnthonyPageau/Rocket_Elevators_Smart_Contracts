App = {
  web3Provider: null,
  contracts: {},

  init: async function() {
    // Load pets.
    $.getJSON('../doors.json', function(data) {
      var doorsRow = $('#doorsRow');
      var doors_template = $('#doors_template');

      for (i = 0; i < data.length; i ++) {
        doors_template.find('.steel_panel').text(data[i].steel_panel);
        doors_template.find('.rails').text( data[i].rails);
        doors_template.find('.sensor').text(data[i].sensor);
        doors_template.find('.btn-adopt').attr('data-id', data[i].id);

        doorsRow.append(doors_template.html());
      }
    });

    return await App.initWeb3();
  },

  initWeb3: async function() {
    // Modern dapp browsers...
      if (window.ethereum) {
        App.web3Provider = window.ethereum;
        try {
          // Request account access
          await window.ethereum.enable();
        } catch (error) {
          // User denied account access...
          console.error("User denied account access")
        }
      }
      // Legacy dapp browsers...
      else if (window.web3) {
        App.web3Provider = window.web3.currentProvider;
      }
      // If no injected web3 instance is detected, fall back to Ganache
      else {
        App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
      }
      web3 = new Web3(App.web3Provider);

    return App.initContract();
  },

  initContract: function() {
    $.getJSON('./doors.json', function(data) {
      // Get the necessary contract artifact file and instantiate it with @truffle/contract
      var ManufacturingArtifact = data;
      App.contracts.Manufacturing = TruffleContract(ManufacturingArtifact);
    
      // Set the provider for our contract
      App.contracts.Manufacturing.setProvider(App.web3Provider);
    
      // Use our contract to retrieve and mark the adopted pets
      return App.markDoorAssembled();
    });

    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '.btn-adopt', App.handleDoorAssembly);
  },

  markDoorAssembled: function() {
    var doorAssemblyInstance;

    App.contracts.Manufacturing.deployed().then(function(instance) {
      doorAssemblyInstance = instance;

      return doorAssemblyInstance.getClients.call();
    }).then(function(clients) {
      for (i = 0; i < clients.length; i++) {
        if (clients[i] !== '0x0000000000000000000000000000000000000000') {
          $('.panel-door').eq(i).find('button').text('Success').attr('disabled', true);
        }
      }
    }).catch(function(err) {
      console.log(err.message);
    });
  },

  handleDoorAssembly: function(event) {
    event.preventDefault();

    var steel_panel = parseInt($(event.target).data('steel-panel'));

    var doorAssemblyInstance;

    web3.eth.getAccounts(function(error, accounts) {
      if (error) {
        console.log(error);
      }
    
      var account = accounts[0];
    
      App.contracts.Manufacturing.deployed().then(function(instance) {
        doorAssemblyInstance = instance;
    
        // Execute adopt as a transaction by sending account
        return doorAssemblyInstance.assembleDoors(steel_panel, {from: account});
      }).then(function(result) {
        return App.markDoorAssembled();
      }).catch(function(err) {
        console.log(err.message);
      });
    });
  }

};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
