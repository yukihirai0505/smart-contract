pragma solidity ^0.4.18;

import "./ConvertLib.sol";

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract MetaCoin {
	// mapping型のbalancesを宣言 keyがaddress, valueがuint
	mapping (address => uint) balances;

	// event型のTransferは送金を記録
	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	// コンストラクタ関数 初期化時に実行 tx.origin はコントラクトを呼び出したアドレス
	// このコントラクトを最初に作成したアカウントは無条件に10,000 MetaCoinを入手することになる
	function MetaCoin() public {
		balances[tx.origin] = 10000;
	}

	// 実効するアカウントの残高などをみて送るかどうかの処理へ
	function sendCoin(address receiver, uint amount) public returns(bool sufficient) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		Transfer(msg.sender, receiver, amount);
		return true;
	}

	function getBalanceInEth(address addr) public view returns(uint){
		// addrの残高を2倍にしたものを返す
		return ConvertLib.convert(getBalance(addr),2);
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}
}
