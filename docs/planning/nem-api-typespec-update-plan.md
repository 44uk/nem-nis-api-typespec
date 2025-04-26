# NEM NIS API TypeSpec 定義更新計画書

## 1. 目的

`docs/specs/nem-api.md` (v1.22) と `src/nem/main.tsp` (v1.19 ベース) の間に存在する乖離を解消し、TypeSpec定義 (`src/nem/main.tsp`) を最新のAPI仕様 (v1.22) に準拠させることを目的とします。

## 2. 特定された乖離箇所と修正タスク

以下に、特定された主な乖離箇所と、それに対応する修正タスクをチェックリスト形式で示します。

### A. 手数料関連 (Fee)

- [ ] 各トランザクションモデルの `fee` フィールドに `@doc` アノテーションを追加し、仕様書 v1.22 の手数料体系に関する記述や参照を含める。

### B. メッセージペイロード (Message Payload)

- [ ] `TransferTransaction` モデル (および関連する可能性のある他のトランザクションモデル) の `message.payload` フィールドに `@maxLength(1024)` 制約を追加する。

### C. モデル定義不足 (Missing/Incomplete Models)

- [ ] `AccountInfo` モデルを仕様書に基づき定義する。
- [ ] `TransactionMetaData` モデルを仕様書に基づき定義する。
- [ ] `TransactionMetaDataPair` モデルを仕様書に基づき定義する。
- [ ] `TransferTransaction` モデル (v1, v2 含む) の詳細を仕様書に基づき定義する。
- [ ] `ImportanceTransferTransaction` モデルを仕様書に基づき定義する。
- [ ] `MultisigAggregateModificationTransaction` モデルを仕様書に基づき定義する。
- [ ] `MultisigSignatureTransaction` モデルを仕様書に基づき定義する。
- [ ] `MultisigTransaction` モデルを仕様書に基づき定義する。
- [ ] `ProvisionNamespaceTransaction` モデルを仕様書に基づき定義する。
- [ ] `MosaicDefinitionCreationTransaction` モデルを仕様書に基づき定義する。
- [ ] `MosaicSupplyChangeTransaction` モデルを仕様書に基づき定義する。
- [ ] `Namespace` モデルを仕様書に基づき定義する。
- [ ] `Mosaic` モデルを仕様書に基づき定義する。
- [ ] `MosaicDefinition` モデルを仕様書に基づき定義する。
- [ ] `Block` モデルを仕様書に基づき定義する。
- [ ] その他、仕様書 Appendix A に記載があり、TypeSpecで未定義または不完全なモデルを特定し、定義する。
- [ ] 各APIオペレーションのレスポンスボディ定義 (`Body<{}>` となっている箇所) を、上記で定義した適切なモデル型で置き換える。

### D. APIバージョン情報 (API Version Info)

- [ ] `src/nem/main.tsp` ファイル先頭のコメントブロック内のバージョン情報を v1.22 に更新する。
- [ ] `@service` および `@info` デコレータ内の `title` や `version` 情報を仕様書 v1.22 に合わせて更新する。

## 3. 実行ステップ

1.  **修正作業:** 上記の修正タスクリストに基づき、`src/nem/main.tsp` ファイルを編集します (この作業は `code` モードで実施することを推奨)。
2.  **コンパイルと検証:** 修正後の `src/nem/main.tsp` をTypeSpecコンパイラでコンパイルし、構文エラーや型エラーがないことを確認します。
3.  **成果物確認 (任意):** コンパイルによって生成されたOpenAPI仕様書などを確認し、定義が意図通りに反映されているか検証します。
