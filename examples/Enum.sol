pragma solidity ^0.4.0;

contract Enum {
	enum Colors {Red, Blue, Green}
	Colors color;
	Colors constant defaultColor = Colors.Green;

	function setColor() {
		color = Colors.Blue;
	}

	// setColorを呼ばない場合は0(Red)
	// setColorを読んだ後では1(Blue)が返る
	function getColor() returns (Colors) {
		return color;
	}

	// 2(Green)が返る
	function getDefaultColor() returns (uint) {
		return uint(defaultColor);
	}
}
