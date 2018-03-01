pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

// ERC20Basic => ERC20, BasicToken => StandardToken => DappsToken
contract DappsToken is StandardToken {
	// トークンの名称
	string public name = "DappsToken";
	// トークンのシンボル
	string public symbol = "DTKN";
	// 小数点の桁をどこまで許可するかを設定
	uint public decimals = 18;

	// コンストラクタ
	function DappsToken(uint initialSupply) public {
		totalSupply_ = initialSupply;
		balances[msg.sender] = initialSupply;
	}
}