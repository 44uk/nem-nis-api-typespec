import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "./transaction.tsp";

using TypeSpec.Http;

/**
 * Represents the score of the blockchain.
 */
model BlockChainScore {
  /** The score of the blockchain as a hexadecimal string. */
  @doc("The score of the blockchain as a hexadecimal string.")
  score: string;
}

/**
 * Represents the height of a block in the blockchain.
 */
model BlockHeight {
  /** The height of the block. */
  @doc("The height of the block.")
  @minValue(1)
  height: int64;
}

/**
 * Contains information about a block that an account harvested.
 */
model HarvestInfo {
  /** The number of seconds elapsed since the creation of the nemesis block. */
  @doc("The number of seconds elapsed since the creation of the nemesis block.")
  timeStamp: int32;

  /** The database id for the harvested block. */
  @doc("The database id for the harvested block.")
  id: int32;

  /** The block difficulty. */
  @doc("The block difficulty.")
  difficulty: int64;

  /** The total fee collected by harvesting the block in micro NEM. */
  @doc("The total fee collected by harvesting the block in micro NEM.")
  totalFee: int64;

  /** The height of the harvested block. */
  @doc("The height of the harvested block.")
  @minValue(1)
  height: int64;
}

/**
 * Represents a block in the NEM blockchain.
 */
model Block {
  /** Number of seconds elapsed since the creation of the nemesis block when the block was created. */
  @doc("Number of seconds elapsed since the creation of the nemesis block when the block was created.")
  timeStamp: int32;

  /** The signature of the block (hexadecimal string, 128 chars). */
  @doc("The signature of the block (hexadecimal string, 128 chars).")
  @pattern("^[a-f0-9]{128}$")
  signature: string;

  /** The hash of the previous block. */
  @doc("The hash of the previous block.")
  prevBlockHash: TransactionHash;

  /** The array of transactions included in the block. */
  @doc("The array of transactions included in the block.")
  transactions: (TransferTransaction | ImportanceTransferTransaction | MultisigAggregateModificationTransaction | MultisigSignatureTransaction | unknown)[];

  /** The version of the block structure. */
  @doc("The version of the block structure.")
  version: int32;

  /** The hash of the block. */
  @doc("The hash of the block.")
  hash: TransactionHash;

  /** The height of the block. */
  @doc("The height of the block.")
  @minValue(1)
  height: int64;

  /** The block difficulty. */
  @doc("The block difficulty.")
  difficulty: int64;

  /** The total fee collected by harvesting the block in micro NEM. */
  @doc("The total fee collected by harvesting the block in micro NEM.")
  totalFee: int64;

  /** The type of the block (usually 1 for a normal block). */
  @doc("The type of the block (usually 1 for a normal block).")
  type: int32;

  /** The payload of the block (usually empty). */
  @doc("The payload of the block (usually empty).")
  payload?: string;

  /** The public key of the account that generated (harvested) the block (hexadecimal string, 64 chars). */
  @doc("The public key of the account that generated (harvested) the block (hexadecimal string, 64 chars).")
  @pattern("^[a-f0-9]{64}$")
  generatorPublicKey: string;

  /** The block reward in micro NEM. */
  @doc("The block reward in micro NEM.")
  blockReward: int64;
}

/**
 * Represents a block view model used by the blockchain explorer.
 */
model ExplorerBlockViewModel {
  /** Array containing the transactions of the block. */
  @doc("Array containing the transactions of the block.")
  txes: ExplorerTransferViewModel[];

  /** The block object. */
  @doc("The block object.")
  block: Block;

  /** The hash of the block (hexadecimal string, 64 chars). */
  @doc("The hash of the block (hexadecimal string, 64 chars).")
  @pattern("^[a-f0-9]{64}$")
  hash: string;

  /** The difficulty of the block. */
  @doc("The difficulty of the block.")
  difficulty: int64;
}

/**
 * Represents a transaction view model used by the blockchain explorer.
 */
model ExplorerTransferViewModel {
  /** The transaction object. The specific type depends on the transaction type field within. */
  @doc("The transaction object. The specific type depends on the transaction type field within.")
  tx: TransferTransaction | ImportanceTransferTransaction | MultisigAggregateModificationTransaction | MultisigSignatureTransaction | unknown;

  /** The hash of the transaction. */
  @doc("The hash of the transaction.")
  hash: TransactionHash;

  /** The hash of the inner transaction. Only available for multisig transactions. */
  @doc("The hash of the inner transaction. Only available for multisig transactions.")
  innerHash?: TransactionHash;
}
