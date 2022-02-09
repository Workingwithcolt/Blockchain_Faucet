// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

abstract contract Logger{

    uint public testNumber;

    constructor(){
        testNumber = 1000;
    }
    function emitLog() public virtual returns(bytes12);

    function test3() external pure returns(uint){
        return 100;
    }
}
