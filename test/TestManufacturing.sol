pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Manufacturing.sol";

contract TestManufacturing {
 // The address of the adoption contract to be tested
 Ballot ballot = Ballot(DeployedAddresses.Ballot());

 // The id of the pet that will be used for testing
 uint expectednumDoors = 1;

 //The expected owner of adopted pet is this contract
 address expectedClient = address(this);

//  bytes32[] proposalNames;
   
//     Ballot ballotToTest;
//     function beforeAll () public {
//         proposalNames.push(bytes32("candidate1"));
//         ballotToTest = new Ballot(proposalNames);
//     }


    // Testing retrieval of all pet owners
function testGetAdopterAddressByPetIdInArray() public {
  // Store adopters in memory rather than contract's storage
  address[16] memory clients = adoption.getAdopters();

  Assert.equal(clients[expectednumDoors], expectedClient, "Owner of the expected pet should be this contract");
}
//  // Testing the adopt() function
//     function testUserCanAssembleDoors() public {
//         uint returnedNumber = ballot.doors();

//         Assert.equal(returnedNumber, expectednumDoors, "Number of doors of the expected quality should match what is returned.");
//     }

    // // Testing retrieval of a single pet's owner
    // function testGetAdopterAddressByPetId() public {
    //     address adopter = adoption.adopters(expectedPetId);

    //     Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
    // }

    // // Testing retrieval of all pet owners
    // function testGetAdopterAddressByPetIdInArray() public {
    //     // Store adopters in memory rather than contract's storage
    //     address[16] memory adopters = adoption.getAdopters();

    //     Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
    // }


}