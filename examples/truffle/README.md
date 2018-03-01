# Truffleフレームワークの活用

## 環境構築

```
brew install npm
npm instsall -g truffle
```

## プロジェクトの作成


```
mkdir myproject
cd myproject
truffle init
```

## イーサリアムクライアントの選択

ローカルでGethでプライベートネットを起動していると
ブロックチェーンの初期化やマイニングCPUリソースが割かれてしまう

また、メインネットやテストネットなどのライブネットにデプロイするときは
事前にクライアントでブロックを同期しておく必要がある

### Ganache

イーサリアム開発用のパーソナルブロックチェーン
アプリケーションがブロックチェーンに与える影響をGUIで確認でき
アカウント、残高、契約作成、ガスコストなどの詳細を調べることが可能
トランザクションが発生したら自動的にマイニングすることも可能
ブロック生成のタイミングも秒単位で調整できる

http://truffleframework.com/ganache/

### Truffle Develop

Truffleフレームワークに組み込まれた開発ブロックチェーン
デフォルトのブロック生成時間を待つことなく、即座にTXを処理できる

下記コマンドで実行可能

```
truffle develop
```

### ライブネットワークへのデプロイ

メインネットやテストネットなど、ライブネットワークへのデプロイは
下記のイーサリアムクライアントを利用する

- [Geth(go-ethereum)](https://github.com/ethereum/go-ethereum)
- [WebThree](https://github.com/ethereum/cpp-ethereum)
- [Parity](https://github.com/paritytech/parity)

今回はイーサリアムクライアントをホスティングするINFURAを用いてデプロイ

## コントラクトのコンパイル

差分コンパイルが採用されている。

```
truffle compile
```

全てコンパイル

```
truffle compile --all
```

コンパイルの成果物は `build/contracts` ディレクトリへ


## マイグレーション

```
truffle migrate
```

## MetaCoin

独自コインを作成してアカウント間でやりとりするコントラクトのサンプル

### サンプルプロジェクト

下記コマンドでプロジェクトをダウンロードできる

```
truffle unbox metacoin
```

=> https://github.com/yukihirai0505/smart-contract/blob/master/examples/metacoin/README.md

## ERC20準拠のトークン作成

=> https://github.com/yukihirai0505/smart-contract/blob/master/examples/dapps-token/README.md