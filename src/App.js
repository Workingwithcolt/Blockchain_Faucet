import './App.css';

import Web3 from "web3";

import {loadContract} from './utils/load-Contract'

import React, { useEffect, useState ,useCallback} from 'react';

import detectEthereumProvider from '@metamask/detect-provider'

function App(){
   const [web3Api,setWeb3Api] = useState({
     provider:null,
     web3:null,
     contract:null,
     isprovided:false
   })
  const [shouldReload,setreload] = useState(false)
  const [balance,setBalance] = useState(null);
  const [accounts,setAccounts] = useState(null);
  const canConnectToContract = accounts && web3Api.contract
  console.log(canConnectToContract)

  const reloadEffect = useCallback(() =>{
   setreload(!shouldReload)
  },[shouldReload])
  
  const setAccountListener = (provider) =>{
    provider.on("accountsChanged",(accounts) => setAccounts(accounts[0]))
  //That method will  trigger at the time when You change the account on the metamask that change will quickly reflect in the 
  //our application

  provider._jsonRpcConnection.events.on("notification",(payload) =>{
    const {method} = payload
    if(method === "metamask_unlockStateChanged"){
      setAccounts(null)
    }
  })//That method tell if we lock the  metamask then we make account to null 
  }
   useEffect(() =>{
    const loadProvider = async () =>{
      // with metamask we have access to window.ethereum & to window.web3
      //metamask injects a global API into website
      //this api allow website to request users,accounts ,read data from blockchain
      //it can sign message and transactions

      // console.log(window.web3)
      // console.log(window.ethereum)
    const provider =await detectEthereumProvider();
    console.log(provider)
    console.log("It is a provider")
      if(provider){
        setAccountListener(provider)
        const  contract = await loadContract("Faucet", provider)
        setTimeout(() =>{
          console.log(contract)
        },5000)
        console.log("It is Ur contract")
        setWeb3Api({
          web3: new Web3(Web3.givenProvider || "http://127.0.0.1:7545"),
          provider,
          contract,
          isprovided:true
        })
      }else{
        setWeb3Api({...web3Api,isprovided:true})
        console.log("Please install the metamask")
      }
    //   if(window.ethereum){
    //     provider = await window.ethereum;
    //     try{
    //       await provider.request({method:"eth_requestAccounts"})
    //     }catch{
    //       console.log("User denied account access!");
    //     }
    //   }else if(window.web3){
    //     provider = window.web3.currentProvider;
    //   }else if(!process.env.production){
    //     provider = new Web3.providers.HttpProvider("http://localhost:7545")
    //   }
    //   const w = new Web3(provider);
     }
    loadProvider()
  },[])//that function is executed at the once when the content is mounted
  
  useEffect(() =>{
    const loadBalance = async () =>{
      const {contract,web3} = web3Api
      const balance = await web3.eth.getBalance(contract.address); 
      console.log(balance)
      console.log("The above is the balance")
      setBalance(web3.utils.fromWei(balance,"ether"))
    }
    web3Api.contract && loadBalance()
  },[web3Api,shouldReload])
  useEffect(() =>{
    const getAccounts = async() =>{
      const accounts = await web3Api.web3.eth.getAccounts();
      setAccounts(accounts[0])
    }
    web3Api.web3 && getAccounts()//that mean (web3Api.web3) ? getAccounts()
  },[web3Api.web3])

  const addFunds =useCallback (async () =>{
    const {contract,web3} = web3Api;
    await contract.addFunds({
      from:accounts,
      value:web3.utils.toWei("0.1","ether")
    })
    // window.location.reload()//That will automatically reload whenever the addfunds get called
    reloadEffect()
  },[web3Api,accounts,reloadEffect])
//Whenever the Change occure  in the web3Api that time the useCallback  call the addFunds method again 
const WithdrawFunds =async () =>{
  const {contract,web3} = web3Api
  const withdrawAmount = web3.utils.toWei("0.1","ether")
  await contract.withdraw(withdrawAmount,{
    from:accounts
  })
  reloadEffect()
}
  return (
    <div className="faucet-wrapper">
    <div className = "faucet">
    <strong>Accounts:</strong>
    {
      web3Api.isprovided ?
      <div className = "is-flex is-flex-direction-row">
      {
        accounts ? 
        accounts :
        !web3Api.isprovider ?
        <div>
        {/* //WE DONT HAVE A Provider */}
        <div className= "notification is-warning is-small is-rounded">
        Wallet is not detected!{'  '}
        <a href ="https://docs.metamask.io" target ="_blank">
        Install Metamask</a>
        </div>
        </div>
        :
        <button className = "button is-info mr-2" onClick = {
          async ()=>await web3Api.provider.request({method: "eth_requestAccounts"})}>
          Connect Wallet</button>
        }
        </div>
        :
        <span>Looking for WEB3</span>
         }
      </div>
    <div className = "faucet">
    <div className ="balance-view is-size-2">
    Current Balance:<strong>{balance}</strong>ETH
    </div>
    {
      !canConnectToContract && 
      <i className = "is-block">
      Connect to Ganache
      </i>
    }
    <button className ="btn mr-2" onClick = { () =>{
      const accounts =  window.ethereum.request({method:"eth_requestAccounts"});
      console.log(accounts)}}>Enable Ethereum</button>
      <button className = "btn mr-2"
      disabled  ={!canConnectToContract}
      onClick = {addFunds}>Donate 0.01 ETH</button>
      <button className="btn" 
      disabled  ={!canConnectToContract}
      onClick ={WithdrawFunds}>Withdraw 0.1ETH</button>
    </div>
    </div> 
  );
}

export default App;
