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

