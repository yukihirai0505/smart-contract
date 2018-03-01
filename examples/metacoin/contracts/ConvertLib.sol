pragma solidity ^0.4.4;

// libraryで宣言すると呼び出し元のコントラクトの処理として実行される
library ConvertLib{
	function convert(uint amount,uint conversionRate) public pure returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}
}
