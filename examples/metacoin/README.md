# MetaCoin

独自コインを作成してアカウント間でやりとりするコントラクトのサンプル
下記コマンドでダウンロードできる

`truffle unbox metacoin`

https://github.com/yukihirai0505/smart-contract/blob/master/examples/truffle/README.md

`truffle unbox` コマンドはMetaCoin意外にもさまざまなサンプルが
[Truffle Boxes](http://truffleframework.com/boxes/) として用意されている

## コンパイルとマイグレーションの実行

```
truffle develop
> compile
> migrate
```

migrateまでいったら

`MetaCoin: [address]`

を変数に保存しておく

`truffle(develop)> m = MetaCoin.at("0xf25186b5081ff5ce73482ad761db0eb0d25abfbf")`

account0が10,000MetaCoinを保持しているか確認する

`truffle(develop)> m.getBalance(web3.eth.accounts[0])`

=> `{ [String: '10000'] s: 1, e: 4, c: [ 10000 ] }`

アカウント1にコインがないことを確認

`truffle(develop)> m.getBalance(web3.eth.accounts[1])`

アカウント0からアカウント1に1,000コイン送金

`truffle(develop)> m.sendCoin(web3.eth.accounts[1], 1000)`

送金結果を確認

```
truffle(develop)> m.getBalance(web3.eth.accounts[0])
{ [String: '9000'] s: 1, e: 3, c: [ 9000 ] }
truffle(develop)> m.getBalance(web3.eth.accounts[1])
{ [String: '1000'] s: 1, e: 3, c: [ 1000 ] }
```

