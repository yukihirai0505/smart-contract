pragma solidity ^0.4.0;

contract Integers {
	function Integers(){
	}

	// 3 / 2 は切り捨てられて1になり、1*2で2が返る
	function getTwo() constant returns (uint) {
		uint a = 3;
		uint b = 2;
		return a / b * 2;
	}

	// リテラルなので 3 / 2 は切り捨てられず 1.5 になり、 1.5 * 2 で 3 が返る
	function getThree() constant returns (uint) {
		return 3 / 2 * 2;
	}

	// Solidityではコンパイルが通らない 0の除算は常に例外
	function divByZero() constant returns (uint) {
		uint a = 3;
		uint b = 2;
		return 3 / 0;
	}

	function shift() constant returns (uint[2]) {
		uint[2] a;
		// 16 * 2 ** 2 = 64
		a[0] = 16 << 2;
		// 16 / 2 ** 2 = 4
		a[1] = 16 >> 2;
		return a;
	}
}
