// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

contract Manufacturing {
    
    
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
        uint256 steel_sheet; //10
        uint256 pulley; //2
        uint256 motor; //2
        uint256 steelcable; //2
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

    constructor() public {
        //doors
        materials["steel_panel"] = 36; //2 per doors
        materials["rails"] = 36; //2 per doors
        materials["sensor"] = 18; //1 per doors
        //frames
        materials["steel_sheet"] = 40; //10 per frame
        materials["pulley"] = 16; //2 per frame
        materials["motor"] = 16; //2 per frame 
        materials["steelcable"] = 16; //2 per frame
        //buttons
        materials["ledlight"] = 50; //1 per button
        materials["button"] = 50; //1 per button 
        //display
        materials["screen"] = 16; //1 per display
        //battery
        materials["controller"] = 1; //1 per battery
    }
    
    function doors() public returns (uint256 numDoors) {
        Door memory door1 = Door(2, 2, 1);
        numDoors = materials["steel_panel"] /= door1.steel_panel;
        productStruct.Name = "Door";
        productStruct.Quantity = numDoors;
        productList.push(productStruct);
        return numDoors;
    }

    function frames() public returns (uint256 numFrames) {
        Frame memory frame1 = Frame(10, 2, 2, 2);
        numFrames = materials["steel_sheet"] /= frame1.steel_sheet;
        productStruct.Name = "Frame";
        productStruct.Quantity = numFrames;
        productList.push(productStruct);
        return numFrames;
    }

    function buttons() public returns (uint256 numButtons) {
        Button memory button1 = Button(1, 1);
        numButtons = materials["button"] /= button1.button;
        productStruct.Name = "Button";
        productStruct.Quantity = numButtons;
        productList.push(productStruct);
        return numButtons;
    }


    function display() public returns (uint256 numDisplay){
        Display memory display1 = Display(1);
        numDisplay = materials["screen"] /= display1.screen;
        productStruct.Name = "Screen";
        productStruct.Quantity = numDisplay;
        productList.push(productStruct);
        return numDisplay;
    }

    

    function batteries() public returns (uint256 numBattery){
        Battery memory battery1 = Battery(1);
        numBattery = materials["controller"] /= battery1.controller;
        productStruct.Name = "Battery";
        productStruct.Quantity = numBattery;
        productList.push(productStruct);
        return numBattery;
    }

    // gets all the doors
    function getDoors() public {
        doors();
    }

    // gets all the frames
    function getFrames() public{
        frames();

    }

    // gets all the buttons
    function getButtons() public{
        buttons();

    }

    // gets all the displays
    function getDisplay() public {
        display();
    }

    //gets all the batteries controllers
    function getBatteries() public {
        batteries();
    }


    // gets all the roducts regardless of their type


    function getProducts() public returns(Product[] memory){
        doors();
        frames();
        buttons();
        display();
        batteries();
    }
}
