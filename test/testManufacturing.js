const Manufacturing = artifacts.require("Manufacturing");

contract("Manufacturing", function(doors) {
    
    describe("Should return the number of doors", function(){
     Before("setting steel_panel = 2, rails = 2, sensor = 1")
      await.Manufacturing.doors(2,2,1);
      expectednumDoors = 2;

    });

    it("Should return number of doors", async () => {
      const numDoors = await manufacturing.getDoors.call();
      assert.equal(2);
    });

});