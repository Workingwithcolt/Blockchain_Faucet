const storagecontract =artifacts.require('Storage')

module.exports = function(deployer){
    deployer.deploy(storagecontract)
}