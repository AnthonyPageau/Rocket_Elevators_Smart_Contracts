// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

contract Ballot {
    
    
    mapping (string => uint256) public materials;
    
     struct Product {
        string Name;
        uint256 Quantity;
    }
    
    struct Door{ 
        uint256 steel_panel; 
        uint256 rails; 
        uint256 sensor;
    } 

    struct Frame{
        uint256 steelsheet;
        uint256 pulley;
        uint256 motor; 
        uint256 steelcable;
    }
    
    struct Button{
        uint256 ledlight;
        uint256 button;
    }
    
    struct Display{
        uint256 screen;
    }
    
    struct Battery{
        uint256 controller;
    }
    
    Product productStruct;
    Product[] productList;    
    address[1] public clients;

    constructor() public {
        
        materials["steel_panel"] = 36;
        materials["rails"] = 36;
        materials["sensor"] = 8;
        materials["steelsheet"] = 20;
        materials["pulley"] = 16;
        materials["motor"] = 16;
        materials["steelcable"] = 16;
        materials["ledlight"] = 50;
        materials["button"] = 50;
        materials["screen"] = 8;
        materials["controller"] = 1;
    }
    
    function doors() public returns (uint256 numDoors) {
        Door memory door1 = Door(2, 2, 1);
        numDoors = materials["steel_panel"] /= door1.steel_panel;
        productStruct.Name = "Door";
        productStruct.Quantity = numDoors;
        productList.push(productStruct);
        return numDoors;
    }
    
    function getDoors() public {
        doors();
    }
    
    function production() public view returns (Product[] memory) {
        return productList;

    }
}
