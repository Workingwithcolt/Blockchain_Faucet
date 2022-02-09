// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./Owned.sol";
import "./Logger.sol";
import "./IFaucet.sol";
// contract Faucet{
//     address[] public founders;
    
//     receive() external payable{}

//     function addFunds() external payable{
//         founders.push(msg.sender);
//     }

// function getter() view public  returns(address[] memory){
//     return founders;
// }

// function getFunderAtIndex(uint8 index) external view returns(address){
//     address[] memory _funders = getter();
//     return _funders[index];
// }

// }

// //const instance = await Faucet.deployed()//getting access the all the method which is present under the contract
// //instance.addFunds({from:accounts[0],value:"2"})


//45 Funders mapping
// contract Faucet{
//     uint public numofFunders = 0;

//     mapping(uint => address) founders;
    
//     receive() external payable{}

//     function addFunds() external payable{
//         uint index= numofFunders++;
//         founders[index] = msg.sender;
//     }

// function getFunderAtIndex(uint8 index) external view returns(address){
//     return founders[index];
// }
// }

//const instance = await Faucet.deployed()//getting access the all the method which is present under the contract
//instance.addFunds({from:accounts[0],value:"2"})



// lutFunders
// contract Faucet{
//     uint public numofFunders = 0;
//     mapping(address => bool) private  founders;
//     mapping(uint =>address) private lutFounders;
//     receive() external payable{}

//     function addFunds() external payable{
//         address funder = msg.sender;

//         if(!founders[funder]){
//             uint index = numofFunders++;
//             founders[funder] = true;
//             lutFounders[index] = funder;
//         }
//    }
//    function getAllFunders() external view returns(address[] memory){
//        address[] memory _funders = new address[](numofFunders);
//        for(uint i=0;i< numofFunders;i++){
//            _funders[i] = lutFounders[i];
//        }
//        return _funders;
//    }

// function sta(uint8 index) external view returns(address){
//     return lutFounders[index];
// }
// }





//withdraw
// contract Faucet{
//     uint public numofFunders = 0;
//     mapping(address => bool) private  founders;
//     mapping(uint =>address) private lutFounders;
//     receive() external payable{}

//     function addFunds() external payable{
//         address funder = msg.sender;

//         if(!founders[funder]){
//             uint index = numofFunders++;
//             founders[funder] = true;
//             lutFounders[index] = funder;
//         }
//    }

//    function withdraw(uint withdrawAmount) external{
//        if(withdrawAmount < 1000000000000000000){
//        payable(msg.sender).transfer(withdrawAmount);
//    }
//    }
//    function getAllFunders() external view returns(address[] memory){
//        address[] memory _funders = new address[](numofFunders);
//        for(uint i=0;i< numofFunders;i++){
//            _funders[i] = lutFounders[i];
//        }
//        return _funders;
//    }

// function getFunderAtIndex(uint8 index) external view returns(address){
//     return lutFounders[index];
// }
// }

//const instance = await Faucet.deployed()
//instance.addFunds({from:accounts[0],value:"2000000000000000000"})
//instance.addFunds({from:accounts[1],value:"2000000000000000000"})

//instance.withdraw("500000000000000000",{from:accounts[1]})
//instance.getFunderAtIndex(0)
//instance.getAllFunders()



// //Require
// contract Faucet{
//     uint public numofFunders = 0;
//     mapping(address => bool) private  founders;
//     mapping(uint =>address) private lutFounders;
//     receive() external payable{}

//     function addFunds() external payable{
//         address funder = msg.sender;

//         if(!founders[funder]){
//             uint index = numofFunders++;
//             founders[funder] = true;
//             lutFounders[index] = funder;
//         }
//    }

//    function withdraw(uint withdrawAmount) external{
//        require(withdrawAmount <= 100000000000000000,"Cannot withdraw more than 0.1 ether");
   
//        payable(msg.sender).transfer(withdrawAmount);
//    }
//    function getAllFunders() external view returns(address[] memory){
//        address[] memory _funders = new address[](numofFunders);
//        for(uint i=0;i< numofFunders;i++){
//            _funders[i] = lutFounders[i];
//        }
//        return _funders;
//    }

// function getFunderAtIndex(uint8 index) external view returns(address){
//     return lutFounders[index];
// }
// }

// //const instance = await Faucet.deployed()
// //instance.addFunds({from:accounts[0],value:"2000000000000000000"})
// //instance.addFunds({from:accounts[1],value:"2000000000000000000"})

// //instance.withdraw("100000000000000000",{from:accounts[1]})
// //instance.getFunderAtIndex(0)
// //instance.getAllFunders()





// //modifier
// contract Faucet{
//     uint public numofFunders = 0;
//     mapping(address => bool) private  founders;
//     mapping(uint =>address) private lutFounders;
//     receive() external payable{}

//     modifier limitWithdraw(uint withdrawAmount){
//         require(withdrawAmount <= 100000000000000000,"Cannot withdraw more than 0.1 ether");
//     _;
//     }
//     function addFunds() external payable{
//         address funder = msg.sender;

//         if(!founders[funder]){
//             uint index = numofFunders++;
//             founders[funder] = true;
//             lutFounders[index] = funder;
//         }
//    }

//    function withdraw(uint withdrawAmount) external limitWithdraw(withdrawAmount){
//        payable(msg.sender).transfer(withdrawAmount);
//    }
//    function getAllFunders() external view returns(address[] memory){
//        address[] memory _funders = new address[](numofFunders);
//        for(uint i=0;i< numofFunders;i++){
//            _funders[i] = lutFounders[i];
//        }
//        return _funders;
//    }

// function getFunderAtIndex(uint8 index) external view returns(address){
//     return lutFounders[index];
// }
// }

// //const instance = await Faucet.deployed()
// //instance.addFunds({from:accounts[0],value:"2000000000000000000"})
// //instance.addFunds({from:accounts[1],value:"2000000000000000000"})

// //instance.withdraw("100000000000000000",{from:accounts[1]})
// //instance.getFunderAtIndex(0)
// //instance.getAllFunders()



// //onlyowner
// contract Faucet{

//     address public owner;
//     uint public numofFunders = 0;
//     mapping(address => bool) private  founders;
//     mapping(uint =>address) private lutFounders;
//     receive() external payable{}

//     constructor(){
//         owner = msg.sender;
//     }

//     modifier OnlyOwner{
//         require(
//             msg.sender == owner,
//             "Only owner can call the function "
//         );
//         _;
//     }
//     modifier limitWithdraw(uint withdrawAmount){
//         require(withdrawAmount <= 100000000000000000,"Cannot withdraw more than 0.1 ether");
//     _;
//     }
//     function addFunds() external payable{
//         address funder = msg.sender;

//         if(!founders[funder]){
//             uint index = numofFunders++;
//             founders[funder] = true;
//             lutFounders[index] = funder;
//         }
//    }


//    function transferOwnership(address newOwner) OnlyOwner{
//        owner = newOwner;
//    }



//    function test1() external OnlyOwner{

//    }//Only owner can call that function

//    function test2() external OnlyOwner{

//    }//Only owner can call that function

//    function withdraw(uint withdrawAmount) external limitWithdraw(withdrawAmount){
//        payable(msg.sender).transfer(withdrawAmount);
//    }
//    function getAllFunders() external view returns(address[] memory){
//        address[] memory _funders = new address[](numofFunders);
//        for(uint i=0;i< numofFunders;i++){
//            _funders[i] = lutFounders[i];
//        }
//        return _funders;
//    }

// function getFunderAtIndex(uint8 index) external view returns(address){
//     return lutFounders[index];
// }
// }

// //const instance = await Faucet.deployed()
// //instance.addFunds({from:accounts[0],value:"2000000000000000000"})
// //instance.addFunds({from:accounts[1],value:"2000000000000000000"})
// //instance.test1({from:accounts[0]})
// //instance.withdraw("100000000000000000",{from:accounts[1]})
// //instance.getFunderAtIndex(0)
// //instance.getAllFunders()


// //inheritance

// contract Faucet is Owned{
//     uint public numofFunders = 0;
//     mapping(address => bool) private  founders;
//     mapping(uint =>address) private lutFounders;
//     receive() external payable{}

    

    
//     modifier limitWithdraw(uint withdrawAmount){
//         require(withdrawAmount <= 100000000000000000,"Cannot withdraw more than 0.1 ether");
//     _;
//     }
//     function addFunds() external payable{
//         address funder = msg.sender;

//         if(!founders[funder]){
//             uint index = numofFunders++;
//             founders[funder] = true;
//             lutFounders[index] = funder;
//         }
//    }


//    function transferOwnership(address newOwner) external OnlyOwner{
//        owner = newOwner;
//    }



//    function test1() external OnlyOwner{

//    }//Only owner can call that function

//    function test2() external OnlyOwner{

//    }//Only owner can call that function

//    function withdraw(uint withdrawAmount) external limitWithdraw(withdrawAmount){
//        payable(msg.sender).transfer(withdrawAmount);
//    }
//    function getAllFunders() external view returns(address[] memory){
//        address[] memory _funders = new address[](numofFunders);
//        for(uint i=0;i< numofFunders;i++){
//            _funders[i] = lutFounders[i];
//        }
//        return _funders;
//    }

// function getFunderAtIndex(uint8 index) external view returns(address){
//     return lutFounders[index];
// }
// }

// //const instance = await Faucet.deployed()
// //instance.addFunds({from:accounts[0],value:"2000000000000000000"})
// //instance.addFunds({from:accounts[1],value:"2000000000000000000"})
// //instance.test1({from:accounts[0]})
// //instance.withdraw("100000000000000000",{from:accounts[1]})
// //instance.getFunderAtIndex(0)
// //instance.getAllFunders()


// //Abstract
// contract Faucet is Owned,Logger{
//     uint public numofFunders = 0;
//     mapping(address => bool) private  founders;
//     mapping(uint =>address) private lutFounders;
//     receive() external payable{}


//     function emitLog() public override pure returns(bytes12){
//         return "Hellow world";
//     }


    
//     modifier limitWithdraw(uint withdrawAmount){
//         require(withdrawAmount <= 100000000000000000,"Cannot withdraw more than 0.1 ether");
//     _;
//     }
//     function addFunds() external payable{
//         address funder = msg.sender;

//         if(!founders[funder]){
//             uint index = numofFunders++;
//             founders[funder] = true;
//             lutFounders[index] = funder;
//         }
//    }


//    function transferOwnership(address newOwner) external OnlyOwner{
//        owner = newOwner;
//    }



//    function test1() external OnlyOwner{

//    }//Only owner can call that function

//    function test2() external OnlyOwner{

//    }//Only owner can call that function

//    function withdraw(uint withdrawAmount) external limitWithdraw(withdrawAmount){
//        payable(msg.sender).transfer(withdrawAmount);
//    }
//    function getAllFunders() external view returns(address[] memory){
//        address[] memory _funders = new address[](numofFunders);
//        for(uint i=0;i< numofFunders;i++){
//            _funders[i] = lutFounders[i];
//        }
//        return _funders;
//    }

// function getFunderAtIndex(uint8 index) external view returns(address){
//     return lutFounders[index];
// }
// }

// //const instance = await Faucet.deployed()
// // instance.emitLog()
// //instance.test3()
// //instance.addFunds({from:accounts[0],value:"2000000000000000000"})
// //instance.addFunds({from:accounts[1],value:"2000000000000000000"})
// //instance.test1({from:accounts[0]})
// //instance.withdraw("100000000000000000",{from:accounts[1]})
// //instance.getFunderAtIndex(0)
// //instance.getAllFunders()





// //Interface
// contract Faucet is Owned,Logger,IFaucet{
//     uint public numofFunders = 0;
//     mapping(address => bool) private  founders;
//     mapping(uint =>address) private lutFounders;
//     receive() external payable{}


//     function emitLog() public override pure returns(bytes12){
//         return "Hellow world";
//     }


    
//     modifier limitWithdraw(uint withdrawAmount){
//         require(withdrawAmount <= 100000000000000000,"Cannot withdraw more than 0.1 ether");
//     _;
//     }
//     function addFunds() override external payable{
//         address funder = msg.sender;

//         if(!founders[funder]){
//             uint index = numofFunders++;
//             founders[funder] = true;
//             lutFounders[index] = funder;
//         }
//    }


//    function transferOwnership(address newOwner) external OnlyOwner{
//        owner = newOwner;
//    }



//    function test1() external OnlyOwner{

//    }//Only owner can call that function

//    function test2() external OnlyOwner{

//    }//Only owner can call that function

//    function withdraw(uint withdrawAmount)  override external limitWithdraw(withdrawAmount){
//        payable(msg.sender).transfer(withdrawAmount);
//    }
//    function getAllFunders() external view returns(address[] memory){
//        address[] memory _funders = new address[](numofFunders);
//        for(uint i=0;i< numofFunders;i++){
//            _funders[i] = lutFounders[i];
//        }
//        return _funders;
//    }

// function getFunderAtIndex(uint8 index) external view returns(address){
//     return lutFounders[index];
// }
// }

// //const instance = await Faucet.deployed()
// // instance.emitLog()
// //instance.test3()
// //instance.addFunds({from:accounts[0],value:"2000000000000000000"})
// //instance.addFunds({from:accounts[1],value:"2000000000000000000"})
// //instance.test1({from:accounts[0]})
// //instance.withdraw("100000000000000000",{from:accounts[1]})
// //instance.getFunderAtIndex(0)
// //instance.getAllFunders()




//Interface
contract Faucet is Owned,Logger,IFaucet{
    uint public numofFunders = 0;
    mapping(address => bool) private  founders;
    mapping(uint =>address) private lutFounders;
    // receive() external payable{}


    function emitLog() public override pure returns(bytes12){
        return "Hellow world";
    }


    
    modifier limitWithdraw(uint withdrawAmount){
        require(withdrawAmount <= 100000000000000000,"Cannot withdraw more than 0.1 ether");
    _;
    }
    function addFunds() override external payable{
        address funder = msg.sender;

        if(!founders[funder]){
            uint index = numofFunders++;
            founders[funder] = true;
            lutFounders[index] = funder;
        }
   }


   function transferOwnership(address newOwner) external OnlyOwner{
       owner = newOwner;
   }



   function test1() external OnlyOwner{

   }//Only owner can call that function

   function test2() external OnlyOwner{

   }//Only owner can call that function

   function withdraw(uint withdrawAmount)  override external limitWithdraw(withdrawAmount){
       payable(msg.sender).transfer(withdrawAmount);
   }
   function getAllFunders() external view returns(address[] memory){
       address[] memory _funders = new address[](numofFunders);
       for(uint i=0;i< numofFunders;i++){
           _funders[i] = lutFounders[i];
       }
       return _funders;
   }

function getFunderAtIndex(uint8 index) external view returns(address){
    return lutFounders[index];
}
}

//const instance = await Faucet.deployed()
// instance.emitLog()
//instance.test3()
//instance.addFunds({from:accounts[0],value:"2000000000000000000"})
//instance.addFunds({from:accounts[1],value:"2000000000000000000"})
//instance.test1({from:accounts[0]})
//instance.withdraw("100000000000000000",{from:accounts[1]})
//instance.getFunderAtIndex(0)
//instance.getAllFunders()
