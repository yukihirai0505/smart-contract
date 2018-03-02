const DappsToken = artifacts.require("./DappsToken.sol")

module.exports = (deployer) => {
	let initialSupply = 1000e18
	deployer.deploy(DappsToken, initialSupply, {
		// Gasを明示しないとデプロイが完了できない
		gas: 2000000
	})
}