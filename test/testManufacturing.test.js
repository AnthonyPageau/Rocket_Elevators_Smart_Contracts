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
})

