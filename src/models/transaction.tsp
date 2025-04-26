import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "./mosaic.tsp";

using TypeSpec.Http;

/**
 * Represents the hash of a transaction.
 */
model TransactionHash {
  /** The transaction hash data as a hexadecimal string. */
  @doc("The transaction hash data as a hexadecimal string.")
  @pattern("^[a-f0-9]{64}$")
  data: string;
}

/**
 * Transaction meta data structure.
 */
model TransactionMetaData {
  /** The height of the block in which the transaction was included. */
  @doc("The height of the block in which the transaction was included.")
  @minValue(1)
  height: int64;

  /** The database id of the transaction. */
  @doc("The database id of the transaction.")
  id: int32;

  /** The hash of the transaction. */
  @doc("The hash of the transaction.")
  hash: TransactionHash;
}

/**
 * Base model for all transaction types.
 */
model TransactionBase {
  /** Number of seconds elapsed since the creation of the nemesis block. */
  @doc("Number of seconds elapsed since the creation of the nemesis block.")
  timeStamp: int32;

  /** Transaction signature (hexadecimal string, 128 chars). Missing if part of a multisig transaction. */
  @doc("Transaction signature (hexadecimal string, 128 chars). Missing if part of a multisig transaction.")
  @pattern("^[a-f0-9]{128}$")
  signature?: string;

  /** Transaction fee in micro NEM. */
  @doc("Transaction fee in micro NEM.")
  fee: int64;

  /** Transaction type code (integer). */
  @doc("Transaction type code (integer).")
  type: int32;

  /** Deadline in seconds elapsed since the creation of the nemesis block. */
  @doc("Deadline in seconds elapsed since the creation of the nemesis block.")
  deadline: int32;

  /** Transaction structure version. Network dependent (e.g., mainnet: 0x68000001, testnet: 0x98000001). */
  @doc("Transaction structure version. Network dependent (e.g., mainnet: 0x68000001, testnet: 0x98000001).")
  version: int32;

  /** Public key of the account that created the transaction (hexadecimal string, 64 chars). */
  @doc("Public key of the account that created the transaction (hexadecimal string, 64 chars).")
  @pattern("^[a-f0-9]{64}$")
  signer: string;
}

/**
 * Represents a version 1 transfer transaction (XEM transfer).
 * Type code: 0x101 (257)
 */
model TransferTransactionV1 extends TransactionBase {
  /** Transaction type must be 0x101 (257). */
  @doc("Transaction type must be 0x101 (257).")
  type: 257;

  /** Recipient account address. */
  @doc("Recipient account address.")
  @pattern("^[T|N][A-Z0-9]{39}$")
  recipient: string;

  /** Amount transferred in micro NEM. */
  @doc("Amount transferred in micro NEM.")
  amount: int64;

  /** Optional message payload. */
  @doc("Optional message payload.")
  message?: MessagePayload;
}

/**
 * Represents a version 2 transfer transaction (Mosaic transfer).
 * Type code: 0x101 (257)
 */
model TransferTransactionV2 extends TransactionBase {
  /** Transaction type must be 0x101 (257). */
  @doc("Transaction type must be 0x101 (257).")
  type: 257;

  /** Recipient account address. */
  @doc("Recipient account address.")
  @pattern("^[T|N][A-Z0-9]{39}$")
  recipient: string;

  /** Optional message payload. */
  @doc("Optional message payload.")
  message?: MessagePayload;

  /** Array of mosaics being transferred. */
  @doc("Array of mosaics being transferred.")
  mosaics: Mosaic[];
}

/**
 * Union type representing either V1 or V2 Transfer Transaction.
 */
union TransferTransaction {
  v1: TransferTransactionV1,
  v2: TransferTransactionV2,
}

/**
 * Represents an importance transfer transaction.
 * Type code: 0x801 (2049)
 */
model ImportanceTransferTransaction extends TransactionBase {
  /** Transaction type must be 0x801 (2049). */
  @doc("Transaction type must be 0x801 (2049).")
  type: 2049;

  /** The mode of the importance transfer (1: Activate, 2: Deactivate). */
  @doc("The mode of the importance transfer (1: Activate, 2: Deactivate).")
  mode: 1 | 2;

  /** The public key of the remote account (hexadecimal string, 64 chars). */
  @doc("The public key of the remote account (hexadecimal string, 64 chars).")
  @pattern("^[a-f0-9]{64}$")
  remoteAccount: string;
}

/**
 * Represents a modification to a multisig account's cosignatories.
 */
model MultisigCosignatoryModification {
  /** The type of modification (1: Add, 2: Delete). */
  @doc("The type of modification (1: Add, 2: Delete).")
  modificationType: 1 | 2;

  /** The public key of the cosignatory account (hexadecimal string, 64 chars). */
  @doc("The public key of the cosignatory account (hexadecimal string, 64 chars).")
  @pattern("^[a-f0-9]{64}$")
  cosignatoryAccount: string;
}

/**
 * Represents a modification to the minimum number of cosignatories required for a multisig account.
 */
model MultisigMinimumCosignatoriesModification {
  /** Value indicating the relative change of the minimum cosignatories. */
  @doc("Value indicating the relative change of the minimum cosignatories.")
  relativeChange: int32;
}

/**
 * Represents a multisig aggregate modification transaction.
 * Type code: 0x1001 (4097)
 */
model MultisigAggregateModificationTransaction extends TransactionBase {
  /** Transaction type must be 0x1001 (4097). */
  @doc("Transaction type must be 0x1001 (4097).")
  type: 4097;

  /** Array of multisig cosignatory modifications. */
  @doc("Array of multisig cosignatory modifications.")
  modifications: MultisigCosignatoryModification[];

  /** JSON object that holds the minimum cosignatories modification. */
  @doc("JSON object that holds the minimum cosignatories modification.")
  minCosignatories?: MultisigMinimumCosignatoriesModification;
}

/**
 * Represents a multisig signature transaction.
 * Type code: 0x1002 (4098)
 */
model MultisigSignatureTransaction extends TransactionBase {
  /** Transaction type must be 0x1002 (4098). */
  @doc("Transaction type must be 0x1002 (4098).")
  type: 4098;

  /** The hash of the inner transaction of the corresponding multisig transaction. */
  @doc("The hash of the inner transaction of the corresponding multisig transaction.")
  otherHash: TransactionHash;

  /** The address of the corresponding multisig account. */
  @doc("The address of the corresponding multisig account.")
  @pattern("^[T|N][A-Z0-9]{39}$")
  otherAccount: string;
}

/**
 * Represents a multisig transaction.
 * Type code: 0x1003 (4099)
 */
model MultisigTransaction extends TransactionBase {
  /** Transaction type must be 0x1003 (4099). */
  @doc("Transaction type must be 0x1003 (4099).")
  type: 4099;

  /**
   * The inner transaction. Can be a TransferTransaction, ImportanceTransferTransaction,
   * or MultisigAggregateModificationTransaction. The inner transaction does not have
   * a valid signature.
   */
  @doc("The inner transaction. Can be a TransferTransaction, ImportanceTransferTransaction, or MultisigAggregateModificationTransaction. The inner transaction does not have a valid signature.")
  otherTrans: TransferTransaction | ImportanceTransferTransaction | MultisigAggregateModificationTransaction | unknown;

  /** The JSON array of MultisigSignatureTransaction objects. */
  @doc("The JSON array of MultisigSignatureTransaction objects.")
  signatures: MultisigSignatureTransaction[];
}

/**
 * Structure containing transaction data and its meta data.
 */
model TransactionMetaDataPair {
  /** The meta data of the transaction. */
  @doc("The meta data of the transaction.")
  meta: TransactionMetaData;

  /** The actual transaction object. The specific type depends on the transaction type field within. */
  @doc("The actual transaction object. The specific type depends on the transaction type field within.")
  transaction: TransferTransaction | ImportanceTransferTransaction | MultisigAggregateModificationTransaction | MultisigSignatureTransaction | MultisigTransaction | unknown;
}

/**
 * Represents meta data for an unconfirmed transaction.
 */
model UnconfirmedTransactionMetaData {
  /** The database id of the transaction. */
  @doc("The database id of the transaction.")
  id: int32;

  /** The hash of the transaction. */
  @doc("The hash of the transaction.")
  hash: TransactionHash;
}

/**
 * Represents a pair of unconfirmed transaction and its meta data.
 */
model UnconfirmedTransactionMetaDataPair {
  /** Contains the unconfirmed transaction meta data object. */
  @doc("Contains the unconfirmed transaction meta data object.")
  meta: UnconfirmedTransactionMetaData;

  /** Contains the transaction object. The specific type depends on the transaction type field within. */
  @doc("Contains the transaction object. The specific type depends on the transaction type field within.")
  transaction: TransferTransaction | ImportanceTransferTransaction | MultisigAggregateModificationTransaction | MultisigSignatureTransaction | MultisigTransaction | unknown;
}

/**
 * Represents the message payload within a transaction.
 */
model MessagePayload {
  /** Message type (1: unencrypted, 2: encrypted). */
  @doc("Message type (1: unencrypted, 2: encrypted).")
  type: 1 | 2;

  /** The message content (hexadecimal string). Max 1024 bytes (2048 hex chars). */
  @doc("The message content (hexadecimal string). Max 1024 bytes (2048 hex chars).")
  @maxLength(2048)
  payload: string;
}
