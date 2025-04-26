import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "./transaction.tsp";

using TypeSpec.Http;

/**
 * Represents a NEM namespace.
 */
model Namespace {
  /** The fully qualified name of the namespace (namespace id). */
  @doc("The fully qualified name of the namespace (namespace id).")
  fqn: string;

  /** The owner account address of the namespace. */
  @doc("The owner account address of the namespace.")
  @pattern("^[T|N][A-Z0-9]{39}$")
  owner: string;

  /** The height at which the ownership begins. */
  @doc("The height at which the ownership begins.")
  @minValue(1)
  height: int64;
}

/**
 * Represents meta data for a namespace.
 */
model NamespaceMetaData {
  /** The database id for the namespace object. */
  @doc("The database id for the namespace object.")
  id: int32;
}

/**
 * Represents a pair of namespace and its meta data.
 */
model NamespaceMetaDataPair {
  /** Contains the namespace meta data object. */
  @doc("Contains the namespace meta data object.")
  meta: NamespaceMetaData;

  /** Contains the namespace object. */
  @doc("Contains the namespace object.")
  namespaceInfo: Namespace;
}

/**
 * Represents a provision namespace transaction.
 * Type code: 0x2001 (8193)
 */
model ProvisionNamespaceTransaction extends TransactionBase {
  /** Transaction type must be 0x2001 (8193). */
  @doc("Transaction type must be 0x2001 (8193).")
  type: 8193;

  /** The public key of the account to which the rental fee is transferred (hexadecimal string, 64 chars). */
  @doc("The public key of the account to which the rental fee is transferred (hexadecimal string, 64 chars).")
  @pattern("^[a-f0-9]{64}$")
  rentalFeeSink: string;

  /** The fee for renting the namespace in micro NEM. */
  @doc("The fee for renting the namespace in micro NEM.")
  rentalFee: int64;

  /** The new part which is concatenated to the parent with a '.' as separator. */
  @doc("The new part which is concatenated to the parent with a '.' as separator.")
  newPart: string;

  /** The parent namespace. This can be null if the transaction rents a root namespace. */
  @doc("The parent namespace. This can be null if the transaction rents a root namespace.")
  parent?: string | null;
}
