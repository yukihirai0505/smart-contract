let HDWalletProvider = require("truffle-hdwallet-provider")
let mnemonic = process.env.MNEMONIC
let accessToken = process.env.INFURA_ACCESS_TOKE

module.exports = {
	// See <http://truffleframework.com/docs/advanced/configuration>
	// to customize your Truffle configuration!
	networks: {
		development: {
			host: "localhost",
			port: 8545,
			network_id: "10"
		},
		ropsten: {
			provider: () => {
				return new HDWalletProvider(
						mnemonic,
						"https://ropsten.infura.io/" + accessToken
				)
			},
			network_id: 3,
			gas: 500000
		}
	}
};
