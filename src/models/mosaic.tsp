import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

using TypeSpec.Http;

/**
 * Represents a mosaic identifier.
 */
model MosaicId {
  /** The namespace id of the mosaic. */
  @doc("The namespace id of the mosaic.")
  namespaceId: string;

  /** The name of the mosaic within the namespace. */
  @doc("The name of the mosaic within the namespace.")
  name: string;
}

/**
 * Represents an instance of a mosaic.
 */
model Mosaic {
  /** The mosaic id. */
  @doc("The mosaic id.")
  mosaicId: MosaicId;

  /** The mosaic quantity in smallest units. */
  @doc("The mosaic quantity in smallest units.")
  quantity: int64;
}

/**
 * Represents a mosaic levy (additional fee on transfer).
 */
model MosaicLevy {
  /** The levy type (1: absolute fee, 2: percentile fee). */
  @doc("The levy type (1: absolute fee, 2: percentile fee).")
  type: 1 | 2;

  /** The recipient account address of the levy. */
  @doc("The recipient account address of the levy.")
  @pattern("^[T|N][A-Z0-9]{39}$")
  recipient: string;

  /** The mosaic in which the levy is paid. */
  @doc("The mosaic in which the levy is paid.")
  mosaicId: MosaicId;

  /** The fee quantity. Interpretation depends on the levy type. */
  @doc("The fee quantity. Interpretation depends on the levy type.")
  fee: int64;
}

/**
 * Represents a mosaic property.
 */
model MosaicProperty {
  /** The name of the property (e.g., "divisibility", "initialSupply", "supplyMutable", "transferable"). */
  @doc("The name of the property (e.g., \"divisibility\", \"initialSupply\", \"supplyMutable\", \"transferable\").")
  name: string;

  /** The value of the property. */
  @doc("The value of the property.")
  value: string;
}

/**
 * Represents a mosaic definition.
 */
model MosaicDefinition {
  /** The public key of the mosaic definition creator (hexadecimal string, 64 chars). */
  @doc("The public key of the mosaic definition creator (hexadecimal string, 64 chars).")
  @pattern("^[a-f0-9]{64}$")
  creator: string;

  /** The description of the mosaic. */
  @doc("The description of the mosaic.")
  description: string;

  /** The identifier of the mosaic. */
  @doc("The identifier of the mosaic.")
  id: MosaicId;

  /** Array of mosaic properties. */
  @doc("Array of mosaic properties.")
  properties: MosaicProperty[];

  /** The optional levy for the mosaic. */
  @doc("The optional levy for the mosaic.")
  levy?: MosaicLevy;
}

/**
 * Represents meta data for a mosaic definition.
 */
model MosaicDefinitionMetaData {
  /** The id for the mosaic definition object. */
  @doc("The id for the mosaic definition object.")
  id: int32;
}

/**
 * Represents a pair of mosaic definition and its meta data.
 */
model MosaicDefinitionMetaDataPair {
  /** Contains the mosaic definition meta data object. */
  @doc("Contains the mosaic definition meta data object.")
  meta: MosaicDefinitionMetaData;

  /** Contains the mosaic definition object. */
  @doc("Contains the mosaic definition object.")
  mosaic: MosaicDefinition;
}
