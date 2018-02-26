## Go Ethereum

プライベートネットで動かすために、ローカルの環境に初めのブロックを作成する
最初のブロックはGenesisブロックと呼ばれる

gethフォルダ直下に `private_net` フォルダを作成して `genesis.json` ファイルを作成する

Download from https://ethereum.github.io/go-ethereum/downloads/

version is 1.7.3

### Gethの初期化

`./geth/geth --datadir ./geth/private_net/ init ./geth/private_net/genesis.json`

`Successfully wrote genesis state` と表示されればOK

### Gethの起動

`./geth/geth --networkid "10" --nodiscover --datadir ./geth/private_net --rpc --rpcaddr "localhost" --rpcport "8584" --rpccorsdomain "*" --rpcapi "eth,net,web3,personal" --targetgaslimit "20000000" console 2>> ./geth/private_net/error.log`

`Welcome to the Geth JavaScript console!` と表示されればOK

### アカウントの作成

`personal.newAccount("password")`

### アカウントの確認

`eth.accounts`

インデックスを指定して確認できる

`eth.accounts[0]`

### コインベースのアカウント確認

コインベースアカウント=>ブロック生成のマイニング報酬を受け取るアカウント
デフォルトではインデックス0のアカウント

`eth.coinbase`

### コインベースアカウントの変更

`miner.setEtherbase(eth.accounts[1])`

## Gethのコンソールコマンド

### ブロック内容の確認

`eth.getBlock` でブロック内容を確認
引数でなんばん目のブロックを確認したいか指定する

`eth.getBlock(1)`

genesisブロックは `eth.getBlock(0)` で確認できる
ブロックは0->1->2->3...と積みあがっていくのでブロック高と呼ぶ

### マイニングの開始

マイニングはブロックを生成すること
トランザクションを生成してもブロックに取り込む作業を実行しないと
発行されたトランザクションはブロック中の記録に残らない
マイニングの開始は

`miner.start(1)` を実行
引数は処理を実行するスレッド数
`eth.mining` コマンドを実行してtrueが返って来ればマイニング中

最初のマイニングが開始するまでは時間がかかる

### コインベースの残高確認(wei)

`eth.getBalance(eth.accounts[0])`

### コインベースの残高確認(ether)

`web3.fromWei(eth.getBalance(eth.accounts[0]), "ether")`

### マイニングの停止

`miner.stop()`
