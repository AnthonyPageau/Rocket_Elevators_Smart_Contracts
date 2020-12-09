// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

contract MyStringStore {
  string public myString = "Hello World";

  function set(string memory a, string memory b, string memory c, string memory d, string memory e, string memory f) public {
    myString = a;
    myString = b;
    myString = c;
    myString = d;
    myString = e;
    myString = f;
  }
}