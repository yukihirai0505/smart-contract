pragma solidity ^0.4.0;

contract SimpleStorageOwner {

	// 変数の宣言
	uint public storedData;
	// コントラクトを作成したアカウントのアドレスを入れる
	address public owner;

	function SimpleStorageOwner() public {
		// コンストラクタ
		owner = msg.sender;
	}

	modifier onlyOwner {
		// コントラクトへの呼び出しがコントラクトの作成者かを確認する
		// 違ったらrevertが発生する
		require(msg.sender == owner);
		// _ は修飾子が付けられた関数を実行するという意味
		_;
	}

	// storedDataを変更する
	function set(uint x) public onlyOwner {
		storedData = x;
	}

	// storedDataを取得する
	function get() public constant returns (uint) {
		return storedData;
	}
}