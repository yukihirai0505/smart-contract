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

# ネットワークへのデプロイ

## プライベートネットワークへのデプロイ

Gethの起動してマイニングの状況をtrueにする

https://github.com/yukihirai0505/smart-contract/blob/master/README.md

truffle.jsにデプロイ先の情報を記述

```
module.exports = {
	networks: {
		development: {
			host: "localhost",
			port: 8545,
			network_id: "10"
		},
	}
};
```

### デプロイコマンド

`truffle migrate -network development`

### developmentネットワークへの接続

`truffle console -network development`

```
truffle(development)> d = DappsToken.at("0x7509168d56a82dece22d78782ab00ef38245ab85")
truffle(development)> d.name()
'DappsToken'
truffle(development)> d.symbpl()
'DTKN'
truffle(development)> d.balanceOf(web3.eth.accounts[0])
{ [String: '1000'] s: 1, e: 3, c: [ 1000 ] }
truffle(development)> d.balanceOf(web3.eth.accounts[1])
{ [String: '0'] s: 1, e: 0, c: [ 0 ] }
truffle(development)> d.balanceOf(web3.eth.accounts[2])
{ [String: '0'] s: 1, e: 0, c: [ 0 ] }
truffle(development)> d.transfer(web3.eth.accounts[1], 200)
truffle(development)> d.balanceOf(web3.eth.accounts[1])
{ [String: '200'] s: 1, e: 2, c: [ 200 ] }
truffle(development)> d.balanceOf(web3.eth.accounts[0])
{ [String: '800'] s: 1, e: 2, c: [ 800 ] }
```

## テストネットへのデプロイ

テストネットには

- Ropsten => Proof of Work
- Kovan => Proof of Authority
- Rinkeby => Proof of Authority

などがある
それぞれブロック生成のコンセンサスアルゴリズムに違いがある

Proof of Authorityとは選ばれたユーザーのみがブロックを作成できる仕組み

今回はRopstenネットワークに対してデプロイを行う

### MetaMaskのインストール

MetaMaskは、Google Chromeで利用できるイーサリアムのウォレット

https://chrome.google.com/webstore/detail/metamask/nkbihfbeogaeaoehlefnkodbefgpgknn

インストールしてログインできたら左上から `Rospten Test Network` を選択する

### Etherの入手(MetaMask Ether Faucetへの接続)

MetaMask Ether Faucetにアクセス

https://faucet.metamask.io/

`request 1 ether from faucet`

をクリックするとトランザクションが発行されてMetaMaskの残高が1.000ETHになる

### Infuraへの登録

InfuraはGethに代表されるイーサリアムクライアントを利用しなくても
テストネットやメインネットにコントラクトをデプロイできる仕組みを提供
Gethでデプロイすることも可能だが、各ネットのブロックチェーンと同期する必要があり
時間とディスク容量を大量に消費する

まずはInfuraにアクセス

https://infura.io/

truddle-hdwallet-providerのインストール

`npm install truffle-hdwallet-provider`


### Ropstenネットワークへのデプロイ

環境変数で登録しておく

```
export MNEMONIC="MetaMaskのニーモニック"
export INFURA_ACCESS_TOKE="infuraのhttps://ropsten.infura.io/の後ろ"
```

下記コマンドでデプロイ

`truffle migrate --network ropsten`

デプロイ後はMetaMaskのADD TOKENから
デプロイしたトークンのアドレスを入力してTOKENタブに1000DTKNが表示されていれば
デプロイユーザーへの付与は完了

#### Ropstenネットワークに接続

`truffle console -network ropsten`

一連の動作

```
truffle console --network ropsten
truffle(ropsten)> d = DappsToken.at("ERC20 Contract Address")
truffle(ropsten)> d.balanceOf("Token Holder")
```

MetaMaskで別のアカウントを作成してみて送金テスト

```
truffle(ropsten)> d.transfer("account 2", 1e18)
truffle(ropsten)> d.balanceOf("account 2")
{ [String: '999000000000000000000'] s: 2, e: 20, c: [ 9990000 ] }
truffle(ropsten)> d.balanceOf("account 1")
{ [String: '1000000000000000000'] s: 1, e: 18, c: [ 10000 ] }
```