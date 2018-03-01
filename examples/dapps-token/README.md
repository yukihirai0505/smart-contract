# ERC20準拠のトークン作成

トークン作成で実装しなければならないメソッドとイベントが定義されている
最低限、下記のメソッドとイベントを定義する

```
// メソッド
function totalSupply() public constant returns (uint);
function balanceOf(address tokenOwner) public constant returns (uint balance);
function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
function transfer(address to, uint tokens) public returns (bool success);
function approve(address spender, uint tokens) public returns (bool success);
function transferFrom(address from, address to, uint tokens) public returns (bool success);

// イベント
event Transfer(address indexed from, address indexed to, uint tokens);
event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
```

https://theethereum.wiki/w/index.php/ERC20_Token_Standard

## Truffleプロジェクトの作成

```
mkdir dapps-token
cd dapps-token
truffle init
```

## OpenZeppelinのインストール

```
npm init -f
npm install zeppelin-solidity
```

## 各コマンド

### テストの実行

```
truffle develop
truffle(develop)> test
```

### マイグレーションの実行

```
truffle(develop)> migrate
truffle(develop)> dappsToken = DappsToken.at(DappsToken.address)
```

### 名前の確認

`truffle(develop)> dappsToken.name()`

### symbolの確認

`truffle(develop)> dappsToken.symbol()`

### 総発行量の確認

`truffle(develop)> dappsToken.totalSupply()`

### アカウント1番目の発行量確認

`truffle(develop)> dappsToken.balanceOf(web3.eth.accounts[0])`

### アカウント2番目の発行量確認

`truffle(develop)> dappsToken.balanceOf(web3.eth.accounts[1])`

### 送金

`truffle(develop)> dappsToken.transfer(web3.eth.accounts[1], 100)`

### アカウントの所持しているトークン数を確認

```
truffle(develop)> dappsToken.balanceOf(web3.eth.accounts[0])
{ [String: '900'] s: 1, e: 2, c: [ 900 ] }
truffle(develop)> dappsToken.balanceOf(web3.eth.accounts[1])
{ [String: '100'] s: 1, e: 2, c: [ 100 ] }
```