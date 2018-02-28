pragma solidity ^0.4.0;

// !(論理否定)
// &&(論理積 and)
// ||(論理和 or)
// ==(等式)
// !=(不等式)

contract Booleans {

	function Booleans(){
	}

	function getTrue() constant returns (bool) {
		bool a = true;
		bool b = false;
		return a || false;
	}

	function getFalse() constant returns (bool) {
		bool a = false;
		bool b = true;
		return a && b;
	}
}
