// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


interface IFaucet{
//all function should be external 
    function addFunds() external payable;
    function withdraw(uint withdrawAmount) external;
}