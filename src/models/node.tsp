import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

using TypeSpec.Http;

/**
 * Represents meta data for a node.
 */
model NodeMetaData {
  /** The number of features the node has. */
  @doc("The number of features the node has.")
  features: int32;

  /** The network id (104: mainnet, 96: mijin, 152: testnet). */
  @doc("The network id (104: mainnet, 96: mijin, 152: testnet).")
  networkId: int32;

  /** The name of the application that is running the node. */
  @doc("The name of the application that is running the node.")
  application: string;

  /** The version of the application. */
  @doc("The version of the application.")
  version: string;

  /** The underlying platform (OS, java version). */
  @doc("The underlying platform (OS, java version).")
  platform: string;
}

/**
 * Represents the endpoint information for a node.
 */
model NodeEndpoint {
  /** The protocol used for communication (HTTP or HTTPS). */
  @doc("The protocol used for communication (HTTP or HTTPS).")
  protocol: "http" | "https";

  /** The port used for communication. */
  @doc("The port used for communication.")
  port: int32;

  /** The IP address or hostname of the endpoint. */
  @doc("The IP address or hostname of the endpoint.")
  host: string;
}

/**
 * Represents the identity information for a node.
 */
model NodeIdentity {
  /** The name of the node. */
  @doc("The name of the node.")
  name: string;

  /** The public key used to identify the node (hexadecimal string, 64 chars). */
  @doc("The public key used to identify the node (hexadecimal string, 64 chars).")
  @pattern("^[a-f0-9]{64}$")
  "public-key": string;
}

/**
 * Represents a node in the NEM network.
 */
model Node {
  /** Meta data for the node. */
  @doc("Meta data for the node.")
  metaData: NodeMetaData;

  /** Endpoint information for the node. */
  @doc("Endpoint information for the node.")
  endpoint: NodeEndpoint;

  /** Identity information for the node. */
  @doc("Identity information for the node.")
  identity: NodeIdentity;
}

/**
 * Represents the communication experience with a remote node.
 */
model NodeExperience {
  /** The number of successful communications with the remote node. */
  @doc("The number of successful communications with the remote node.")
  s: int32;

  /** The number of failed communications with the remote node. */
  @doc("The number of failed communications with the remote node.")
  f: int32;
}

/**
 * Represents a pair of a node and its communication experience.
 */
model ExtendedNodeExperiencePair {
  /** The remote Node object. */
  @doc("The remote Node object.")
  node: Node;

  /** The number of synchronization attempts the node had with the remote node. */
  @doc("The number of synchronization attempts the node had with the remote node.")
  syncs: int32;

  /** The communication experience with the remote node. */
  @doc("The communication experience with the remote node.")
  experience: NodeExperience;
}

/**
 * Holds arrays of nodes with different statuses.
 */
model NodeCollection {
  /** Array of inactive nodes. */
  @doc("Array of inactive nodes.")
  inactive: Node[];

  /** Array of active nodes. */
  @doc("Array of active nodes.")
  active: Node[];

  /** Array of busy nodes. */
  @doc("Array of busy nodes.")
  busy: Node[];

  /** Array of failing nodes. */
  @doc("Array of failing nodes.")
  failure: Node[];
}

/**
 * Provides detailed information about a NIS node.
 */
model NisNodeInfo {
  /** Contains the node object. */
  @doc("Contains the node object.")
  node: Node;

  /** Contains the application meta data substructure. */
  @doc("Contains the application meta data substructure.")
  nisInfo: ApplicationMetaData;
}

/**
 * Represents application meta data (e.g., NIS version).
 */
model ApplicationMetaData {
  /** The version of the NIS application. */
  @doc("The version of the NIS application.")
  version?: string;

  /** The build of the NIS application. */
  @doc("The build of the NIS application.")
  build?: string;

  /** The start time of the NIS application. */
  @doc("The start time of the NIS application.")
  startTime?: string;

  /** The current time of the NIS application. */
  @doc("The current time of the NIS application.")
  currentTime?: string;
}

/**
 * Represents meta data for a boot node request.
 */
model BootNodeMetaData {
  /** The application name (e.g., "NIS"). */
  @doc("The application name (e.g., \"NIS\").")
  application: string;
}

/**
 * Represents the endpoint information for a boot node request.
 */
model BootNodeEndpoint {
  /** The protocol (e.g., "http"). */
  @doc("The protocol (e.g., \"http\").")
  protocol: string;

  /** The port number. */
  @doc("The port number.")
  port: int32;

  /** The host address or name. */
  @doc("The host address or name.")
  host: string;
}

/**
 * Represents the identity information for a boot node request.
 */
model BootNodeIdentity {
  /** The private key as hexadecimal string (64 chars). */
  @doc("The private key as hexadecimal string (64 chars).")
  @pattern("^[a-f0-9]{64}$")
  "private-key": string;

  /** The name of the node. */
  @doc("The name of the node.")
  name: string;
}

/**
 * Represents a request to boot a local node.
 */
model BootNodeRequest {
  /** Meta data for the boot node request. */
  @doc("Meta data for the boot node request.")
  metaData: BootNodeMetaData;

  /** Endpoint information for the boot node request. */
  @doc("Endpoint information for the boot node request.")
  endpoint: BootNodeEndpoint;

  /** Identity information for the boot node request. */
  @doc("Identity information for the boot node request.")
  identity: BootNodeIdentity;
}
