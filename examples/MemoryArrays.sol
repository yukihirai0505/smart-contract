pragma solidity ^0.4.0;

contract MemoryArrays {
	function f(uint len){
		// uintの動的配列を7つ作成する
		uint[] memory a = new uint[](7);
		// サイズがlenの固定バイト配列を作成する
		bytes memory b = new bytes(len);
		a[6] = 8;
	}
}
