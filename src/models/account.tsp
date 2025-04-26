import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

using TypeSpec.Http;

/**
 * Account information structure.
 */
model AccountInfo {
  /** The account address. Base32 encoded, 40 characters. Starts with 'T' (testnet) or 'N' (mainnet). */
  @doc("The account address. Base32 encoded, 40 characters. Starts with 'T' (testnet) or 'N' (mainnet).")
  @pattern("^[T|N][A-Z0-9]{39}$")
  address: string;

  /** The public key of the account (hexadecimal string, 64 characters). Null if the account has not published any transaction. */
  @doc("The public key of the account (hexadecimal string, 64 characters). Null if the account has not published any transaction.")
  @pattern("^[a-f0-9]{64}$")
  publicKey?: string | null;

  /** The account balance in micro NEM (integer). */
  @doc("The account balance in micro NEM (integer).")
  balance: int64;

  /** The vested part of the balance in micro NEM (integer). */
  @doc("The vested part of the balance in micro NEM (integer).")
  vestedBalance: int64;

  /** The importance score for the account (decimal number between 0 and 1). */
  @doc("The importance score for the account (decimal number between 0 and 1).")
  @minValue(0)
  @maxValue(1)
  importance: float64;

  /** The number of blocks harvested by the account (integer, non-negative). */
  @doc("The number of blocks harvested by the account (integer, non-negative).")
  @minValue(0)
  harvestedBlocks: int32;

  /** Account label (currently unused, always null in spec). */
  @doc("Account label (currently unused, always null in spec).")
  label?: string | null;
}

/**
 * Represents the importance details of an account.
 */
model AccountImportance {
  /** Indicates if the score, ev, and height fields are available (0 or 1). */
  @doc("Indicates if the score, ev, and height fields are available (0 or 1).")
  isSet: 0 | 1;

  /** The importance of the account (decimal number between 0 and 1). Available if isSet is 1. */
  @doc("The importance of the account (decimal number between 0 and 1). Available if isSet is 1.")
  @minValue(0)
  @maxValue(1)
  score?: float64;

  /** The page rank portion of the importance (decimal number between 0 and 1). Available if isSet is 1. */
  @doc("The page rank portion of the importance (decimal number between 0 and 1). Available if isSet is 1.")
  @minValue(0)
  @maxValue(1)
  ev?: float64;

  /** The height at which the importance calculation was performed. Available if isSet is 1. */
  @doc("The height at which the importance calculation was performed. Available if isSet is 1.")
  @minValue(1)
  height?: int64;
}

/**
 * Represents an account's importance information.
 */
model AccountImportanceViewModel {
  /** The address of the account. */
  @doc("The address of the account.")
  @pattern("^[T|N][A-Z0-9]{39}$")
  address: string;

  /** Substructure that describes the importance of the account. */
  @doc("Substructure that describes the importance of the account.")
  importance: AccountImportance;
}

/**
 * Represents historical account data at a specific height.
 */
model AccountHistoricalDataViewModel {
  /** The height for which the data is valid. */
  @doc("The height for which the data is valid.")
  @minValue(1)
  height: int64;

  /** The address of the account. */
  @doc("The address of the account.")
  @pattern("^[T|N][A-Z0-9]{39}$")
  address: string;

  /** The balance of the account in micro NEM. */
  @doc("The balance of the account in micro NEM.")
  balance: int64;

  /** The vested part of the balance in micro NEM. */
  @doc("The vested part of the balance in micro NEM.")
  vestedBalance: int64;

  /** The unvested part of the balance in micro NEM. */
  @doc("The unvested part of the balance in micro NEM.")
  unvestedBalance: int64;

  /** The importance of the account (decimal number between 0 and 1). */
  @doc("The importance of the account (decimal number between 0 and 1).")
  @minValue(0)
  @maxValue(1)
  importance: float64;

  /** The page rank part of the importance (decimal number between 0 and 1). */
  @doc("The page rank part of the importance (decimal number between 0 and 1).")
  @minValue(0)
  @maxValue(1)
  pageRank: float64;
}

/**
 * Represents the meta data of an account, including harvesting status and multisig information.
 */
model AccountMetaData {
  /** The harvesting status of the account. */
  @doc("The harvesting status of the account.")
  status: string;

  /** The status of remote harvesting. */
  @doc("The status of remote harvesting.")
  remoteStatus: string;

  /** Array of AccountInfo structures that describe the multisig accounts that this account is cosignatory of. */
  @doc("Array of AccountInfo structures that describe the multisig accounts that this account is cosignatory of.")
  cosignatoryOf: AccountInfo[];
}

/**
 * Represents a pair of account information and its meta data.
 */
model AccountMetaDataPair {
  /** Contains the account object. */
  @doc("Contains the account object.")
  account: AccountInfo;

  /** Contains the account meta data object. */
  @doc("Contains the account meta data object.")
  meta: AccountMetaData;
}

/**
 * Contains information about a new account's key pair and address.
 */
model KeyPairViewModel {
  /** The private key of the account as hexadecimal string (64 chars). */
  @doc("The private key of the account as hexadecimal string (64 chars).")
  @pattern("^[a-f0-9]{64}$")
  privateKey: string;

  /** The public key of the account as hexadecimal string (64 chars). */
  @doc("The public key of the account as hexadecimal string (64 chars).")
  @pattern("^[a-f0-9]{64}$")
  publicKey: string;

  /** The address of the account. */
  @doc("The address of the account.")
  @pattern("^[T|N][A-Z0-9]{39}$")
  address: string;
}
