const DappsToken = artifacts.require("./DappsToken.sol")

module.exports = (deployer) => {
	let initialSupply = 1000
	deployer.deploy(DappsToken, initialSupply)
}