const testcontract =artifacts.require('Test')

module.exports = function(deployer){
    deployer.deploy(testcontract)
}