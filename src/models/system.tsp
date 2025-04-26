import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "./transaction.tsp";

using TypeSpec.Http;

/**
 * Represents an error object returned by NIS.
 */
model ErrorObject {
  /** The number of seconds elapsed since the creation of the nemesis block. */
  @doc("The number of seconds elapsed since the creation of the nemesis block.")
  timeStamp: int32;

  /** The general description of the error. */
  @doc("The general description of the error.")
  error: string;

  /** The detailed error message. */
  @doc("The detailed error message.")
  message: string;

  /** The HTTP status code. */
  @doc("The HTTP status code.")
  status: int32;
}

/**
 * Represents the result of a NEM request, typically used for validation or status.
 */
model NemRequestResult {
  /** The type of the result (1: validation, 2: heart beat, 4: status). */
  @doc("The type of the result (1: validation, 2: heart beat, 4: status).")
  type: 1 | 2 | 4;

  /** The code of the result. Interpretation depends on the type. */
  @doc("The code of the result. Interpretation depends on the type.")
  code: int32;

  /** A human-readable message describing the result. */
  @doc("A human-readable message describing the result.")
  message: string;
}

/**
 * Represents the result of announcing a transaction.
 * Extends NemRequestResult with transaction hash information.
 */
model NemAnnounceResult extends NemRequestResult {
  /** The hash object of the transaction. */
  @doc("The hash object of the transaction.")
  transactionHash: TransactionHash;

  /** The hash object of the inner transaction or null if the transaction is not a multisig transaction. */
  @doc("The hash object of the inner transaction or null if the transaction is not a multisig transaction.")
  innerTransactionHash?: TransactionHash | null;
}

/**
 * Contains information about network time stamps for communication.
 */
model CommunicationTimeStamps {
  /** The network time at the moment the reply was sent (seconds elapsed since nemesis block). */
  @doc("The network time at the moment the reply was sent (seconds elapsed since nemesis block).")
  sendTimeStamp: int64;

  /** The network time at the moment the request was received (seconds elapsed since nemesis block). */
  @doc("The network time at the moment the request was received (seconds elapsed since nemesis block).")
  receiveTimeStamp: int64;
}

/**
 * Represents information about an audited request.
 */
model AuditInfo {
  /** The relative URL path of the request. */
  @doc("The relative URL path of the request.")
  path: string;

  /** The number of seconds elapsed since the creation of the nemesis block when the request was received. */
  @doc("The number of seconds elapsed since the creation of the nemesis block when the request was received.")
  startTime: int32;

  /** The host which initiated the request. */
  @doc("The host which initiated the request.")
  host: string;

  /** The time in seconds that has elapsed since the request was received. */
  @doc("The time in seconds that has elapsed since the request was received.")
  elapsedTime: int32;

  /** The unique id of the request. */
  @doc("The unique id of the request.")
  id: int32;
}

/**
 * Represents a collection of audited requests for debug purposes.
 */
model AuditCollection {
  /** Array containing information about outstanding (not yet processed) requests. */
  @doc("Array containing information about outstanding (not yet processed) requests.")
  outstanding: AuditInfo[];

  /** Array containing information about the most recent requests. */
  @doc("Array containing information about the most recent requests.")
  "most-recent": AuditInfo[];
}

/**
 * Contains information about a periodic task timer for monitoring.
 */
model NemAsyncTimerVisitor {
  /** The number of milliseconds since the last execution of the timer. */
  @doc("The number of milliseconds since the last execution of the timer.")
  "last-delay-time": int64;

  /** The number of times the task was executed. */
  @doc("The number of times the task was executed.")
  executions: int32;

  /** The number times the task failed. */
  @doc("The number times the task failed.")
  failures: int32;

  /** The number times the task was successful. */
  @doc("The number times the task was successful.")
  successes: int32;

  /** The time at which the task started last time (seconds elapsed since nemesis block). */
  @doc("The time at which the task started last time (seconds elapsed since nemesis block).")
  "last-operation-start-time": int64;

  /** True if the task is executing, false otherwise. */
  @doc("True if the task is executing, false otherwise.")
  "is-executing": boolean;

  /** The name of the task. */
  @doc("The name of the task.")
  name: string;

  /** The number of seconds the task needed on average. */
  @doc("The number of seconds the task needed on average.")
  "average-operation-time": float64;

  /** The number of seconds the task needed the last time. */
  @doc("The number of seconds the task needed the last time.")
  "last-operation-time": float64;
}

/**
 * Represents the result of a network time synchronization.
 */
model TimeSynchronizationResult {
  /** The date and time when the synchronization was performed (string format). */
  @doc("The date and time when the synchronization was performed (string format).")
  dateTime: string;

  /** The current offset to the local computer clock in milliseconds. */
  @doc("The current offset to the local computer clock in milliseconds.")
  currentTimeOffset: int64;

  /** The change in milliseconds compared to the last synchronization. */
  @doc("The change in milliseconds compared to the last synchronization.")
  change: int32;
}

/**
 * Contains data needed to retrieve a set of transactions using a private key.
 * Use only when NIS is running locally.
 */
model AccountPrivateKeyTransactionsPage {
  /** The private key as hexadecimal string (64 chars). */
  @doc("The private key as hexadecimal string (64 chars).")
  @pattern("^[a-f0-9]{64}$")
  value: string;

  /** The optional hash value (hexadecimal string, 64 chars). */
  @doc("The optional hash value (hexadecimal string, 64 chars).")
  @pattern("^[a-f0-9]{64}$")
  hash?: string;

  /** The optional transaction id. */
  @doc("The optional transaction id.")
  id?: string;
}

/**
 * Represents a private key.
 */
model PrivateKey {
  /** The private key as hexadecimal string (64 chars). */
  @doc("The private key as hexadecimal string (64 chars).")
  @pattern("^[a-f0-9]{64}$")
  value: string;
}
