pragma solidity ^0.4.0; // 0.4.0未満ではコンパイルせず"^"で0.5.0以上でも動作しないことを宣言

contract SimpleStorage {

	// 変数の宣言
	uint storedData;

	// storedDataを変更する
	function set(uint x) public {
		storedData = x;
	}

	// storedDataを取得する
	function get() public constant returns (uint) {
		return storedData;
	}
}