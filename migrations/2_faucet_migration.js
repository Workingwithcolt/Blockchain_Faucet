const fuacetcontract =artifacts.require('Faucet')

module.exports = function(deployer){
    deployer.deploy(fuacetcontract)
}