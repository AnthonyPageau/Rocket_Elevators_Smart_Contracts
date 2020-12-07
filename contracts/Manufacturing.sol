pragma solidity ^0.5.0;

contract Manufacturing {
    
    address[1] public client;
    
    // hardcoded item values 
    uint steel_panel = 36 ;
    uint rails = 36 ;
    uint sensor = 8 ;





    // this is the basic requirements for a single elevator
    struct doors{ 
        uint steel_panel; // 2 steel panels
        uint rails; // 2 rails
        uint sensor; // 1 sensor
    } 

    struct frame{
        uint steelsheet; // 10 steel sheets
        uint pulley; // 2 pulleys
        uint motor; // 2 motors
        uint steelcable; // 2 steelcable
    }

    struct button{
        uint ledlight; // 1 led light
        uint button; // 1 button
    }

    struct display{
        uint screen; // i lcd screen
    }

    struct battery{
        uint controller; // 1 controller
    }


    // assembling the doors
    function assembleDoors(uint steel_panel, uint rails, uint sensor) public returns (uint){

        require (steel_panel >= 2 && rails >= 2 && sensor >= 1);

        client[steel_panel] = msg.sender;


        return steel_panel;

    } 

       // Retrieving the clients
    function getClients() public view returns (address[1] memory) {
        return client;
    }


    // // Adopting a pet
    // function adopt(uint petId) public returns (uint) {
    //     require(petId >= 0 && petId <= 15);

    //     adopters[petId] = msg.sender;

    //     return petId;
    // }

    // // Retrieving the adopters
    // function getAdopters() public view returns (address[16] memory) {
    //     return adopters;
    // }



}