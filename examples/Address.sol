pragma solidity ^0.4.0;

contract Address {

	function() payable {}

	function getBalance(address _t) constant returns (uint) {
		if (_t == address(0)) {
			_t = this;
		}
		return _t.balance;
	}

	// 送金する
	function transfer(address _to, uint _amount) {
		_to.transfer(_amount);
	}

	// 送金する、失敗した場合はfalseが返る
	function send(address _to, uint _amount) {
		if (!_to.send(_amount)) {
			throw;
		}
	}

	// アドレスに送金 失敗するとfalseが返る Gasの量を調整できる
	// ABIに準拠していないコントラクトとのインターフェースを取るため、任意のタイプの因位の引数をとる関数呼び出し
	function call(address _to, uint _amount) {
		if (!_to.call.value(_amount).gas(1000000)()) {
			throw;
		}
	}

	function withdraw() {
		address to = msg.sender;
		to.transfer(this.balance);
	}

	function withdraw2() {
		address to = msg.sender;
		if (!to.call.value(this.balance).gas(100000)()) {
			throw;
		}
	}
}
