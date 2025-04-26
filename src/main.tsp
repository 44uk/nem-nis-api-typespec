import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

import "./models/index.tsp";

using TypeSpec.Http;
using OpenAPI;

/**
 * NEM NIS API Documentation
 * Version 1.22
 * 15:37, January 15, 2018
 * Based on: https://nemproject.github.io/
 */
@service(#{ title: "NEM NIS API" })
@info(#{ version: "1.22.0" })
@server("http://hachi.nem.ninja:7890", "Nem Nis API")
namespace NEMNISAPI;

using Models;

@tag("nis-status")
@route("/heartbeat")
@get
@summary("Heart beat")
op getHeartbeat(): Body<NemRequestResult>;

@tag("nis-status")
@route("/status")
@get
@summary("Status")
op getStatus(): Body<NemRequestResult>;

@tag("account")
@route("/account/generate")
@get
@summary("Retrieving account data")
op generateAccount(): Body<KeyPairViewModel>;

@tag("account")
@route("/account/get")
@get
@summary("Requesting the account data")
op getAccountInfo(@query(#{ explode: true }) address: string): Body<AccountMetaDataPair>;

@tag("account")
@route("/account/get/from-public-key")
@get
@summary("Requesting the account data (public key)")
op getAccountInfoFromPublicKey(@query(#{ explode: true }) publicKey?: string): Body<AccountMetaDataPair>;

@tag("account")
@route("/account/get/forwarded")
@get
@summary("Requesting the original account data for a delegate account")
op getAccountInfoForwarded(@query(#{ explode: true }) address?: string): Body<AccountMetaDataPair>;

@tag("account")
@route("/account/get/forwarded/from-public-key")
@get
@summary("Requesting the original account data for a delegate account (Public key)")
op getAccountInfoForwardedFromPublicKey(@query(#{ explode: true }) publicKey?: string): Body<AccountMetaDataPair>;

@tag("account")
@route("/account/status")
@get
@summary("Requesting the account status")
op getAccountStatus(@query(#{ explode: true }) address?: string): Body<AccountMetaData>;

@tag("account")
@route("/account/transfers/incoming")
@get
@summary("Requesting transaction data for an account (Incoming)")
op getAccountIncomingTransfers(
  @query(#{ explode: true }) address: string,
  @query(#{ explode: true }) hash?: string,
): Body<TransactionMetaDataPair[]>;

@tag("account")
@route("/account/transfers/outgoing")
@get
@summary("Requesting transaction data for an account (Outgoing)")
op getAccountOutgoingTransfers(
  @query(#{ explode: true }) address?: string,
  @query(#{ explode: true }) hash?: string,
): {};

@tag("account")
@route("/account/transfers/all")
@get
@summary("Requesting transaction data for an account (All)")
op getAccountAllTransfers(
  @query(#{ explode: true }) address?: string,
  @query(#{ explode: true }) hash?: string,
): Body<TransactionMetaDataPair[]>;

@tag("account")
@route("/account/unconfirmedTransactions")
@get
@summary("Unconfirmed transactions")
op getAccountUnconfirmedTransactions(@query(#{ explode: true }) address?: string): Body<UnconfirmedTransactionMetaDataPair[]>;

@tag("account")
@route("/account/harvests")
@get
@summary("Requesting harvest info data for an account")
op getAccountHarvests(
  @query(#{ explode: true }) address?: string,
  @query(#{ explode: true }) hash?: string,
): Body<TransactionMetaDataPair[]>;

@tag("account")
@route("/account/importances")
@get
@summary("Retrieving account importances for accounts")
op getAccountImportances(): Body<AccountImportanceViewModel[]>;

@tag("account")
@route("/account/namespace/page")
@get
@summary("Retrieving namespaces that an account owns")
op getAccountNamespaces(
  @query(#{ explode: true }) address?: string,
  @query(#{ explode: true }) parent?: string,
): Body<NamespaceMetaDataPair[]>;

@tag("account")
@route("/account/mosaic/definition/page")
@get
@summary("Retrieving mosaic definitions that an account has created")
op getAccountMosaicDefinitions(
  @query(#{ explode: true }) address?: string,
  @query(#{ explode: true }) parent?: string,
): Body<MosaicDefinitionMetaDataPair[]>;

@tag("account")
@route("/account/mosaic/owned")
@get
@summary("Retrieving mosaics that an account owns")
op getAccountOwnedMosaics(@query(#{ explode: true }) address?: string): Body<Mosaic[]>;

@tag("block-chain")
@route("/chain/height")
@get
@summary("Block chain height")
op getChainHeight(): Body<BlockHeight>;

@tag("block-chain")
@route("/chain/score")
@get
@summary("Block chain score")
op getChainScore(): Body<BlockChainScore>;

@tag("block-chain")
@route("/chain/last-block")
@get
@summary("Last block of the block chain score")
op getChainLastBlock(): Body<Block>;

@tag("block-chain")
@route("/block/get")
@get
@summary("Getting a block with a given hash")
op getBlockByHash(@query(#{ explode: true }) blockHash?: string): Body<Block>;

@tag("node")
@route("/node/info")
@get
@summary("Basic node information")
op getNodeInfo(): Body<Node>;

@tag("node")
@route("/node/extended-info")
@get
@summary("Extended node information")
op getNodeExtendedInfo(): Body<NisNodeInfo>;

@tag("node")
@route("/node/peer-list/all")
@get
@summary("Complete neighborhood")
op getAllNodePeers(): Body<NodeCollection>;

@tag("node")
@route("/node/peer-list/reachable")
@get
@summary("Reachable neighborhood")
op getReachableNodePeers(): Body<NodeCollection>;

@tag("node")
@route("/node/peer-list/active")
@get
@summary("Active neighborhood")
op getActiveNodePeers(): Body<NodeCollection>;

@tag("node")
@route("/node/active-peers/max-chain-height")
@get
@summary("Maximum chain height in the active neighborhood")
op getActivePeersMaxChainHeight(): Body<BlockHeight>;

@tag("node")
@route("/node/experiences")
@get
@summary("Requesting node experiences")
op getNodeExperiences(): Body<ExtendedNodeExperiencePair[]>;

@tag("namespaces-and-mosaics")
@route("/namespace/roots")
@get
@summary("Retrieving root namespaces")
op getNamespaceRoots(
  @query(#{ explode: true }) id?: integer,
  @query(#{ explode: true }) pageSize?: integer,
): Body<NamespaceMetaDataPair[]>;

@tag("namespaces-and-mosaics")
@route("/namespace")
@get
@summary("Retrieving a specific namespace")
op getNamespace(@query(#{ explode: true }) `namespace`?: string): Body<Namespace>;

@tag("namespaces-and-mosaics")
@route("/namespace/mosaic/definition/page")
@get
@summary("Retrieving mosaic definitions")
op getNamespaceMosaicDefinitions(@query(#{ explode: true }) `namespace`?: string): Body<MosaicDefinitionMetaDataPair[]>;

@tag("debug")
@route("/debug/time-synchronization")
@get
@summary("Monitoring the network time")
op getDebugTimeSynchronization(): Body<TimeSynchronizationResult[]>;

@tag("debug")
@route("/debug/connections/incoming")
@get
@summary("Monitoring incoming calls")
op getDebugIncomingConnections(): Body<AuditCollection>;

@tag("debug")
@route("/debug/connections/outgoing")
@get
@summary("Monitoring outgoing calls")
op getDebugOutgoingConnections(): Body<AuditCollection>;

@tag("debug")
@route("/debug/timers")
@get
@summary("Monitoring timers")
op getDebugTimers(): Body<NemAsyncTimerVisitor[]>;

@tag("account")
@route("/account/historical/get")
@get
@summary("Retrieving historical account data")
op getAccountHistoricalData(
  @query(#{ explode: true }) address?: string,
  @query(#{ explode: true }) startHeight?: integer,
  @query(#{ explode: true }) endHeight?: integer,
  @query(#{ explode: true }) increment?: integer,
): Body<AccountHistoricalDataViewModel[]>;

@tag("account")
@route("/local/account/transfers/incoming")
@post
@summary("Incoming transactions with decoded messages")
op getDecodedIncomingTransfers(
  @header contentType: "multipart/form-data",
  @multipartBody body: {
    page?: HttpPart<string>;
  },
): Body<TransactionMetaDataPair[]>;

@tag("account")
@route("/local/account/transfers/outgoing")
@post
@summary("Outgoing transactions with decoded messages")
op getDecodedOutgoingTransfers(
  @header contentType: "multipart/form-data",
  @multipartBody body: {
    page?: HttpPart<string>;
  },
): Body<TransactionMetaDataPair[]>;

@tag("account")
@route("/local/account/transfers/all")
@post
@summary("All transactions with decoded messages")
op getDecodedAllTransfers(
  @header contentType: "multipart/form-data",
  @multipartBody body: {
    page?: HttpPart<string>;
  },
): Body<TransactionMetaDataPair[]>;

@tag("account")
@route("/account/unlock")
@post
@summary("Unlocking the account (enables harvesting)")
op unlockAccount(
  @header contentType: "multipart/form-data",
  @multipartBody body: {
    privateKey?: HttpPart<string>;
  },
): Body<NemRequestResult>;

@tag("account")
@route("/account/lock")
@post
@summary("Locking the account (stops harvesting)")
op lockAccount(
  @header contentType: "multipart/form-data",
  @multipartBody body: {
    privateKey?: HttpPart<string>;
  },
): Body<NemRequestResult>;

@tag("account")
@route("/account/unlocked/info")
@post
@summary("Retrieving the unlock info")
op getAccountUnlockInfo(): Body<NemRequestResult>;

@tag("block-chain")
@route("/block/at/public")
@post
@summary("Getting a block with a given height")
op getBlockAtHeight(
  @header contentType: "multipart/form-data",
  @multipartBody body: {
    blockHeight?: HttpPart<string>;
  },
): Body<Block>;

@tag("block-chain")
@route("/local/chain/blocks-after")
@post
@summary("Getting part of a chain")
op getBlocksAfterHeight(
  @header contentType: "multipart/form-data",
  @multipartBody body: {
    blockHeight?: HttpPart<string>;
  },
): Body<ExplorerBlockViewModel[]>;

@tag("node")
@route("/node/boot")
@post
@summary("Booting the local node")
op bootLocalNode(
  @header contentType: "multipart/form-data",
  @multipartBody body: {
    bootNodeRequest?: HttpPart<string>;
  },
): Body<NemRequestResult>;

@tag("initiating-transactions")
@route("/transaction/prepare-announce")
@post
@summary("Initiating a transaction")
op prepareTransactionAnnounce(
  @header contentType: "multipart/form-data",
  @multipartBody body: {
    requestPrepareAnnounce?: HttpPart<string>;
  },
): Body<NemAnnounceResult>;

@tag("initiating-transactions")
@route("/transaction/announce")
@post
@summary("Sending the data to NIS")
op announceTransaction(
  @header contentType: "multipart/form-data",
  @multipartBody body: {
    requestAnnounce?: HttpPart<string>;
  },
): Body<NemAnnounceResult>;
