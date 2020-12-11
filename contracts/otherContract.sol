// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
pragma experimental ABIEncoderV2;

contract otherContract {

     struct Material {
        string material;
        uint64 quantity;
    }
   

    Material materialStruct;
    Material[] private LeurList;

    function leurFonction() public view returns (Material[] memory material) {
        return LeurList;
    }

}