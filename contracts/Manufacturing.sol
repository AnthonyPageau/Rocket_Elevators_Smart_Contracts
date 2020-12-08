// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

contract Manufacturing {
    
    address[16] public clients;
    
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
    

    mapping (string => uint256) public materials;


//    function getMaterials(uint256 _steel_panel, uint256 _rails, uint256 _sensor, uint256 _steel_sheet, uint256 _pulley, uint256 _motor, uint256 _steelcable, uint256 _ledcable, uint256 _ledlight, uint256 _button, uint256 _screen, uint256 _controller) public returns (materials[]){
//         this.steel_panel = _steel_panel;
//         materials.push (_steel_pannel);
//         this.rails = _rails;
//         materials.pus(_rails);
//         this.sensor = _sensor;
//         materials.push (_sensor);
//         this.steel_sheet = _steel_sheet;
//         materials.push(_steel_sheet);
//         this.pulley = _pulley;
//         materials.push(_pulley);
//         this.motor = _motor;
//         materials.push(_motor);
//         this.steelcable = _steelcable;
//         materials.push(_steelcable);
//         this.ledlight = _ledlight;
//         materials.push(_ledlight);
//         this.button = _button;
//         materials.push(_button);
//         this.screen = _screen;
//         materials.push(_screen);
//         this.controller = _controller;
//         materials.push(_controller);
//         return materials;
//     }
        // function callgetMaterials() public {
        //     getMaterials(36,36,8,20,16,16,16,16,50,50,8,1);
        // }
    // constructor() public {
        
    //     materials["steel_panel"] = 36;
    //     materials["rails"] = 36;
    //     materials["sensor"] = 8;
    //     materials["steel_sheet"] = 20;
    //     materials["pulley"] = 16;
    //     materials["motor"] = 16;
    //     materials["steelcable"] = 16;
    //     materials["ledlight"] = 50;
    //     materials["button"] = 50;
    //     materials["screen"] = 8;
    //     materials["controller"] = 1;

    // }
    
    function doors( uint256 steel_panel, uint256 rails, uint256 sensor  ) public returns (uint256 numDoors) {
        require (steel_panel >= 2 && rails >=2 &&  sensor  >=1 );      
        productStruct.Name = "Door";
        productStruct.Quantity = numDoors;
        productList.push(productStruct);
        return numDoors;
    }

    function frames() public returns (uint256 numFrames) {
        Frame memory frame1 = Frame(10, 2, 2, 2);
        require (materials["steel_sheet"] >= 10 && materials["pulley"] >= 2 && materials["motor"] >= 2 && materials["steelcable"] >= 2);
        numFrames = materials["steel_sheet"] /= frame1.steel_sheet;
        productStruct.Name = "Frame";
        productStruct.Quantity = numFrames;
        productList.push(productStruct);
        return numFrames;
    }

    function buttons() public returns (uint256 numButtons) {
        require (materials["button"] >= 1 && materials["ledlight"] >=1);
        Button memory button1 = Button(1, 1);
        numButtons = materials["button"] /= button1.button;
        productStruct.Name = "Button";
        productStruct.Quantity = numButtons;
        productList.push(productStruct);
        return numButtons;
    }


    function display() public returns (uint256 numDisplay){
        Display memory display1 = Display(1);
        require (materials["screen"] >= 1);
        numDisplay = materials["screen"] /= display1.screen;
        productStruct.Name = "Screen";
        productStruct.Quantity = numDisplay;
        productList.push(productStruct);
        return numDisplay;
    }

    

    function batteries() public returns (uint256 numBattery){
        Battery memory battery1 = Battery(1);
        require (materials["controller"] >= 1);
        numBattery = materials["controller"] /= battery1.controller;
        productStruct.Name = "Battery";
        productStruct.Quantity = numBattery;
        productList.push(productStruct);
        return numBattery;
    }

    // gets all the doors
    function getDoors() public {
        doors(2,2,1);
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
    function getProducts() public {
        doors(2,2,1);
        frames();
        buttons();
        display();
        batteries();
    }

    function getClients() public view returns (address[16] memory) {
        return clients;
    }



    function production() public view returns (Product[] memory) {
        return productList;

    }
}
