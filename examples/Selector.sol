pragma solidity ^0.4.0;

contract Selector {

	function e() returns (bytes4) {
		// thisがつくと外部呼び出し
		return this.e.selector;
	}

	function f() returns (uint) {
		//  内部呼び出しでselectorがないのでエラー
		// return f.selectl
		return g();
	}

	function g() internal returns (uint) {
		return 0;
	}
}
