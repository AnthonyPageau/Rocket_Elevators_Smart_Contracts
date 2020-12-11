const Manufacturing = artifacts.require("Manufacturing");

contract("Manufacturing", function() {
    let manufacturing;
    let numDoors;
    let meta;
    let numFrames;
    let numButtons;
    let numDisplay;
    let numBatteries;


  


    describe('getting the number of doors using getDoors', () =>{
        it("Should return number of doors", () => {
            Manufacturing.deployed()
            .then(instance =>  {
                meta = instance;        
                meta.getDoors.call().then(numDoors => {
                    assert.equal(numDoors, 10);
                });
            })
        })
    })

    describe('getting the number of frames using getFrames', () =>{
        it("Should return number of frames", () => {
            Manufacturing.deployed()
            .then(instance =>  {
                meta = instance;        
                meta.getFrames.call().then(numFrames => {
                    assert.equal(numFrames, 2);
                });
            })
        })
    })

    describe('getting the number of buttons using getButtons', () =>{
        it("Should return number of buttons", () => {
            Manufacturing.deployed()
            .then(instance =>  {
                meta = instance;        
                meta.getButtons.call().then(numButtons => {
                    assert.equal(numButtons, 10);
                });
            })
        })
    })

    describe('getting the number of display using getDisplay', () =>{
        it("Should return number of display", () => {
            Manufacturing.deployed()
            .then(instance =>  {
                meta = instance;        
                meta.getDisplay.call().then(numDisplay => {
                    assert.equal(numDisplay, 1);
                });
            })
        })
    })

    describe('getting the number of batteries using getBatteries', () =>{
        it("Should return number of batteries", () => {
            Manufacturing.deployed()
            .then(instance =>  {
                meta = instance;        
                meta.getBatteries.call().then(numBatteries => {
                    assert.equal(numBatteries, 1);
                });
            })
        })
    })
})

