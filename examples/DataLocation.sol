pragma solidity ^0.4.0;

contract DataLocation {
	uint[] x; // ローカル変数の宣言なのおでstorage

	// memoryArrayは関数内で使用されるのでmemory
	function f(uint[] memoryArray) {
		// storageにmemoryArrayがコピーされる
		x = memoryArray;
		// xのポイントが入る yはstorageを指す
		var y = x;
		y[7];
		y.length = 2;
		// y経由でxの長さを変更
		delete x;
		// xを削除するとyも削除される
		// 以下は動作しない
		// y = memoryArray;
		// これも同様に動作しない yを指し示すべき値が存在しないから
		// delete y;
		// xへの参照をそのままgへ渡す
		g(x);
		// xはstorageなのでmemoryをコピーしてhを自己王
		h(x);
	}

	function g(uint[] storage storageArray) internal {}

	function h(uint[] memoryArray) {}
}
