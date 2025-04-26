import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";

using TypeSpec.Http;

// Re-export all models by explicitly naming them
namespace Models;

// Account models
model AccountInfo {}
model AccountImportance {}
model AccountImportanceViewModel {}
model AccountHistoricalDataViewModel {}
model AccountMetaData {}
model AccountMetaDataPair {}
model KeyPairViewModel {}

// Transaction models
model TransactionHash {}
model TransactionMetaData {}
model TransactionBase {}
model TransferTransactionV1 {}
model TransferTransactionV2 {}
union TransferTransaction {}
model ImportanceTransferTransaction {}
model MultisigCosignatoryModification {}
model MultisigMinimumCosignatoriesModification {}
model MultisigAggregateModificationTransaction {}
model MultisigSignatureTransaction {}
model MultisigTransaction {}
model TransactionMetaDataPair {}
model UnconfirmedTransactionMetaData {}
model UnconfirmedTransactionMetaDataPair {}
model MessagePayload {}

// Blockchain models
model BlockChainScore {}
model BlockHeight {}
model HarvestInfo {}
model Block {}
model ExplorerBlockViewModel {}
model ExplorerTransferViewModel {}

// Mosaic models
model MosaicId {}
model Mosaic {}
model MosaicLevy {}
model MosaicProperty {}
model MosaicDefinition {}
model MosaicDefinitionMetaData {}
model MosaicDefinitionMetaDataPair {}

// Namespace models
model Namespace {}
model NamespaceMetaData {}
model NamespaceMetaDataPair {}
model ProvisionNamespaceTransaction {}

// Node models
model NodeMetaData {}
model NodeEndpoint {}
model NodeIdentity {}
model Node {}
model NodeExperience {}
model ExtendedNodeExperiencePair {}
model NodeCollection {}
model NisNodeInfo {}
model ApplicationMetaData {}
model BootNodeMetaData {}
model BootNodeEndpoint {}
model BootNodeIdentity {}
model BootNodeRequest {}

// System models
model ErrorObject {}
model NemRequestResult {}
model NemAnnounceResult {}
model CommunicationTimeStamps {}
model AuditInfo {}
model AuditCollection {}
model TimeSynchronizationResult {}
model AccountPrivateKeyTransactionsPage {}
model PrivateKey {}
model NemAsyncTimerVisitor {}
