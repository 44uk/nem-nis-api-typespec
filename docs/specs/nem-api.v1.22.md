NEM NIS API Documentation

Version 1.22

15:37, January 15, 2018

Contents

1.  [Introduction](#introduction)
    1.  [General Information](#general-information)
    2.  [Installation](#installation)
    3.  [Requests](#requests)
2.  [NIS status related requests](#NIS-status-related-requests)
    1.  [Heart beat request](#heart-beat-request)
    2.  [Status Request](#status-request)
3.  [Account related requests](#account-related-requests)
    1.  [Retrieving account data](#retrieving-account-data)
        1.  [Generating new account data](#generating-new-account-data)
        2.  [Requesting the account data](#requesting-the-account-data)
        3.  [Requesting the original account data for a delegate account](#requesting-the-original-account-data-for-a-delegate-account)
        4.  [Requesting the account status](#requesting-the-account-status)
        5.  [Requesting transaction data for an account](#requesting-transaction-data-for-an-account)
        6.  [Transaction data with decoded messages](#transaction-data-with-decoded-messages)
        7.  [Requesting harvest info data for an account](#requesting-harvest-info-data-for-an-account)
        8.  [Retrieving account importances for accounts](#retrieving-account-importances-for-accounts)
        9.  [Retrieving namespaces that an account owns](#retrieving-namespaces-that-an-account-owns)
        10.  [Retrieving mosaic definitions that an account has created](#retrieving-mosaic-definitions-that-an-account-has-created)
        11.  [Retrieving mosaics that an account owns](#retrieving-mosaics-that-an-account-owns)
        12.  [Locking and unlocking accounts](#locking-and-unlocking-accounts)
        13.  [Retrieving the unlock info](#retrieving-the-unlock-info)
    2.  [Retrieving historical account data](#retrieving-historical-account-data)
4.  [Block chain related requests](#block-chain-related-requests)
    1.  [Requesting the block chain status information](#requesting-the-block-chain-status-information)
        1.  [Block chain height](#block-chain-height)
        2.  [Block chain score](#block-chain-score)
        3.  [Last block of the block chain score](#last-block-of-the-block-chain-score)
    2.  [Requesting parts of the block chain](#requesting-parts-of-the-block-chain)
        1.  [Getting a block with a given height](#getting-a-block-with-a-given-height)
        2.  [Getting part of a chain](#getting-part-of-a-chain)
5.  [Node related requests](#node-related-requests)
    1.  [Requesting information about a node](#requesting-information-about-a-node)
        1.  [Basic node information](#basic-node-information)
        2.  [Extended node information](#extended-node-information)
    2.  [Request for discovering the neighborhood of a node](#request-for-discovering-the-neighborhood-of-a-node)
        1.  [Complete neighborhood](#complete-neighborhood)
        2.  [Reachable neighborhood](#reachable-neighborhood)
        3.  [Active neighborhood](#active-neighborhood)
        4.  [Maximum chain height in the active neighborhood](#maximum-chain-height-in-the-active-neighborhood)
    3.  [Requesting node experiences](#requesting-node-experiences)
    4.  [Booting the local node](#booting-the-local-node)
6.  [Namespaces and Mosaics](#namespaces-and-mosaics)
    1.  [Namespaces](#namespaces)
        1.  [Retrieving root namespaces](#retrieving-root-namespaces)
        2.  [Retrieving a specific namespace](#retrieving-a-specific-namespace)
    2.  [Mosaics](#mosaics)
        1.  [Retrieving mosaic definitions](#retrieving-mosaic-definitions)
7.  [Initiating transactions](#initiating-transactions)
    1.  [Initiating a transaction](#initiating-a-transaction)
    2.  [Initiating a transfer transaction](#initiating-a-transfer-transaction)
        1.  [Version 1 transfer transactions](#version-1-transfer-transactions)
        2.  [Version 2 transfer transactions](#version-2-transfer-transactions)
    3.  [Converting an account to a multisig account](#converting-an-account-to-a-multisig-account)
    4.  [Initiating a multisig transaction](#initiating-a-multisig-transaction)
        1.  [Cosigning multisig transaction](#cosigning-multisig-transaction)
    5.  [Adding and removing cosignatories](#adding-and-removing-cosignatories)
    6.  [How to use a multisig account](#how-to-use-a-multisig-account)
    7.  [Provisioning a namespace](#provisioning-a-namespace)
    8.  [Creating mosaics](#creating-mosaics)
        1.  [Creating a mosaic definition](#creating-a-mosaic-definition)
        2.  [Altering a mosaic definition](#altering-a-mosaic-definition)
        3.  [Changing the mosaic supply](#changing-the-mosaic-supply)
    9.  [Creating a signed transaction](#creating-a-signed-transaction)
        1.  [Gathering data for the signature](#gathering-data-for-the-signature)
        2.  [Sending the data to NIS](#sending-the-data-to-NIS)
    10.  [Transaction fees](#transaction-fees)
8.  [Requests for additional information from NIS](#requests-for-additional-information-from-NIS)
    1.  [Monitoring the network time](#monitoring-the-network-time)
    2.  [Monitoring incoming and outgoing calls](#monitoring-incoming-and-outgoing-calls)
    3.  [Monitoring timers](#monitoring-timers)
9.  [Appendix A: Description of the JSON Structures](#appendix-A:-description-of-the-JSON-structures)
    1.  [AccountHistoricalDataViewModel](#accountHistoricalDataViewModel)
    2.  [AccountImportanceViewModel](#accountImportanceViewModel)
    3.  [AccountInfo](#accountInfo)
    4.  [AccountMetaData](#accountMetaData)
    5.  [AccountMetaDataPair](#accountMetaDataPair)
    6.  [AccountPrivateKeyTransactionsPage](#accountPrivateKeyTransactionsPage)
    7.  [ApplicationMetaData](#applicationMetaData)
    8.  [AuditCollection](#auditCollection)
    9.  [Block](#block)
    10.  [BlockChainScore](#blockChainScore)
    11.  [BlockHeight](#blockHeight)
    12.  [BootNodeRequest](#bootNodeRequest)
    13.  [CommunicationTimeStamps](#communicationTimeStamps)
    14.  [ExplorerBlockViewModel](#explorerBlockViewModel)
    15.  [ExplorerTransferViewModel](#explorerTransferViewModel)
    16.  [ExtendedNodeExperiencePair](#extendedNodeExperiencePair)
    17.  [HarvestInfo](#harvestInfo)
    18.  [KeyPairViewModel](#keyPairViewModel)
    19.  [Transaction objects](#transaction-objects)
        1.  [ImportanceTransferTransaction](#importanceTransferTransaction)
        2.  [MosaicDefinitionCreationTransaction](#mosaicDefinitionCreationTransaction)
        3.  [MosaicSupplyChangeTransaction](#mosaicSupplyChangeTransaction)
        4.  [MultisigAggregateModificationTransaction](#multisigAggregateModificationTransaction)
        5.  [MultisigCosignatoryModification](#multisigCosignatoryModification)
        6.  [MultisigSignatureTransaction](#multisigSignatureTransaction)
        7.  [MultisigTransaction](#multisigTransaction)
        8.  [ProvisionNamespaceTransaction](#provisionNamespaceTransaction)
        9.  [TransferTransaction](#transferTransaction)
    20.  [Mosaic](#mosaic)
    21.  [MosaicDefinition](#mosaicDefinition)
    22.  [MosaicDefinitionMetaDataPair](#mosaicDefinitionMetaDataPair)
    23.  [MosaicProperties](#mosaicProperties)
    24.  [MosaicLevy](#mosaicLevy)
    25.  [MosaicId](#mosaicId)
    26.  [Namespace](#namespace)
    27.  [NamespaceMetaDataPair](#namespaceMetaDataPair)
    28.  [NemAnnounceResult](#nemAnnounceResult)
    29.  [NemAsyncTimerVisitor](#nemAsyncTimerVisitor)
    30.  [NemRequestResult](#nemRequestResult)
    31.  [NisNodeInfo](#nisNodeInfo)
    32.  [Node](#node)
    33.  [NodeCollection](#nodeCollection)
    34.  [PrivateKey](#privateKey)
    35.  [RequestAnnounce](#requestAnnounce)
    36.  [RequestPrepareAnnounce](#requestPrepareAnnounce)
    37.  [TimeSynchronizationResult](#timeSynchronizationResult)
    38.  [TransactionMetaData](#transactionMetaData)
    39.  [TransactionMetaDataPair](#transactionMetaDataPair)
    40.  [UnconfirmedTransactionMetaData](#unconfirmedTransactionMetaData)
    41.  [UnconfirmedTransactionMetaDataPair](#unconfirmedTransactionMetaDataPair)
    42.  [Error object](#error-object)
10.  [Appendix B: NIS Errors](#appendix-B:-NIS-errors)
    1.  [Error messages](#error-messages)

* * *

#### Changes since 1.21

*   Cosmetic fixes in examples in various queries (outdated data)

#### Changes since 1.20

*   Updated the fees to reflect the second fee fork.

#### Changes since 1.19

*   Fixed descriptions of namespace and mosaic transactions. Message payload size.

#### Changes since 1.18

*   Updated the fee table.

#### Changes since 1.17

*   Corrected the API paths for the namespace and mosaic requests in several places.

#### Changes since 1.16

*   Added JSON structures for [Mosaic](#mosaic), [MosaicDefinition](#mosaicDefinition), [MosaicDefinitionMetaDataPair](#mosaicDefinitionMetaDataPair), [MosaicProperties](#mosaicProperties), [MosaicLevy](#mosaicLevy), [MosaicId](#mosaicId), [Namespace](#namespace) and [NamespaceMetaDataPair](#namespaceMetaDataPair).
*   Added or updated JSON structures for [MosaicDefinitionCreationTransaction](#mosaicDefinitionCreationTransaction), [MosaicSupplyChangeTransaction](#mosaicSupplyChangeTransaction), [ProvisionNamespaceTransaction](#provisionNamespaceTransaction) and [TransferTransaction](#transferTransaction)
*   Added chapters [Namespaces](#namespaces) and [Mosiacs](#mosaics) to introduce the concept of NEM namespaces and mosaics.
*   Added chapters [Provisioning a namespace](#provisioning-a-namespace) and [Creating mosaics](#creating-mosaics).
*   Updated chapter [Initiating a transfer transaction](#initiating-a-transfer-transaction).
*   Added chapters [Retrieving namespaces that an account owns](#retrieving-namespaces-that-a-account-owns), [Retrieving mosaic definitions that an account has created](#retrieving-mosaic-definitions-that-an-account-has-created) and [Retrieving mosaics that an account owns](#retrieving-mosaics-that-an-account-owns)
*   Added chapters [Retrieving root namespaces](#retrieving-root-namespaces), [Retrieving a specific namespace](#retrieving-a-specific-namespace) and [Retrieving mosaic definitions](#retrieving-mosaic-definitions)
*   Updated chapter [Gathering data for the signature](#gathering-data-for-the-signature) by adding the [TransferTransaction](#transferTransaction) version 2 fields and adding the new transactions [ProvisionNamespaceTransaction](#provisionNamespaceTransaction), [MosaicDefinitionCreationTransaction](#mosaicDefinitionCreationTransaction) and [MosaicSupplyChangeTransaction](#mosaicSupplyChangeTransaction).
*   Added new validation failure messages for namespace and mosaic validation

#### Changes since 1.15

*   updated chapter 6.8 to reflect correct fee calculation for aggregate modification transactions.

#### Changes since 1.14

*   updated chapter 6.3, 6.5 and appendix A 8.19.2 to reflect that aggregate modification transactions need to have version 2.

#### Changes since 1.13

*   added chapter 3.1.10 [Retrieving the unlock info](#retrieving-the-unlock-info)

#### Changes since 1.12

*   updated chapter 6.3 - 6.5 to reflect the m of n multisig account changes
*   updated chapter 6.7.1 to reflect the m of n multisig account changes
*   updated structure [MultisigAggregateModificationTransaction](#multisigAggregateModificationTransaction)
*   replaced table tag with fields tag
*   updated structures that have changed
*   added missing error messages

#### Changes since 1.11

*   updated chapter 3.1.2 [Requesting the account data](#requesting-the-account-data)
*   added chapter 3.1.3 [Requesting the original account data for a delegate account](#requesting-the-original-account-data-for-a-delegate-account)
*   updated structure [AccountInfo](#accountInfo)

#### Changes since 1.10

*   added chapter 3.2 [Retrieving historical account data](#retrieving-historical-account-data)
*   added structure [AccountHistoricalDataViewModel](#accountHistoricalDataViewModel)

#### Changes since 1.9

*   corrected the fee formula for aggregate modification transactions in the fee table

#### Changes since 1.8

*   updated document to reflect the possible versions (main and test network) of the block and transactions structures
*   updated structure [Node](#node)

#### Changes since 1.7

*   added chapter 6.7 [Creating a signed transaction](#creating-a-signed-transaction) and added structure [RequestAnnounce](#requestAnnounce)
*   updated structures [TransactionMetaData](#transactionMetaData), [NemAnnounceResult](#nemAnnounceResult)

#### Changes since 1.6

*   added table with [transaction fees](#transaction-fees)
*   fixed description of [RequestPrepareAnnounce](#requestPrepareAnnounce)

#### Changes since 1.5

*   added [Generating new account data](#generating-new-account-data)
*   updated [Requesting the account data](#requesting-the-account-data)
*   updated structures [KeyPairViewModel](#keyPairViewModel), [AccountMetaData](#accountMetaData)

* * *

Introduction
------------

General Information
-------------------

The NEM Infrastructure Server (short: NIS) was written in Java. It needs Java 8 to run. It can run with at least 512MB memory for the java virtual machine but we recommend at least 1GB.

Installation
------------

NIS can be installed either via installer using the URL [NEM Infrastructure Server](http://bob.nem.ninja/installer/) or as stand-alone package which is hosted on [http://bob.nem.ninja/](http://bob.nem.ninja/). The installer only supports 64 bit versions of Java. The current stand-alone version as of this writing is [nis-ncc-0.5.13.tgz](http://bob.nem.ninja/nis-ncc-0.5.13.tgz). When using the installer both installation and the start-up of the software is automatic. The stand-alone version needs to be unzipped to a directory of your choice. It is then started by running runNis.bat (windows) or nix.runNis.sh (linux) from the command prompt.

Requests
--------

NIS uses port 7890 to communicate with its clients. It accepts both HTTP GET and POST requests.

Assuming that the NIS is running locally, HTTP GET requests can be executed from a browser and have the form:

[http://127.0.0.1:7890](http://127.0.0.1:7890/)<path to API request>?<parameters> for example:

[http://127.0.0.1:7890/account/get?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS](http://127.0.0.1:7890/account/get?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS)

HTTP POST request usually cannot be executed from within the browser unless you use a plugin which is able to do it. HTTP POST requests use JSON structures in the request body to supply data to NIS.

Both request types return (if any data is returned) data using JSON structures. [Appendix A: Description of the JSON Structures](#appendix-A:-description-of-the-JSON-structures) explains all JSON structures used in this document.

There are two requests by which you can get information about the status of NIS. The /heartbeat request gives you information if the node is up and responsive. The /status request gives more detailed information about the state of NIS. Both requests return a NemRequestResult object. See _Appendix A:_ [NemRequestResult](#nemRequestResult) for more details on the interpretation of a NemRequestResult.

Heart beat request
------------------


|API path: |Request type: GET|
|----------|-----------------|
|/heartbeat|                 |


#### Description:

Determines if NIS is up and responsive.

#### No Parameter:

#### Example:

[http://127.0.0.1:7890/heartbeat](http://127.0.0.1:7890/heartbeat)

#### Example of returned JSON object:

```json
{
    "code": 1,
    "type": 2,
    "message": "ok"
}
```


#### Possible Errors:

If there is no response to this request, NIS is either not running or is in a state where it can't serve requests.

Status Request
--------------


|API path:|Request type: GET|
|---------|-----------------|
|/status  |                 |


#### Description:

Determines the status of NIS.

#### No Parameter:

#### Example:

[http://127.0.0.1:7890/status](http://127.0.0.1:7890/status)

#### Example of returned JSON object:

```json
{
    "code": 6,
    "type": 4,
    "message": "status"
}
```


The code can be interpreted as follows:

0: Unknown status.

1: NIS is stopped.

2: NIS is starting.

3: NIS is running.

4: NIS is booting the local node (implies NIS is running).

5: The local node is booted (implies NIS is running).

6: The local node is synchronized (implies NIS is running and the local node is booted).

7: NIS local node does not see any remote NIS node (implies running and booted).

8: NIS is currently loading the block chain from the database. In this state NIS cannot serve any requests.

#### Possible Errors:

If there is no response to this request, NIS is either not running or is in a state where it can't serve requests.

This chapter will guide you through the process of retrieving account information from a NEM Infrastructure Server. The information that can be retrieved is the durable account data, its meta data and information about transactions and harvested blocks.

NIS supports two different kind of accounts: normal accounts and multsig (short for: multi signature) accounts:

#### Normal accounts:

Normal accounts are created and controlled by a private key. Any action for the account like sending NEM to another account via a transfer transaction is signed with this private key. If an attacker gains knowledge of the private key, he/she can rob the account. The private key must therefore be kept secret by all means.

#### Multisig accounts:

Multisig accounts can be created by converting a normal account to a multisig account via a **aggregate modification transaction**. This adds cosignatories to the account. After that modification, only the cosignatories can initiate an action for the account. Any action must be signed by all cosignatories. This makes a multisig account significantly more secure than a normal account. When a single cosignatory private key is gained by an attacker, the attacker still can't initiate any action on the account since **all** cosignatories must sign. It is strongly recommended to convert any account holding a significantly high amount of NEM into a multisig account with at least 3 cosignatories. Once converted to a multisig account, the original private key for the account plays no role any more.

Durable data is either stored in the database or can be calculated from other database data. The corresponding JSON object is described in _Appendix A:_ [AccountInfo](#accountInfo) . It has the fields:



* address: balance
  * Each account has a unique address. First letter of an address indicate                    the network the account belongs to. Currently two networks are defined: the                    test network whose account addresses start with a capital T and the main                    network whose account addresses always start with a capital N. Addresses have                    always a length of 40 characters and are base-32 encoded.: Each account has a balance which is an integer greater or equal to                    zero and denotes the number of micro NEMs which the account owns. Thus a                    balance of 123456789 means the account owns 123.456789 NEM. A balance is                    split into its vested and unvested part. Only the vested part is relevant for                    the importance calculation. For transfers from one account to another only                    the balance itself is relevant.
* address: importance
  * Each account has a unique address. First letter of an address indicate                    the network the account belongs to. Currently two networks are defined: the                    test network whose account addresses start with a capital T and the main                    network whose account addresses always start with a capital N. Addresses have                    always a length of 40 characters and are base-32 encoded.: Each account is assigned an importance. The importance is a                    decimal number between 0 and 1. It denotes the probability of an account to                    harvest the next block in case the account has harvesting turned on and all                    other accounts are harvesting too. The exact formula for calculating the                    importance is not public yet. Accounts need at least 10k vested NEM to be                    included in the importance calculation.
* address: publicKey
  * Each account has a unique address. First letter of an address indicate                    the network the account belongs to. Currently two networks are defined: the                    test network whose account addresses start with a capital T and the main                    network whose account addresses always start with a capital N. Addresses have                    always a length of 40 characters and are base-32 encoded.: The public key of an account can be used                    to verify signatures of the account. Only accounts that have already                    published a transaction have a public key assigned to the account. Otherwise                    the field is null.
* address: label
  * Each account has a unique address. First letter of an address indicate                    the network the account belongs to. Currently two networks are defined: the                    test network whose account addresses start with a capital T and the main                    network whose account addresses always start with a capital N. Addresses have                    always a length of 40 characters and are base-32 encoded.: This field is not used yet and is always null.
* address: harvestedBlocks
  * Each account has a unique address. First letter of an address indicate                    the network the account belongs to. Currently two networks are defined: the                    test network whose account addresses start with a capital T and the main                    network whose account addresses always start with a capital N. Addresses have                    always a length of 40 characters and are base-32 encoded.: Harvesting is the process of generating new blocks. The field                    denotes the number of blocks that the account harvested so far. For a new                    account the number is 0.


The meta data for an account describes the harvesting status of an account, and in case that the account is a cosignatory of at least one multisig account, the list of those multisig accounts. An account can either harvest with its current importance or delegate the harvesting to a so called remote account. In the latter case the remote account uses the importance of the original account to harvest. The corresponding JSON object and the possible values for the status/remoteStatus are described in _Appendix A:_ [AccountMetaDataPair](#accountMetaDataPair) . The meta data consists of the following fields:



* status: remoteStatus
  * This field describes the harvesting status of an account.: The field describes the status of remote harvesting.
* status: cosignatoryOf
  * This field describes the harvesting status of an account.: Array of AccountInfo structures that describe the multisig                    accounts that this account is cosignatory of.


Known accounts have at least one incoming transaction. The corresponding JSON objects are described in _Appendix A:_ [Transaction](#transaction) , [TransactionMetaData](#transactionMetaData) and [TransactionMetaDataPair](#transactionMetaDataPair) .

A transaction has always the following fields:



* timeStamp: signature
  * The number of seconds elapsed since the creation of the nemesis                    block. Future timestamps are not allowed. Transaction validation detects                    future timestamps and returns an error in that case. Network time                    synchronization ensures that any NEM software component will use valid timestamps                    when creating transactions.: The transaction signature. The transaction signature is validated                    using the supplied public key in the field signer. If the signature is not                    valid, an error is returned from validation.
* timeStamp: fee
  * The number of seconds elapsed since the creation of the nemesis                    block. Future timestamps are not allowed. Transaction validation detects                    future timestamps and returns an error in that case. Network time                    synchronization ensures that any NEM software component will use valid timestamps                    when creating transactions.: The fee for the transaction. The higher the fee, the higher is the                    priority of the transaction. Transactions with high priority get included in                    a block before transactions with lower priority. If the sender does not have                    enough funds the validation will result in an error
* timeStamp: type
  * The number of seconds elapsed since the creation of the nemesis                    block. Future timestamps are not allowed. Transaction validation detects                    future timestamps and returns an error in that case. Network time                    synchronization ensures that any NEM software component will use valid timestamps                    when creating transactions.: The transaction type. Currently the following types of                    transactions are supported:0x101:  Transfer of NEM from sender to recipient.0x801:  Transfer of importance from sender to remote account.0x1001:  An aggregate modification transaction, which converts a normal account into a multisig account.0x1002:  A multisig signature transaction which is used to sign a multisig transaction.0x1003:  A multisig transaction, which is used for multisig accounts.
* timeStamp: deadline
  * The number of seconds elapsed since the creation of the nemesis                    block. Future timestamps are not allowed. Transaction validation detects                    future timestamps and returns an error in that case. Network time                    synchronization ensures that any NEM software component will use valid timestamps                    when creating transactions.: The deadline of the transaction. The deadline is given as the                    number of seconds elapsed since the creation of the nemesis block. If a                    transaction does not get included in a block before the deadline is reached,                    it is deleted.
* timeStamp: version
  * The number of seconds elapsed since the creation of the nemesis                    block. Future timestamps are not allowed. Transaction validation detects                    future timestamps and returns an error in that case. Network time                    synchronization ensures that any NEM software component will use valid timestamps                    when creating transactions.: The version of the structure. The following version are currently support.0x68 << 24 + 1 (1744830465 as 4 byte integer): the main network version0x60 << 24 + 1 (1610612737 as 4 byte integer): the mijin network version0x98 << 24 + 1 (-1744830463 as 4 byte integer): the test network version
* timeStamp: signer
  * The number of seconds elapsed since the creation of the nemesis                    block. Future timestamps are not allowed. Transaction validation detects                    future timestamps and returns an error in that case. Network time                    synchronization ensures that any NEM software component will use valid timestamps                    when creating transactions.: The public key of the account that created the transaction. The                    public key is encoded as hexadecimal string.


Depending on the type of the transaction, there are additional fields which are specific to given type. For instance a transfer transaction will have the additional fields.



* recipient: message
  * The address of the recipient. If the address is not valid an error                    is returned from validation.: Optionally a transfer transaction can contain a message.
* recipient: payload
  * The address of the recipient. If the address is not valid an error                    is returned from validation.: Optional field in case the transaction contains a message. The                    payload is the actual (possibly encrypted) message data. The payload is                    allowed to have a maximal size of 1024 bytes. Transaction validation detects                    if the limit is exceeded and returns an error in this case.
* recipient: type
  * The address of the recipient. If the address is not valid an error                    is returned from validation.: Optional field in case the transaction contains a message. The                    field holds the message type information. Possible message types are:1:  The message is not encrypted.2:  The message is encrypted.


Please refer to [Appendix A](#appendix-A:-description-of-the-JSON-structures) for detailed information on the various transactions types and their additional fields.

Transaction meta data contains only following field:


|height|The height of the block in which the transaction was included.|
|------|--------------------------------------------------------------|
|id    |The id of the transaction.                                    |
|hash  |The hash of the transaction.                                  |


Accounts can harvest (i.e. generate new) blocks if they are lucky. The account which harvests a block collects the fees which are included in the transactions in the block. The information which blocks were harvested by an account can be requested. The request returns an array of HarvestInfo JSON objects. For an example see _Appendix A:_ [HarvestInfo](#harvestInfo)

A harvest info object has the following fields:


|timeStamp |The number of seconds elapsed since the creation of the nemesis block.|
|----------|----------------------------------------------------------------------|
|id        |The database id for the block.                                        |
|difficulty|The block difficulty.                                                 |
|totalFee  |The total fee collected by harvesting the block.                      |
|height    |The height of the harvested block.                                    |


It is possible to request an array with the importance information for all accounts. The request returns an array of AccountImportanceViewModel JSON objects. For an example see _Appendix A:_ [AccountImportanceViewModel](#accountImportanceViewModel) .

An account importance view model has the following fields:



* address: importance
  * The address of the account.: Substructure that describes the importance of the account.
* address: isSet
  * The address of the account.: Indicates if the fields "score", "ev" and "height" are available.isSet can have the values 0 or 1. In case isSet is 0 the following fields are not available.
* address: score
  * The address of the account.: The importance of the account. The importance ranges between 0 and 1.
* address: ev
  * The address of the account.: The page rank portion of the importance. The page rank ranges between 0 and 1.
* address: height
  * The address of the account.: The height at which the importance calculation was performed.


Retrieving account data
-----------------------

### Generating new account data


|API path:        |Request type: GET|
|-----------------|-----------------|
|/account/generate|                 |


#### Description:

Generates a [KeyPairViewModel](#keyPairViewModel).

#### No Parameter:

#### Example:

[http://127.0.0.1:7890/account/generate](http://127.0.0.1:7890/account/generate)

#### Example of returned JSON object:

```json
{
    "privateKey": "0962c6505d02123c40e858ff8ef21e2b7b5466be12c4770e3bf557aae828390f",
    "address": "NCKMNCU3STBWBR7E3XD2LR7WSIXF5IVJIDBHBZQT",
    "publicKey": "c2e19751291d01140e62ece9ee3923120766c6302e1099b04014fe1009bc89d3"
}
```


#### Possible Errors:

None.

### Requesting the account data


|API path:   |Request type: GET|
|------------|-----------------|
|/account/get|                 |


#### Description:

Gets an [AccountMetaDataPair](#accountMetaDataPair) for an account.

#### Parameter:



#### Example:

[http://127.0.0.1:7890/account/get?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS](http://127.0.0.1:7890/account/get?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS)

#### Example of returned JSON object:

```json
{
    "account":
    {
        "address": "TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS",
        "balance": 124446551689680,
        "vestedBalance": 104443451691625,
        "importance": 0.010263666447108395,
        "publicKey": "a11a1a6c17a24252e674d151713cdf51991ad101751e4af02a20c61b59f1fe1a",
        "label": null,
        "harvestedBlocks": 645,
        "multisigInfo": {}
    },
    "meta":
    {
        "cosignatoryOf": [ ],
        "cosignatories": [ ],
        "status": "LOCKED",
        "remoteStatus": "ACTIVE"
    }
}
```


#### Possible Errors:

If the address parameter is not valid, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

Alternatively you can retrieve the account data by providing the public key for the account:


|API path:                   |Request type: GET|
|----------------------------|-----------------|
|/account/get/from-public-key|                 |


#### Parameter:



#### Example:

[http://127.0.0.1:7890/account/get/from-public-key?publicKey=f9bd190dd0c364261f5c8a74870cc7f7374e631352293c62ecc437657e5de2cd](http://127.0.0.1:7890/account/get/from-public-key?publicKey=f9bd190dd0c364261f5c8a74870cc7f7374e631352293c62ecc437657e5de2cd)

The returned JSON object has the same structure as in the first example.

#### Possible Errors:

If the public key parameter is not valid, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

### Requesting the original account data for a delegate account


|API path:             |Request type: GET|
|----------------------|-----------------|
|/account/get/forwarded|                 |


#### Description:

Given a delegate (formerly known as remote) account's address, gets the [AccountMetaDataPair](#accountMetaDataPair) for the account for which the given account is the delegate account. If the given account address is not a delegate account for any account, the request returns the [AccountMetaDataPair](#accountMetaDataPair) for the given address.

#### Parameter:



#### Example:

[http://127.0.0.1:7890/account/get/forwarded?address=NC2ZQKEFQIL3JZEOB2OZPWXWPOR6LKYHIROCR7PK](http://127.0.0.1:7890/account/get/forwarded?address=NC2ZQKEFQIL3JZEOB2OZPWXWPOR6LKYHIROCR7PK)

#### Example of returned JSON object:

```json
{
    "account":
    {
        "address": "NALICE2A73DLYTP4365GNFCURAUP3XVBFO7YNYOW",
        "balance": 11793338398661,
        "vestedBalance": 10890953464862,
        "importance": 0.001264596432148395,
        "publicKey": "bdd8dd702acb3d88daf188be8d6d9c54b3a29a32561a068b25d2261b2b2b7f02",
        "label": null,
        "harvestedBlocks": 742
    },
    "meta":
    {
        "cosignatoryOf": [ ],
        "cosignatories": [ ],
        "status": "LOCKED",
        "remoteStatus": "ACTIVE"
    }
}
```


#### Possible Errors:

If the address parameter is not valid, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

Alternatively you can retrieve the original account data by providing the public key of the delegate account:


|API path:                             |Request type: GET|
|--------------------------------------|-----------------|
|/account/get/forwarded/from-public-key|                 |


#### Parameter:



#### Example:

[http://127.0.0.1:7890/account/get/forwarded/from-public-key?publicKey=bdd8dd702acb3d88daf188be8d6d9c54b3a29a32561a068b25d2261b2b2b7f02](http://127.0.0.1:7890/account/get/forwarded/from-public-key?publicKey=bdd8dd702acb3d88daf188be8d6d9c54b3a29a32561a068b25d2261b2b2b7f02)

The returned JSON object has the same structure as in the first example.

#### Possible Errors:

If the public key parameter is not valid, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

### Requesting the account status


|API path:      |Request type: GET|
|---------------|-----------------|
|/account/status|                 |


#### Description:

Gets the [AccountMetaData](#accountMetaData) from an account.

#### Parameter:



#### Example:

[http://127.0.0.1:7890/account/status?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS](http://127.0.0.1:7890/account/status?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS)

#### Example of returned JSON object:

```json
{
    "cosignatories": [ ],
    "cosignatoryOf": [ ],
    "status": "LOCKED",
    "remoteStatus": "ACTIVE"
}
```


#### Possible Errors:

If the address parameter is not valid, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

### Requesting transaction data for an account

A transaction is said to be incoming with respect to an account if the account is the recipient of the transaction. In the same way outgoing transaction are the transactions where the account is the sender of the transaction. Unconfirmed transactions are those transactions that have not yet been included in a block. Unconfirmed transactions are **not** guaranteed to be included in any block.

#### Incoming transactions


|API path:                  |Request type: GET|
|---------------------------|-----------------|
|/account/transfers/incoming|                 |


#### Description:

Gets an array of [TransactionMetaDataPair](#transactionMetaDataPair) objects where the recipient has the address given as parameter to the request. A maximum of 25 transaction meta data pairs is returned. The returned transaction meta data pairs are sorted in descending order in which they were written to the database.

The second parameter is optional. When it's not present, the request will return newest transactions according to the above criteria. When hash is supplied as second parameter, the request will return up to 25 transactions that appeared directly before the transaction that has the supplied hash sorted according to the above criteria.

The third parameter is optional. When an id is supplied as third parameter, the request will return up to 25 transactions that appeared directly before the transaction that has the supplied id sorted according to the above criteria.

If less than 25 transactions fulfill the requirements, only those transactions are returned.

#### Parameters:



* address: hash
  * The address of the account.: The 256 bit sha3 hash of the                    transaction up to which transactions are returned.
* address: id
  * The address of the account.: The transaction id up to which                    transactions are returned.


#### Example:

[http://127.0.0.1:7890/account/transfers/incoming?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS&hash=949583a20ebdfdcb58277eb42fef3e66e9e6bbfc47304d8741a82c68f7c53a2](http://127.0.0.1:7890/account/transfers/incoming?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS&hash=949583a20ebdfdcb58277eb42fef3e66e9e6bbfc47304d8741a82c68f7c53a2)

#### Example of returned JSON object (test network):

```json
{
       "data": [
       {
              "meta":
              {
                     "id": 71245,
                     "height": 40706,
                     "hash": {
                         "data":"15c373ad4c3fe6af47d1941379ff262f785bdcfa07c02ac3608bc10da27d5e82"
                     }
              },
              "transaction":
              {
                     "timeStamp": 9106400,
                     "amount": 1000000000,
                     "signature": "449cd76ea8bda2220b3d6ad6f8db5f81d4e68ad3d4b0c3db9a3c267355657639eabed3dbcef8e0cc22953ae2b36a22ee7dc6327484c9649cccd686a511eca105",
                     "fee": 3000000,
                     "recipient": "TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS",
                     "type": 257,
                     "deadline": 9149600,
                     "message":
                     {
                           "payload": "280000005444334b32493543524850595634425a5a5a4c335850454e4",
                           "type": 2
                     },
                     "version": -1744830463,
                     "signer": "c20a1dffe699c7a68328986273265e33fceebe074f274240ef890dd80ad55ed6"
              }
       },
       {
              "meta":
              {
                     "id": 71356,
                     "height": 40629,
                     "hash": {
                         "data":"37c34ead4c3fe6af42d994135798262f785ba2d807c02ac3608bc10da12e5f87"
                     }
              },
              "transaction":
              {
                     "timeStamp": 9101541,
                     "amount": 49997995000000,
                     "signature": "57c3c48d2ae8b24240b57d72493f498cfeb61e2ab87237dc0e08c51007d5c7f15847d0e08c0286e68a72028925db5fa809ca9d57e2cb6eebe11822176a834c0b",
                     "fee": 2005000000,
                     "recipient": "TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS",
                     "type": 257,
                     "deadline": 9144741,
                     "message":
                     {
                           "payload": "526f6262657279212121",
                           "type": 1
                     },
                     "version": -1744830463,
                     "signer": "546e4fb9c81db84e04d8e9e67380db0fe1f540df09a527fb995b589b5695ae24"
              }
       }]
}
```


#### Possible Errors:

If the address parameter is not valid or the id cannot be found in the database, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

#### Outgoing transactions


|API path:                  |Request type: GET|
|---------------------------|-----------------|
|/account/transfers/outgoing|                 |


#### Description:

Gets an array of transaction meta data pairs where the recipient has the address given as parameter to the request. A maximum of 25 transaction meta data pairs is returned. For details about sorting and discussion of the second parameter see [Incoming transactions](#incoming-transactions).

#### Parameters:



* address: hash
  * The address of the account.: The 256 bit sha3 hash of the                    transaction up to which transactions are returned.
* address: id
  * The address of the account.: The transaction id up to which                    transactions are returned.


#### Example:

[http://127.0.0.1:7890/account/transfers/outgoing?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS&hash=949583a20ebdfdcb58277eb42fef3e66e9e6bbfc47304d8741a82c68f7c53a22](http://127.0.0.1:7890/account/transfers/outgoing?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS&hash=949583a20ebdfdcb58277eb42fef3e66e9e6bbfc47304d8741a82c68f7c53a22)

#### Example of returned JSON object (test network):

```json
{
       "data": [
       {
              "meta":
              {
                     "id": 70498,
                     "height": 40803,
                     "hash": {
                         "data":"37c34ead4c3fe6af42d994135798262f785ba2d807c02ac3608bc10da12e5f87"
                     }
              },
              "transaction":
              {
                     "timeStamp": 9111526,
                     "amount": 1000000000,
                     "signature": "651a19ccd09c1e0f8b25f6a0aac5825b0a20f158ca4e0d78f2abd904a3966b6e3599a47b9ff199a3a6e1152231116fa4639fec684a56909c22cbf6db66613901",
                     "fee": 3000000,
                     "recipient": "TDGIMREMR5NSRFUOMPI5OOHLDATCABNPC5ID2SVA",
                     "type": 257,
                     "deadline": 9154726,
                     "message":
                     {
                           "payload": "74657374207472616e73616374696f6e",
                           "type": 1
                     },
                     "version": -1744830463,
                     "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
              }
       }]
}
```


#### Possible Errors:

If the address parameter is not valid or the id cannot be found in the database, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

#### All transactions


|API path:             |Request type: GET|
|----------------------|-----------------|
|/account/transfers/all|                 |


#### Description:

Gets an array of transaction meta data pairs for which an account is the sender or receiver. A maximum of 25 transaction meta data pairs is returned. For details about sorting and discussion of the second parameter see [Incoming transactions](#incoming-transactions).

#### Parameters:



* address: hash
  * The address of the account.: The 256 bit sha3 hash of the                    transaction up to which transactions are returned.
* address: id
  * The address of the account.: The transaction id up to which                    transactions are returned.


#### Example:

[http://127.0.0.1:7890/account/transfers/all?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS&hash=949583a20ebdfdcb58277eb42fef3e66e9e6bbfc47304d8741a82c68f7c53a22](http://127.0.0.1:7890/account/transfers/all?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS&hash=949583a20ebdfdcb58277eb42fef3e66e9e6bbfc47304d8741a82c68f7c53a22)

#### Example of returned JSON object:

See example for [Incoming transactions](#incoming-transactions) or [Outgoing transactions](#outgoing-transactions).

#### Possible Errors:

If the address parameter is not valid or the id cannot be found in the database, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

#### Unconfirmed transactions


|API path:                       |Request type: GET|
|--------------------------------|-----------------|
|/account/unconfirmedTransactions|                 |


#### Description:

Gets the array of transactions for which an account is the sender or receiver and which have not yet been included in a block. The returned structure is UnconfirmedTransactionMetaDataPair see _Appendix A:_ [UnconfirmedTransactionMetaDataPair](#unconfirmedTransactionMetaDataPair)

#### Parameters:



#### Example:

[http://127.0.0.1:7890/account/unconfirmedTransactions?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS](http://127.0.0.1:7890/account/unconfirmedTransactions?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS)

#### Example of returned JSON object (test network):

```json
{
        "data": [
        {
                "meta":
                {
                        "data": "d7c9e33421e43bf4a5d6e21304c8096c599142755d581bd6e9037f41545a5873"
                },
                "transaction":
                {
                        "timeStamp": 9131839,
                        "amount": 1000000000,
                        "signature": "0acface77696a54340a7da8592750ea0410f62717d07e4df30e09718092521262465df5c4d98d32cd9d6e8699d66e016ec8db716d20090ad99cc16f7a6d13904",
                        "fee": 2000000,
                        "recipient": "TDGIMREMR5NSRFUOMPI5OOHLDATCABNPC5ID2SVA",
                        "type": 257,
                        "deadline": 9175039,
                        "message": {
                                "payload": "",
                                "type": 1
                        },
                        "version": -1744830463,
                        "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
                }
        }]
}
```


#### Possible Errors:

If the address parameter is not valid, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) Errors for details about errors.

### Transaction data with decoded messages

All the requests for retrieving transaction data for an account which were described in previous part do not decode any message contained in a transaction. The following requests are similar to the ones above but are able to return transaction data with decoded messages. Decoding requires the private key of an account for which transactions are requested. Therefore the following requests **should only be done when NIS is running locally**.

#### Incoming/outgoing/all transactions with decoded messages


|API path:                        |Request type: POST|
|---------------------------------|------------------|
|/local/account/transfers/incoming|                  |



|API path:                        |Request type: POST|
|---------------------------------|------------------|
|/local/account/transfers/outgoing|                  |



|API path:                   |Request type: POST|
|----------------------------|------------------|
|/local/account/transfers/all|                  |


#### Description:

The request returns incoming/outgoing/all transactions as described in the previous chapter. The only difference is that if a transaction contains an encoded message, this message will be decoded before it is sent to the requester.

#### Parameters:



#### Example:

Request cannot be performed in a browser.

#### Example of returned JSON object:

See section: [Requesting transaction data for an account](#requesting-transaction-data-for-an-account)

#### Possible Errors:

If the private key is not supplied, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

### Requesting harvest info data for an account


|API path:        |Request type: GET|
|-----------------|-----------------|
|/account/harvests|                 |


#### Description:

Gets an array of harvest info objects for an account.

#### Parameter:


|address|The address of the account.                                                  |
|-------|-----------------------------------------------------------------------------|
|hash   |The 256 bit sha3 hash of the block up to which harvested blocks are returned.|


#### Example:

[http://127.0.0.1:7890/account/harvests?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS&hash=81d52a7df4abba8bb1613bcc42b6b93cf3114524939035d88ae8e864cd2c34c8](http://127.0.0.1:7890/account/harvests?address=TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS&hash=81d52a7df4abba8bb1613bcc42b6b93cf3114524939035d88ae8e864cd2c34c8)

#### Example of returned JSON object:

```json
{
       "data": [{
              "timeStamp": 8879051,
              "difficulty": 26453656336676,
              "totalFee": 102585065,
              "id": 1262068,
              "height": 37015
       }]
}
```


#### Possible Errors:

If the address parameter is not valid or the hash cannot be found in the database, NIS returns an error. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) Errors for details about errors.

### Retrieving account importances for accounts


|API path:           |Request type: GET|
|--------------------|-----------------|
|/account/importances|                 |


#### Description:

Gets an array of account importance view model objects.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/account/importances](http://127.0.0.1:7890/account/importances)

#### Example of returned JSON object:

```json
{
       "data": [{
              "address": "TCYGT6GHZPNASMAXV7YCFCU5R5XTJKNNT66R4A4T",
              "importance": {
                     "isSet": 0
              }
       },
       {
              "address": "TD2JJJVPKDZFXWK3N3ZJLN7A5TGNOTM3J5EVSTIG",
              "importance": {
                     "score": 0.001222376902598832,
                     "ev": 0.004252356221747241,
                     "isSet": 1,
                     "height": 40926
              }
       }]
}
```


#### Possible Errors:

None.

### Retrieving namespaces that an account owns


|API path:              |Request type: GET|
|-----------------------|-----------------|
|/account/namespace/page|                 |


#### Description:

Gets an array of namespace objects for a given account address. The parent parameter is optional. If supplied, only sub-namespaces of the parent namespace are returned.

#### Parameter:


|address |The address of the account.                                            |
|--------|-----------------------------------------------------------------------|
|parent  |The optional parent namespace id.                                      |
|id      |The optional namespace database id up to which namespaces are returned.|
|pageSize|The (optional) number of namespaces to be returned.                    |


#### Example:

[http://127.0.0.1:7890/account/namespace/page?address=TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH&parent=makoto.metal](http://127.0.0.1:7890/account/namespace/page?address=TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH&parent=makoto.metal)

#### Example of returned JSON object:

```json
{
        "data": [{
                "fqn": "makoto.metal.coins",
                "owner": "TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH",
                "height": 13465
        }]
}
```


#### Possible Errors:

NIS returns an error if the address or the parent (if supplied) is invalid. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

### Retrieving mosaic definitions that an account has created


|API path:                      |Request type: GET|
|-------------------------------|-----------------|
|/account/mosaic/definition/page|                 |


#### Description:

Gets an array of mosaic definition objects for a given account address. The parent parameter is optional. If supplied, only mosaic definitions for the given parent namespace are returned. The id parameter is optional and allows retrieving mosaic definitions in batches of 25 mosaic definitions. For more information how to use the id see [Incoming transactions](#incoming-transactions).

#### Parameter:


|address|The address of the account.                                                            |
|-------|---------------------------------------------------------------------------------------|
|parent |The optional parent namespace id.                                                      |
|id     |The optional mosaic definition database id up to which mosaic definitions are returned.|


#### Example:

[http://127.0.0.1:7890/account/mosaic/definition/page?address=TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH&parent=makoto.metal.coins](http://127.0.0.1:7890/account/mosaic/definition/page?address=TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH&parent=makoto.metal.coins)

#### Example of returned JSON object:

```json
{
        "data": [{
            "creator": "10cfe522fe23c015b8ab24ef6a0c32c5de78eb55b2152ed07b6a092121187100",
            "id": {
                "namespaceId": "makoto.metal.coins",
                "name": "silver coin"
            },
            "description": "Real silver coins, pure silver",
            "properties": [{
                "name": "divisibility",
                "value": "0"
            },{
                "name": "initialSupply",
                "value": "1000"
            },{
                "name": "supplyMutable",
                "value": "false"
            },{
                "name": "transferable",
                "value": "true"
            }]
        }]
}
```


#### Possible Errors:

NIS returns an error if the address, the parent (if supplied) or the id (if supplied) is invalid. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

### Retrieving mosaics that an account owns


|API path:            |Request type: GET|
|---------------------|-----------------|
|/account/mosaic/owned|                 |


#### Description:

Gets an array of mosaic objects for a given account address.

#### Parameter:



#### Example:

[http://127.0.0.1:7890/account/mosaic/owned?address=TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH](http://127.0.0.1:7890/account/mosaic/owned?address=TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH)

#### Example of returned JSON object:

```json
{
        "data": [{
            "mosaicId": {
                "namespaceId": "alice.drinks",
                "name": "orange juice"
            },
            "quantity": 123
        },{
            "mosaicId": {
                "namespaceId": "makoto.metal.coins",
                "name": "silver coin"
            },
            "quantity": 8
        }]
}
```


#### Possible Errors:

NIS returns an error if the address is invalid. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

### Locking and unlocking accounts

Accounts that have at least 10000 vested NEM balance are allowed to harvest blocks. To do that the account must be unlocked. After start-up of NIS all accounts are locked by default.

#### Unlocking the account (enables harvesting)


|API path:      |Request type: POST|
|---------------|------------------|
|/account/unlock|                  |


#### Description:

Unlocks an account (starts harvesting).

#### Parameter:



#### Example:

Request cannot be performed in a browser.

#### No return value

#### Locking the account (stops harvesting)


|API path:    |Request type: POST|
|-------------|------------------|
|/account/lock|                  |


#### Description:

Locks an account (stops harvesting).

#### Parameter:



#### Example:

Request cannot be performed in a browser.

#### No return value

#### Possible Errors:

Both requests return an error if the private key does not correspond to a known account or the account is not allowed to harvest. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

### Retrieving the unlock info

Each node can allow users to harvest with their delegated key on that node. The NIS configuration has entries for configuring the maximum number of allowed harvesters and optionally allow harvesting only for certain account addresses. The unlock info gives information about the maximum number of allowed harvesters and how many harvesters are already using the node.


|API path:             |Request type: POST|
|----------------------|------------------|
|/account/unlocked/info|                  |


#### No parameter:

#### Example:

Request cannot be performed in a browser.

#### Example of returned JSON object:

```json
{
    "num-unlocked" : 2,
    "max-unlocked" : 3
}
```


#### Possible Errors:

None

Retrieving historical account data
----------------------------------

The configuration for NIS offers the possibility for a node to expose additional features that other nodes don't want to offer. One of those features is the supply of historical account data like balance and importance information. To turn on this feature for your NIS, you need to add HISTORICAL\_ACCOUNT\_DATA to the list of optional features in the file config.properties.


|API path:              |Request type: GET|
|-----------------------|-----------------|
|/account/historical/get|                 |


#### Description:

Gets historical information for an account.

#### Parameter:



* address: startHeight
  * The address of the account.: The block height from which on the data should be supplied.
* address: endHeight
  * The address of the account.: The block height up to which the data should be supplied.                    The end height must be greater than or equal to the start height.
* address: increment
  * The address of the account.: The value by which the height is incremented between each data point.                    The value must be greater than 0. NIS can supply up to 1000 data points with one request.                    Requesting more than 1000 data points results in an error.


#### Example:

[http://bigalice3.nem.ninja:7890/account/historical/get?address=NALICELGU3IVY4DPJKHYLSSVYFFWYS5QPLYEZDJJ&startHeight=17592&endHeight=17592&increment=1](http://bigalice3.nem.ninja:7890/account/historical/get?address=NALICELGU3IVY4DPJKHYLSSVYFFWYS5QPLYEZDJJ&startHeight=17592&endHeight=17592&increment=1)

#### Example of returned JSON object:

```json
{
    "data": [
        {
          "height": 17592,
          "address": "NALICELGU3IVY4DPJKHYLSSVYFFWYS5QPLYEZDJJ",
          "balance": 509676000000,
          "vestedBalance": 100999147150,
          "unvestedBalance": 408676852850,
          "importance": 0.00008857563463531297,
          "pageRank": 0.0007605047835049349
        }
    ]
}
```


#### Possible Errors:

If the address is invalid, the start height is larger than the endheight, the increment is not a positive or the request results in more than 1000 data points an error is returned.

NEM builds a block chain which contains every bit of information needed. Subsequent blocks in the block chain have increasing heights that differ by one. Each block can contain transactions. Transactions build the basis of all account activity. It is therefore important to understand the concept and the structures of blocks and transactions.

Blocks are generated by accounts. If an account generates a block and the block gets included in the block chain, the generating account, called the harvester, gets all the transaction fees for transactions that are included in the block. A harvester will therefore usually include as many transactions as possible.

Transactions reflect all account activities. In order for a client to have an up to date balance for every account it is crucial to know about every transaction that occurred and therefore the client must have knowledge about every single block in the chain (one says: the client must be synchronized with the block chain).

Whenever timestamps are used, the time reflects the network time. NEM has a time synchronization mechanism which lets all node agree on how many seconds since the nemesis have elapsed. This common time is called network time.

The following chapters will first introduce the fields used in the block and transaction structure and then explain how a client can request parts of the block chain.

Blocks are transferred using a JSON Block object. _Appendix A:_ [Block](#block) has more information and an example JSON Block object. The following fields are in the structure:



* timeStamp: signature
  * The network time when the block was created.: The signature of the block. All blocks in the chain are signed by                    the harvesters.This way any node can check if the block has been altered by some                    evil entity.
* timeStamp: prevBlockHash
  * The network time when the block was created.: The sha3-256 hash of the previous block as hexadecimal string.
* timeStamp: type
  * The network time when the block was created.: The block type. There are currently two block types used:-1:  Nemesis block type. This block type appears only once in the chain.1:  Regular block type. All blocks with height > 1 have this type.
* timeStamp: transactions
  * The network time when the block was created.: The array of transactions. See                    Appendix A: Transaction                    for more details. A block can contain up to 120 transactions.
* timeStamp: version
  * The network time when the block was created.: The block version. The following versions are supported:0x68 << 24 + 1 (1744830465 as 4 byte integer): the main network version0x60 << 24 + 1 (1610612737 as 4 byte integer): the mijin network version0x98 << 24 + 1 (-1744830463 as 4 byte integer): the test network version
* timeStamp: signer
  * The network time when the block was created.: The public key of the harvester of the block as hexadecimal                    string.
* timeStamp: height
  * The network time when the block was created.: The height of the block. Each block has a unique height.                    Subsequent blocks differ in height by 1.


Transactions were already discussed in chapter 2 [Account related requests](#account-related-requests). See also _Appendix A:_ [Transaction](#transaction) for an example JSON transaction object.

Requesting the block chain status information
---------------------------------------------

### Block chain height


|API path:    |Request type: GET|
|-------------|-----------------|
|/chain/height|                 |


#### Description:

Gets the current height of the block chain.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/chain/height](http://127.0.0.1:7890/chain/height)

#### Example of returned JSON object:

```json
{
       "height": 42799
}
```


#### Possible Errors:

None.

### Block chain score


|API path:   |Request type: GET|
|------------|-----------------|
|/chain/score|                 |


#### Description:

Gets the current score of the block chain. The higher the score, the better the chain. During synchronization, nodes try to get the best block chain in the network.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/chain/score](http://127.0.0.1:7890/chain/score)

#### Example of returned JSON object:

```json
{
       "score": "18722d5a7d590deb"
}
```


#### Possible Errors:

None.

### Last block of the block chain score


|API path:        |Request type: GET|
|-----------------|-----------------|
|/chain/last-block|                 |


#### Description:

Gets the current last block of the chain.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/chain/last-block](http://127.0.0.1:7890/chain/last-block)

#### Example of returned JSON object (main network):

```json
{
       "timeStamp": 9232968,
       "signature": "0a1351ef3e9b19c601e804a6d329c9ade662051d1da2c12c3aec9934353e421c79de7d8e59b127a8ca9b9d764e3ca67daefcf1952f71bc36f747c8a738036b05",
       "prevBlockHash": {
              "data": "58efa578aea719b644e8d7c731852bb26d8505257e03a897c8102e8c894a99d6"
       },
       "type": 1,
       "transactions": [
       ],
       "version": 1744830465,
       "signer": "2afca04d2cb8d16cf3656274bc55b95e60be823cfb7230d82f791ed42a309ee7",
       "height": 42804
}
```


#### Possible Errors:

None.

Requesting parts of the block chain
-----------------------------------

NIS can supply either individual blocks identified by block height or block hash or can supply up to 10 blocks beginning at a certain height.

### Getting a block with a given height


|API path:       |Request type: POST|
|----------------|------------------|
|/block/at/public|                  |


#### Description:

Gets a block from the chain that has the given height.

#### Parameter:



#### Example:

Request cannot be performed in a browser.

#### Example of returned JSON object (test network):

```json
{
       "timeStamp": 9232942,
       "signature": "005f91b8908fc173a428ff8e8c4a0ee0d69e4004aed0d08f27690b6b6672ef74ccc6b89695bed5f29b0f4a812cb84bfa459f52a4e14a11e574793969f0e1a30f",
       "prevBlockHash": {
              "data": "f721e563b4431594c5af6f6be0a913f47f0aca6c3b8ee6a703bfe175ee54babf"
       },
       "type": 1,
       "transactions": [
       ],
       "version": -1744830463,
       "signer": "78e121cc1cf63424651ec64251e78efda81386c9f5e9eb4cb08b2a2192c9dce5",
       "height": 42803
}
```


#### Possible Errors:

If the block with the specified height cannot be found in the database, NIS will return a JSON error object. See _Appendix A:_ [Error object](#error-object) or more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) the error message.

### Getting part of a chain


|API path:                |Request type: POST|
|-------------------------|------------------|
|/local/chain/blocks-after|                  |


#### Description:

Gets up to 10 blocks after given block height from the chain. If the database contains less than 10 block after the given height, then less blocks are returned. The returned data is an array of [ExplorerBlockViewModel](#explorerBlockViewModel) JSON objects.

#### Parameter:



#### Example:

Request cannot be performed in a browser.

#### Example of returned JSON object:

```json
{
    "data":[{
        "txes":[{
            "tx": <ExplorerViewModelTransaction>
            "tx": <ExplorerViewModelTransaction>
        }],
        "block": <Block>
        "hash":"8ca8a3e01ac0eb482e668fda74141984ba118b027fc5f1f67d2d36a38bf48c49"
    }]
}
```


#### Possible Errors:

If the block height supplied is not positive, NIS will return a JSON error object. See _Appendix A:_ [Error object](#error-object) for more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for the error message.

Nodes are the entities that exchange data in a network. A node is essentially a NIS instance running on a computer. To be able to communicate with the network, a node needs to be booted. Through node requests it is possible to discover other nodes in the network, learn about other nodes experiences and get information about their current chain height.

Node structure consists of 3 parts: identity, endpoint and meta data:

Every node is tied to an identity which is represented by an account. That way nodes are easier to identify. A node is given an identity during the boot process.

The endpoint of a node holds information about the IP address, the port and the protocol used for communication.

The meta data holds additional information about the NIS version and the platform NIS is running on.

A node groups the set of neighbor nodes into several subsets by assigning a status to each node. The possible statuses are:



* active: inactive
  * Nodes that have this status can be successfully communicated with.                    Whenever a node is selecting a node for communication, it will pick a node                    from the set of active nodes.: Inactive nodes are nodes with which it is not possible to                    establish a connection.
* active: busy
  * Nodes that have this status can be successfully communicated with.                    Whenever a node is selecting a node for communication, it will pick a node                    from the set of active nodes.: A node is set to status 'busy' if a connection can be established                    but the node did not answer a request within a certain time limit.
* active: failure
  * Nodes that have this status can be successfully communicated with.                    Whenever a node is selecting a node for communication, it will pick a node                    from the set of active nodes.: The status failure is assigned to a remote node in case there is                    severe error during communication. This can for instance be due to the remote                    node using a different protocol or the remote node using an identity                    different from what was expected.
* active: unknown
  * Nodes that have this status can be successfully communicated with.                    Whenever a node is selecting a node for communication, it will pick a node                    from the set of active nodes.: This status is given to a node if there is no information about                    the status available.


_Appendix A:_ [Node](#node) has more information and an example JSON Node object. A node object has the following fields:



* name: public-key
  * The name of the node. This can be any string.: The public key used to identify the node.
* name: protocol
  * The name of the node. This can be any string.: The protocol used for the communication (currently only HTTP is                    supported).
* name: port
  * The name of the node. This can be any string.: The port used for the communication.
* name: host
  * The name of the node. This can be any string.: The IP address of the endpoint.
* name: application
  * The name of the node. This can be any string.: The name of the application that is running the node.
* name: version
  * The name of the node. This can be any string.: The version of the application.
* name: platform
  * The name of the node. This can be any string.: The underlying platform (OS, java version).


Requesting information about a node
-----------------------------------

### Basic node information


|API path: |Request type: GET|
|----------|-----------------|
|/node/info|                 |


#### Description:

Gets basic information about a node. Using IP 127.0.0.1 gets information about the local node.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/node/info](http://127.0.0.1:7890/node/info)

#### Example of returned JSON [Node](#node)

```json
{
       "metaData":
       {
              "features": 1,
              "application": "NIS",
              "networkId": -104,
              "version": "0.4.33-BETA",
              "platform": "Oracle Corporation (1.8.0_25) on Windows 8"
       },
       "endpoint":
       {
              "protocol": "http",
              "port": 7890,
              "host": "81.224.224.156"
       },
       "identity":
       {
              "name": "Alice",
              "public-key": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
       }
}
```


#### Possible Errors:

In case the node has not been booted yet, NIS will return a JSON error object. See _Appendix A:_ [Error object](#error-object) for more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for the error message.

### Extended node information


|API path:          |Request type: GET|
|-------------------|-----------------|
|/node/extended-info|                 |


#### Description:

Gets extended information about a node. Using IP 127.0.0.1 gets extended information about the local node.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/node/extended-info](http://127.0.0.1:7890/node/extended-info)

#### Example of returned JSON [NisNodeInfo](#nisNodeInfo) object:

```json
{
       "node": {
              "metaData":
              {
                     "features": 1,
                     "application": "NIS",
                     "networkId": -104,
                     "version": "0.4.33-BETA",
                     "platform": "Oracle Corporation (1.8.0_25) on Windows 8"
              },
              "endpoint":
              {
                     "protocol": "http",
                     "port": 7890,
                     "host": "81.224.224.156"
              },
              "identity":
              {
                     "name": "Alice",
                     "public-key": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
              }
       },
       "nisInfo":
       {
              "currentTime": 9288341,
              "application": "NEM Infrastructure Server",
              "startTime": 9238484,
              "version": "0.4.33-BETA",
              "signer": "CN=VeriSign Class 3 Code Signing 2010 CA,OU=Terms of use at https://www.verisign.com/rpa (c)10,OU=VeriSign Trust Network,O=VeriSign\\, Inc.,C=US"
       }
}
```


#### Possible Errors:

In case the node has not been booted yet, NIS will return a JSON error object. See _Appendix A:_ [Error object](#error-object) for more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for the error message.

Request for discovering the neighborhood of a node
--------------------------------------------------

### Complete neighborhood


|API path:          |Request type: GET|
|-------------------|-----------------|
|/node/peer-list/all|                 |


#### Description:

Gets an array of all known nodes in the neighborhood.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/node/peer-list/all](http://127.0.0.1:7890/node/peer-list/all)

#### Example of returned JSON [NodeCollection](#nodeCollection) object (<Node> denotes a [Node](#node) object):

```json
{
       "inactive": [
              <Node>,
              <Node>
       ],
       "active": [
              <Node>,
              <Node>
       ],
       "busy": [
              <Node>,
              <Node>
       ],
       "failure": [
              <Node>,
              <Node>
       ]
}
```


#### Possible Errors:

In case the node has not been booted yet, NIS will return a JSON error object. See _Appendix A:_ [Error object](#error-object) for more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for the error message.

### Reachable neighborhood


|API path:                |Request type: GET|
|-------------------------|-----------------|
|/node/peer-list/reachable|                 |


#### Description:

Gets an array of all nodes with status 'active' in the neighborhood.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/node/peer-list/reachable](http://127.0.0.1:7890/node/peer-list/reachable)

#### Example of returned JSON [NodeCollection](#nodeCollection) object (<Node> denotes a [Node](#node) object):

```json
{
       "data": [
              "metaData":
              {
                     "features": 1,
                     "application": "NIS",
                     "networkId": -104,
                     "version": "0.4.33-BETA",
                     "platform": "Oracle Corporation (1.8.0_25) on Windows 8"
              },
              "endpoint":
              {
                     "protocol": "http",
                     "port": 7890,
                     "host": "81.224.224.156"
              },
              "identity":
              {
                     "name": "Alice",
                     "public-key": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
              }
       ]
}
```


#### Possible Errors:

In case the node has not been booted yet, NIS will return a JSON error object. See _Appendix A:_ [Error object](#error-object) for more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for the error message.

### Active neighborhood


|API path:             |Request type: GET|
|----------------------|-----------------|
|/node/peer-list/active|                 |


#### Description:

Gets an array of active nodes in the neighborhood that are selected for broadcasts.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/node/peer-list/active](http://127.0.0.1:7890/node/peer-list/active)

#### Example of returned JSON [NodeCollection](#nodeCollection) object (<Node> denotes a [Node](#node) object):

```json
{
       "data": [
              "metaData":
              {
                     "features": 1,
                     "application": "NIS",
                     "networkId": -104,
                     "version": "0.4.33-BETA",
                     "platform": "Oracle Corporation (1.8.0_25) on Windows 8"
              },
              "endpoint":
              {
                     "protocol": "http",
                     "port": 7890,
                     "host": "81.224.224.156"
              },
              "identity":
              {
                     "name": "Alice",
                     "public-key": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
              }
       ]
}
```


#### Possible Errors:

In case the node has not been booted yet, NIS will return a JSON error object. See _Appendix A:_ [Error object](#error-object) for more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for the error message.

### Maximum chain height in the active neighborhood


|API path:                          |Request type: GET|
|-----------------------------------|-----------------|
|/node/active-peers/max-chain-height|                 |


#### Description:

Requests the chain height from every node in the active node list (described in [Active neighborhood](#active-neighborhood)) and returns the maximum height seen.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/node/active-peers/max-chain-height](http://127.0.0.1:7890/node/active-peers/max-chain-height)

#### Example of returned JSON [BlockHeight](#blockHeight) object:

```json
{
       "height": 43920
}
```


#### Possible Errors:

In case the node has not been booted yet, NIS will return a JSON error object. See _Appendix A:_ [Error object](#error-object) for more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for the error message.

Requesting node experiences
---------------------------


|API path:        |Request type: GET|
|-----------------|-----------------|
|/node/experiences|                 |


#### Description:

Gets an array of node experiences from another node. Each node saves its experiences with other nodes in an internal map. Sharing experiences helps nodes to select honest nodes for communication.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/node/experiences](http://127.0.0.1:7890/node/experiences)

#### Example of returned array of JSON [ExtendedNodeExperiencePair](#extendedNodeExperiencePair) objects:

```json
{
       "data": [
       {
              "node": {
                     "metaData":
                     {
                            "features": 1,
                            "application": "NIS",
                            "networkId": -104,
                            "version": "0.4.33-BETA",
                            "platform": "Oracle Corporation (1.8.0_25) on Windows 8"
                     },
                     "endpoint":
                     {
                            "protocol": "http",
                            "port": 7890,
                            "host": "81.224.224.156"
                     },
                     "identity":
                     {
                            "name": "Alice",
                            "public-key": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
                     }
              },
              "syncs": 3,
              "experience":
              {
                     "s": 1,
                     "f": 0
              }
       }]
}
```


#### Possible Errors:

In case the node has not been booted yet, NIS will return a JSON error object. See _Appendix A:_ [Error object](#error-object) for more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for the error message.

Booting the local node
----------------------


|API path: |Request type: POST|
|----------|------------------|
|/node/boot|                  |


#### Description:

Boots the local node and thus assign an account (the identity) to the local node.

#### Parameter:



#### Example:

Request cannot be performed in a browser.

#### No return value

#### Possible Errors:

In case the node has already been booted, NIS will return a JSON error object. See _Appendix A:_ [Error object](#error-object) for more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for the error message.

Namespaces and Mosaics
----------------------

Namespaces
----------

NEM supports the concept of namespaces which is the NEM analog of internet domain names. A namespace is an identification string that consists of one or more parts that are concatenated by dots, for example 'makoto.metals.silver'. All namespaces are unique and thus can only have one owner at a time. A namespace that has only one part is called a root namespace, otherwise sub-namespace. Root namespaces can be rented by accounts for the duration of one year. One month before the root namespace expires the rental contract can be renewed for another year. If a root namespace rental contract is renewed, all sub-namespaces are valid for another year as well. If the root namespace is not renewed, it exires together with all sub-namespaces. One month after a root namespace expires, another account is able to rent that root namespace. The new owner does not inherit the sub-namespaces from the previous owner however. An account can only rent a sub-namespace if it owns the corresponding root namespace.

Namespaces have certain restrictions with respected to the characters being allowed in the parts as well as the length of a part. A root namespace may have a length of 16 characters while sub-namespaces may have a length of 64 characters. Valid characters are:

*   a, b, c, ..., z, A, B, C, ..., Z, 0, 1, 2, ..., 9, \_ , -

However a part is only allowed to begin with a letter from the alphabet, thus 'alice' is an allowed part for a root namespace while '1alice' is not. Certain strings are reserved and thus not allowed as namespace parts. Among the disallowed namespace parts are

*   nem, user, account, org, com, biz, net, edu, mil, gov and info.

This list is not final and can be extended in the future. Thus 'user.alice' or 'alice.user' are not allowed in the NEM namespace system. The namespace may have up to 3 parts, thus 'makoto.metals.silver' is valid while 'makoto.metals.silver.coin' is not.

A namespace rental contract is done via a _Appendix A:_ [ProvisionNamespaceTransaction](#provisionNamespaceTransaction) . In addition to the usual transaction fee there is a rental fee. This fee is paid to the so called rental fee sink which is a special account with address

*   NAMESPACEWH4MKFMBCVFERDPOOP4FK7MTBXDPZZA in the main net and
*   TAMESPACEWH4MKFMBCVFERDPOOP4FK7MTDJEYP35 in the test net.

The fee for renting a namespace for one year is

*   100 XEM for a root namespace and
*   10 XEM for a sub-namespace.

The ownership of a namespace is needed in order to create mosaics.

### Retrieving root namespaces


|API path:           |Request type: GET|
|--------------------|-----------------|
|/namespace/root/page|                 |


#### Description:

Gets the root namespaces. The requests supports paging, i.e. retrieving the root namespaces in batches of a specified size. The request returns an array of [NamespaceMetaDataPair](#namespaceMetaDataPair) objects.

#### Parameter:



* id: pagesize
  * The topmost namespace database id up to which root namespaces are returned. The parameter is optional.                    If not supplied the most recent rented root namespaces are returned.: The number of namespace objects to be returned for each request. The parameter is optional.                    The default value is 25, the minimum value is 5 and hte maximum value is 100.


#### Example:

[http://127.0.0.1:7890/namespace/roots?id=26754&pageSize;=35](http://127.0.0.1:7890/namespace/root/page?id=26754&pageSize=35)

#### Example of returned JSON object:

```json
{
        "data": [{
            "meta": {
                "id": 26264
            },
            "namespace": {
                "fqn": "makoto.metal.coins",
                "owner": "TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH",
                "height": 13465
            }
        },{
            "meta": {
                "id": 25421
            },
            "namespace": {
                "fqn": "gimre.vouchers",
                "owner": "TDGIMREMR5NSRFUOMPI5OOHLDATCABNPC5ID2SVA",
                "height": 12392
            }
        }]
}
```


#### Possible Errors:

None.

### Retrieving a specific namespace


|API path: |Request type: GET|
|----------|-----------------|
|/namespace|                 |


#### Description:

Gets the namespace with given id.

#### Parameter:



#### Example:

[http://127.0.0.1:7890/namespace?namespace=makoto.metal.coins](http://127.0.0.1:7890/namespace?namespace=makoto.metal.coins)

#### Example of returned JSON object:

```json
{
        "fqn": "makoto.metal.coins",
        "owner": "TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH",
        "height": 13465
}
```


#### Possible Errors:

NIS returns an error if the namespace parameter is missing or invalid. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

Mosaics
-------

NEM mosaics are assets that expose additional properties and other features. Each mosaic has an underlying mosaic definition. To be able to create a mosaic definition, an account must rent at least one root namespace which the mosaic definition can then refer to. The basic data for a mosaic definition consists of

*   **mosaic id**: the mosaic id consists of two parts, a namespace id and a mosaic name. When representing the mosaic id as string the two parts are concatenated via a '\*':
    For example if the namespace id is 'makoto.metals.silver' and the mosaic name is 'coin' then the string representation would be 'makoto.metals.silver \* coin'. Since mosaic ids should be unique, the mosaic name has to be unique within the namespace the mosaic definition refers to. The maximum length for a mosaic name is 32 characters. Allowed characters are
    1.  a, b, c, ..., z, 0, 1, 2, ..., 9, ', \_ , -but the first character must be a letter from the alphabet.
*   **description**: Each definition needs a description of the mosaic. The description may not exceed a length of 512 characters. There is no limitation for the characters used in the description.
*   **properties**: The behavior of a mosaic can be customized by a set of properties. If no properties are supplied then default properties are applied. Supported properties are:
    1.  **initialSupply**: The creator can specify an initial supply of mosaics when creating the definition. The supply is given in entire units of the mosaic, **not** in smallest sub-units. The initial supply must be in the range of 0 and 9,000,000,000. The default value is "1000".
    2.  **divisibility**: The divisibility determines up to what decimal place the mosaic can be divided into. Thus a divisibility of 3 means that a mosaic can be divided into smallest parts of 0.001 mosaics, i.e. milli mosaics is the smallest sub-unit. When transferring mosaics via a transfer transaction the quantity transferred is given in multiples of those smallest parts.
        The divisibility must be in the range of 0 and 6. The default value is "0".
    3.  **supplyMutable**: The creator can choose between a definition that allows a mosaic supply change at a later point or an immutable supply. Allowed values for the property are "true" and "false". The default value is "false".
    4.  **transferable**: The creator can choose if the mosaic definition should allow for transfers of the mosaic among accounts other than the creator. If the property 'transferable' is set to "false", only transfer transactions having the creator as sender or as recipient can transfer mosaics of that type. If set to "true" the mosaics can be transferred to and from arbitrary accounts. Allowed values for the property are thus "true" and "false". The default value is "true".
*   **levy**: The creator can demand that for each transfer of a mosaic of that type a special fee is collected from the sender and send to an account of his choice (thus the creator can specify his own account as recipient of this fee). The data for the levy is the following:
    1.  **fee type:** There are two fee types supported, absolute fee and percentile fee.
        1.  absolute fee:
        The fee is specified as absolute quantity and thus does not depend on the quantity that is transferred.2.  percentile fee:
        The fee is specified as multiple of the percentile of the quantity that is transferred. The fee is thus linearly increasing with the transferred mosaic quantity.
    2.  **recipient:** The recipient of the levy. This can be any account.
    3.  **mosaic id:** The id of the mosaic in which the fee has to be paid. Any existing mosaic id can be specified. If the creator wants the fee to be paid in XEM, then (s)he has to use the mosaic id 'nem \* xem'.
    4.  **fee:** The fee quantity. The interpretation is dependent on the field 'fee type', see above.

A mosaic definition can be created via a _Appendix A:_ [MosaicDefinitionCreationTransaction](#mosaicDefinitionCreationTransaction) . In addition to the usual transaction fee there is a creation fee. This fee is paid to the so called creation fee sink which is a special account with address

*   NBMOSAICOD4F54EE5CDMR23CCBGOAM2XSIUX6TRS in the main net and
*   TBMOSAICOD4F54EE5CDMR23CCBGOAM2XSJBR5OLC in the test net.

The fee for creating a mosaic definition is 10 XEM.

There is one predefined mosaic which represents the XEM coin. The data for this XEM mosaic is:

*   namespace: nem
*   name: xem
*   initial supply: 8,999,999,999
*   divisibility: 6
*   supply mutable: false
*   transferable: true
*   levy: none

### Retrieving mosaic definitions


|API path:                        |Request type: GET|
|---------------------------------|-----------------|
|/namespace/mosaic/definition/page|                 |


#### Description:

Gets the mosaic definitions for a given namespace. The request supports paging. The request return an array of [MosaicDefinitionMetaDataPair](#mosaicDefinitionMetaDataPair) objects.

#### Parameter:



* namespace: id
  * The namespace id.: The topmost mosaic definition database id up to which root mosaic definitions are returned. The parameter is optional.                    If not supplied the most recent mosaic definitiona are returned.
* namespace: pagesize
  * The namespace id.: The number of mosaic definition objects to be returned for each request. The parameter is optional.                    The default value is 25, the minimum value is 5 and hte maximum value is 100.


#### Example:

[http://127.0.0.1:7890/namespace/mosaic/definition/page?namespace=makoto.metal.coins](http://127.0.0.1:7890/namespace/mosaic/definition/page?namespace=makoto.metal.coins)

#### Example of returned JSON object:

```json
{
    "data": [{
        "meta": {
            "id": 3541
        },
        "mosaic": {
            "creator": "10cfe522fe23c015b8ab24ef6a0c32c5de78eb55b2152ed07b6a092121187100",
            "id": {
                "namespaceId": "makoto.metal.coins",
                "name": "silver coin"
            },
            "description": "Real silver coins, pure silver",
            "properties": [{
                 "name": "divisibility",
                 "value": "0"
            },{
                "name": "initialSupply",
                "value": "1000"
            },{
                "name": "supplyMutable",
                "value": "false"
            },{
                "name": "transferable",
                "value": "true"
            }]
        }
    }]
}
```


#### Possible Errors:

NIS returns an error if the namespace parameter is missing or invalid. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for details about errors.

Initiating transactions
-----------------------

Transactions are the way of transferring NEM and/or messages from one account to another. Once a transaction is initiated, it is still unconfirmed and thus not yet accepted by the network. At this point it is not yet clear if it will get included in a block. Never rely on a transaction which has the state 'unconfirmed'. Once it is included in a block, the transaction gets processed and, in case of a transfer transaction, the amount stated in the transaction gets transferred from the sender's account to the recipient's account. Additionally the transaction fee is deducted from the sender's account. The transaction is said to have 0 confirmations at this point. When another block is added to the block chain the transaction has 1 confirmation. The next block added to the chain will give it 2 confirmations and so on.

Crypto currencies have the ability to roll back part the block chain. This is essential for being able to resolve forks of the block chain. There is however a maximum number of blocks that can be rolled back, this is called the rewrite limit. Hence forks can only be resolved up to a certain depth too. NEM has a rewrite limit of 360 blocks. Once a transaction has more than 360 confirmations, it cannot be reversed. In real life, forks that are deeper than 20 blocks do not happen, unless there was some severe problem with the block chain due to a bug in the code or an attack of some kind.

A client can initiate a transaction in two ways:

*   If the client is not able to sign the transaction data it can let the local NIS do the signing by sending a RequestPrepareAnnounce JSON object to NIS. See _Appendix A:_ [RequestPrepareAnnounce](#requestPrepareAnnounce) for more details.

    The /transaction/prepare-announce API should be
    used only on **TRUSTED** and **LOCAL** nodes!

    Note: keep in mind, that NCC does **NOT** use this API. It does all the transaction signing on it's own.

*   If the client has an ed25519 implementation and can thus sign the transaction it can send a RequestAnnounce JSON object to NIS. Doing so has the advantage that you can use an untrusted remote NIS for sending a transaction. See _Appendix A:_ [RequestAnnounce](#requestAnnounce) for more details on this object.

Since most client with depend on a local NIS to create the transaction signature Chapters 6.1 through 6.6 will explain transaction related actions using the first way. Chapter 6.7 explains the steps you have to take to gather the data that needs to be signed and how to initiate a transaction the second way. Note however that we will not explain how to create the signature itself since this involves some cryptographical concepts which are out of the scope of this document.

Initiating a transaction
------------------------


|API path:                    |Request type: POST|
|-----------------------------|------------------|
|/transaction/prepare-announce|                  |


#### Description:

Creates and broadcasts a transaction. Since this request involves the private key of an account, it should only be sent to a **local** NIS.

#### Parameter:



#### Example:

Request cannot be performed in a browser.

#### Example of returned JSON [NemAnnounceResult](#nemAnnounceResult) object:

```json
{
   "type":1,
   "code":1,
   "message":"SUCCESS",
   "transactionHash": {
      "data":"c1786437336da077cd572a27710c40c378610e8d33880bcb7bdb0a42e3d35586"
   },
   "innerTransactionHash": {
      "data":"cc317a7674d56352b4c711096a7594bd11908bf518293a191fc2faa12eac0fbb"
   }
}
```


#### Possible Errors:

There are various errors that can occur due to failure of transaction validation See _Appendix A:_ [Error object](#error-object) for more information of the error object and [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for the error message.

The most common errors are:

*   The sender account has not enough funds.
*   The timestamp is invalid because it lies too far in the future.
*   The deadline is invalid because it has already been passed.
*   The attached message is too large.
*   The transaction is already known.
*   There is another transaction conflicting with this transaction. This can happen when trying to transfer the importance to another account.

Initiating a transfer transaction
---------------------------------

NIS supports transfer transactions having version 1 or 2. Transfer transactions with version 1 can only transfer a message and XEM coins while version 2 transfer transactions can transfer a set of mosaics too.

### Version 1 transfer transactions

Suppose you want to send 1000 NEM from sender account (referred hereafter as _**'Alice'**_):

TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS

to recipient account:

TBOBBSXX7BESJXDWGLP5Z7FM5HSTKUH5WIMPW562

The RequestPrepareAnnounce JSON object you have to send to NIS via a POST request would look similar to this (test network):

```json

{
        "transaction":
        {
            "timeStamp": 9111526,
            "amount": 1000000000,
            "fee": 3000000,
            "recipient": "TBOBBSXX7BESJXDWGLP5Z7FM5HSTKUH5WIMPW562",
            "type": 257,
            "deadline": 9154726,
            "message":
            {
                "payload": "",
                "type": 1
            },
            "version": -1744830463,
            "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
        },
        "privateKey": "00983bb01d05edecfaef55df9486c111abb6299c754a002069b1d0ef4537441bda"
}

```


Note that there is no signature in the transaction part of the object since NIS will create the signature for you. Note also that the field 'version' contains both the network version and the transaction version as can be see when converting the value to the hexadecimal system: -1744830463 = 0x98000001 (network version 0x98 and transaction version 0x01). If the sender account has enough funds for the transaction NIS would respond with the JSON object

```json
{
        "type": 1,
        "code": 1,
        "message": "SUCCESS",
        "transactionHash": {
            "data":"c1786437336da077cd572a27710c40c378610e8d33880bcb7bdb0a42e3d35586"
        },
        "innerTransactionHash": {}
}
```


### Version 2 transfer transactions

With transfer transactions version 2 you can just transfer messages and XEM as described in the previous chapter, the only difference being the field version which should have the value -1744830462 = 0x98000002 for testnet, 1744830466 = 0x68000002 for mainnet or 1610612738 = 0x60000002 for mijin network.

However, version 2 transfer transaction are more powerful as they let you transfer mosaics too.
Suppose you already have created a mosaic with id 'makoto.metals.silver \* coin' with a divisibility of 0 and you want bundle the transfer of those silver coin mosaics with a transfer of 100 XEM for each silver coin. For transferring 3 silver coin mosaics and 300 XEM with a single transfer transaction you would issue a RequestPrepareAnnounce JSON object to NIS which looks like this:

```json

{
        "transaction":
        {
            "timeStamp": 9111526,
            "amount": 3000000,
            "fee": 30000000,
            "recipient": "TBOBBSXX7BESJXDWGLP5Z7FM5HSTKUH5WIMPW562",
            "type": 257,
            "deadline": 9154726,
            "message":
            {
                "payload": "",
                "type": 1
            },
            "version": -1744830462,
            "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
            "mosaics":[{
                "mosaicId":{
                    "namespaceId": "makoto.metals.silver",
                    "name": "coin"
                },
                "quantity": 1
            },{
                "mosaicId":{
                    "namespaceId": "nem",
                    "name": "xem"
                },
                "quantity": 100000000
            }]
        },
        "privateKey": "00983bb01d05edecfaef55df9486c111abb6299c754a002069b1d0ef4537441bda"
}

```


There are 2 mosaics attached to the transfer transaction:

*   A mosaic with id 'makoto.metals.silver \* coin' and quantity 1 which represents 1 smallest unit available for the mosaic. Since the divisibility of that mosaic is 0 (as assumed above) the quantity represents 1 whole unit, i.e. 1 coin.
*   A mosaic with id 'nem \* xem' (which is the special XEM mosaic representing regular XEM coins) which has a divisibility of 6 and thus the quantity of 100000000 represents 100 XEM.

You can view the attachment as being a bag of mosaics holding in this example 1 silver coin mosaic and 100 XEM.

The amount field of the transaction is interpreted differently for the transaction due to the attachment. The number to multiply the quantities given in the attachment is given by dividing the amount by 1,000,000 (as of this version NIS does not support fractional transfers). So in this example 3,000,000 / 1,000,000 = 3 and thus 3 times the attachment is transferred resulting in 3 silver coin mosaics and 300 XEM being transferred to the recipient.

Common reason for the transaction to be rejected could be:

*   At least one mosaic specified in the attachment is unknown to NIS.
*   The sender does not own enough mosaics of at least type specified in the attachment.
*   At least one mosaic specified in the attachment is defined as not transferable and both sender and recipient are not the creator of that mosaic.

If the mosaic definition for the mosaic 'makoto.metals.silver \* coin' has a levy section stating that for each transfer involving the silver coin mosaic 10 XEM has to be paid to the recipient with address TDGOGOGOWZJ3HU4F6CUM5IKE7GHG4FFTF5BZ7JPW then the transfer transaction would automatically induce a transfer of 10 XEM from the transaction sender to TDGOGOGOWZJ3HU4F6CUM5IKE7GHG4FFTF5BZ7JPW.

Converting an account to a multisig account
-------------------------------------------

NIS natively supports m of n multisig accounts. This means an account can be converted into a multisig account having n cosignatories and m of those cosignatories need to sign a transaction from the multisig account in order to complete the transaction. To convert a normal account to a multisig account an aggregate modification transaction (see _Appendix A:_ [MultisigAggregateModificationTransaction](#multisigAggregateModificationTransaction) ) must be sent to the network. Assuming you want to convert _Alice_ with public key:

Account **'Alice'**:

*   public key: a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a

into a 2 of 3 multisig account meaning the account has 3 cosignatories and at least 2 cosignatories have to sign to complete a multisig transaction:

1.  Cosignatory **'Bob'**:
    *   address: TBOBBSXX7BESJXDWGLP5Z7FM5HSTKUH5WIMPW562
    *   public key: 6083df7119d43e815ed2967c795f806f6b73f8f92a56a7611e3848816ec50958
2.  Cosignatory **'jusan'**:
    *   address: TBJUSANZ63AKNJ57XMK6Y2IBH55UNNRXJFZRDTRW
    *   public key: 0662ed29cbfa7038530fb7f52df865eed6708d51bc7a24bcd05db35185b53c70
3.  Cosignatory **'go'**:
    *   address: TDGOGOGOWZJ3HU4F6CUM5IKE7GHG4FFTF5BZ7JPW
    *   public key: cc61676a4275abcffd10a9ea1081091ff054a1a8a720429256aebf8034aab099

you would have to create a JSON object that looks similar to this (test network):

```json
 {
        "transaction":
        {
            "timeStamp": 9111526,
            "fee": 28000000,
            "type": 4097,
            "deadline": 9154726,
            "version": -1744830462,
            "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a",
            "modifications": [
                {
                    "modificationType": 1,
                    "cosignatoryAccount": "6083df7119d43e815ed2967c795f806f6b73f8f92a56a7611e3848816ec50958"
                },{
                    "modificationType": 1,
                    "cosignatoryAccount": "0662ed29cbfa7038530fb7f52df865eed6708d51bc7a24bcd05db35185b53c70"
                },{
                    "modificationType": 1,
                    "cosignatoryAccount": "cc61676a4275abcffd10a9ea1081091ff054a1a8a720429256aebf8034aab099"
                }
            ],
            "minCosignatories" : {
                "relativeChange": 2
            }
        },
        "privateKey": "00983bb01d05edecfaef55df9486c111abb6299c754a002069b1d0ef4537441bda"
        }
```


Note again that there is no signature since the transaction will be signed by NIS.

After the transaction is signed by NIS and is accepted by the network by including it into a block, the account Alice is now a 2 of 3 multisig account. From this point on, only the cosignatories can initiate a transaction for the account _Alice_. Also, any transaction from account _Alice_ must be a multisig transaction.

Initiating a multisig transaction
---------------------------------

As stated above, only one of the cosignatories (_Bob, Jusan and Go_) can create a transaction for the account _Alice_.

Lets assume _Bob_ wants to start a transfer transaction which transfers 1000 NEM from account _Alice_ to account _Jusan_.
Since the account _Alice_ is a multisig account the transfer transaction (in the JSON object the "otherTrans" structure) must be wrapped in a multisig transaction (see _Appendix A:_ [MultisigTransaction](#multisigTransaction) ). The corresponding RequestPrepareAnnounce object would look similar to this (test network):

```json
 {
        "transaction":
        {
            "timeStamp": 9111526,
            "fee": 3000000,
            "type": 4100,
            "deadline": 9154726,
            "version": -1744830463,
            "signer": "6083df7119d43e815ed2967c795f806f6b73f8f92a56a7611e3848816ec50958",
            "otherTrans": {
                "timeStamp": 9111526,
                "amount": 1000000000,
                "fee": 4000000,
                "recipient": "TBJUSANZ63AKNJ57XMK6Y2IBH55UNNRXJFZRDTRW",
                "type": 257,
                "deadline": 9154726,
                "message":
                {
                    "payload": "",
                    "type": 1
                },
                "version": -1744830463,
                "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
            },
            "signatures":[
            ]
        },
        "privateKey": "00a6e2526b5cc84f9174c4ff050ca352623061115951c649b36b08409c4ccb7b2e"
        }
```


NIS will sign the transaction and publish it. The returned [NemAnnounceResult](#NemAnnounceResult) object this time contains the hash of the inner transaction (_otherTrans_ in the above structure):

```json
    {
        "type": 1,
        "code": 1,
        "message": "SUCCESS"
        "transactionHash": {
            "data":"c1786437336da077cd572a27710c40c378610e8d33880bcb7bdb0a42e3d35586"
        },
        "innerTransactionHash": {
            "data": "44e4968e5aa35fe182d4def5958e23cf941c4bf809364afb4431ebbf6a18c039"
        }
    }
```


The hash is needed by the nodes that will create multisig signature transactions for the above transaction.

At this point the transaction cannot (and will not) be included in a block because none of the other cosignatories - _Jusan_ and _Go_ - has signed the transaction yet …

### Cosigning multisig transaction

… to do so, _Jusan_ or _Go_ must initiate a multisig signature transaction (see _Appendix A:_ [MultisigSignatureTransaction](#multisigSignatureTransaction) ). _Jusan_ has to create a RequestPrepareAnnounce JSON object that looks similar to this (test network):

```json
 {
        "transaction":
        {
            "timeStamp": 9111526,
            "fee": 6000000,
            "type": 4098,
            "deadline": 9157365,
            "version": -1744830463,
            "signer": "0662ed29cbfa7038530fb7f52df865eed6708d51bc7a24bcd05db35185b53c70",
            "otherHash": {
                "data": "44e4968e5aa35fe182d4def5958e23cf941c4bf809364afb4431ebbf6a18c039"
            },
            "otherAccount": "TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS"
        },
        "privateKey": "00be34fdb20a9f6fed51376f0bab9f25ea7a48d610324588a6b203d0a1a6db4bc1"
        }
```


Note that _Jusan_ used the hash ('otherHash') returned by NIS from _Bob's_ request.

After NIS has signed the transaction and sent it to the network, the signature transaction will be attached to the multisig transaction.
With _Jusan_ having signed the multisig transaction that _Bob_ initiated, two of the three cosignatories have signed the inner transfer transaction (_Bob_ indirectly signed by initiating the multisig transaction) and thus the multisig transaction can be included in a block.

Adding and removing cosignatories
---------------------------------

It is possible to modify the list of cosignatories for a multisig account. This is done via a aggregate modification transaction wrapped in a multisig transaction.

Suppose you want to add the cosignatory _Hachi_ to the multisig account _Alice_ and increase the minimum of cosignatories required to complete a transaction from 2 to 3.

4.  Cosignatory **'hachi'**:
    *   address: TDHACHIMHRBBRHR57SR3BDBFFWDTYVSLGMFKIDOR
    *   public key: 6c66ea288522990db7a0a63c9c20f532cdcb68dc3c9544fb20f7322c92ceadbb

To do that, one of the existing cosignatories (assuming here it is _Jusan_) must initiate the corresponding multisig transaction (test network):

```json
{
        "transaction":
        {
            "timeStamp": 9111526,
            "fee": 6000000,
            "type": 4100,
            "deadline": 9154726,
            "version": -1744830462,
            "signer": "6083df7119d43e815ed2967c795f806f6b73f8f92a56a7611e3848816ec50958",
            "otherTrans": {
                "timeStamp": 9111526,
                "fee": 16000000,
                "type": 4097,
                "deadline": 9154726,
                "version": -1744830462,
                "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a",
                "modifications": [
                    {
                    "modificationType": 1,
                    "cosignatoryAccount": "6c66ea288522990db7a0a63c9c20f532cdcb68dc3c9544fb20f7322c92ceadbb"
                    }
                ],
                "minCosignatories" : {
                    "relativeChange": 1
                }
            },
            "signatures":[
            ]
        },
        "privateKey": "00be34fdb20a9f6fed51376f0bab9f25ea7a48d610324588a6b203d0a1a6db4bc1"
        }
```


After NIS has signed and broadcasted the transaction to the network, one of the other two cosignatories needs to sign the transaction as well as explained in [Initiating a multisig transaction](#initiating-a-multisig-transaction). After the transaction was successfully included in a block, the account _Alice_ is a 3 of 4 multisig account.

If at some later time _Bob, Jusan and Go_ want to remove the cosignatory _Hachi_ to make it a 2 of 3 multisig account again one of cosignatories could initiate a similar transaction as above but this time with "modificationType" set to **2** (which means remove) and using a minimum cosignatories relative change value of **\-1**.
For removing a cosignatory _all_ cosignatories except the one being removed need to sign the transaction. Once approved by the network _Hachi_ is no longer cosignatory of the multisig account _Alice._

Removal of accounts is **NOT** final and might be subject of change

How to use a multisig account
-----------------------------

The purpose of multisig accounts is to make accounts safer. But this relies on the user not making mistakes when using multisig accounts.
If for instance all private keys of the cosignatories of a multisig account reside on a single computer then the multisig account is essentially as good as a normal account because if that computer gets compromised all private keys are disclosed to the attacks at once.

It is therefore essential to have the private key of the cosignatories on different computer preferably in different locations.

If you have read "[Initiating a multisig transaction](#initiating-a-multisig-transaction)" you know that the cosignatories of a multisig transaction must know the hash of the inner transaction in order to be able to sign the multisig transaction. There are two ways of gaining knowledge of that hash:

1.  The initiator of the multisig transaction writes down the hash (which is included in the returned JSON object by NIS) and sends the hash to the cosignatories.
2.  The cosignatories poll the unconfirmed transactions using their local NIS. As described in chapter [Unconfirmed transactions](#unconfirmed-transactions), the meta data part of an unconfirmed transaction JSON object contains the hash of the inner transaction in case of a multisig transaction.

In first case the implementer of the client side software is responsible for transferring the hash to the cosignatories while in second case the NEM network will do it for you.

The standard client NCC uses the second method. It lets you handle multisig accounts in a convenient way.

Currently, we recommend to use at least three cosignatories in different locations when using the multisig account feature. If one of the cosignatory's private key gets compromised you should immediately remove that account from the list of cosignatories and afterwards add a new cosignatory (see chapter [Adding and removing cosignatories](#adding-and-removing-cosignatories) on how to do this).

**If a private key is stored on a computer that computer should not be used for surfing the internet or doing other unsafe things.**

Provisioning a namespace
------------------------

This chapter explains what actions you have to take in order to provision (i.e. rent) a namespace. You can find a detailed description of namespaces in the chapter [Namespaces](#namespaces). Suppose you want to claim the root namespace 'alice' and the sub-namespace 'alice.vouchers'. The first action would be to issue an [ProvisionNamespaceTransaction](#provisionNamespaceTransaction). As usual this is done by sending a RequestPrepareAnnounce JSON object to NIS which in this case would look like this:

```json

            {
            "transaction":
            {
                "timeStamp": 9111526,
                "fee": 150000,
                "type": 8193,
                "deadline": 9154726,
                "version": -1744830463,
                "signer": "d99e88c90da71a4b0d848454e59e296c9ef7a8f018f3eaa3a198dc460b6621a4",
                "rentalFeeSink": "3e82e1c1e4a75adaa3cba8c101c3cd31d9817a2eb966eb3b511fb2ed45b8e262",
                "rentalFee": 100000000,
                "newPart": "alice",
                "parent": null
            },
            "privateKey": "00983bb01d05edecfaef55df9486c111abb6299c754a002069b1d0ef4537441bda"
}

```


The field 'parent' is set to null indicating that you want to rent a root namespace. You also have to be sure that no one else has already rented that root namespace or NIS will return an error. The high rental fee is there to prevent users from squatting all kinds of root namespaces. This fee is not given to the harvesters because this would encourage harvesters to wait until they are allowed to harvest a block, include their provision namespace transaction in that block and thus essentially getting the namespace for free. Instead all rental fees are collected in a special multisig account.
The most common error responses from NIS will be:

*   The namespace is already owned by another account.
*   The namespace contains illegal character or a reserved namespace part.
*   The public key of the rental fee sink is invalid.
*   The rental fee is invalid (i.e. too low).

If NIS responses with a success message, the transaction is broadcasted to the network and will get included in a future block. After the transaction is included in a block you can check that you are the owner of that namespace by issuing an /account/namespaces request, see chapter xyz.

To rent the sub-namespace 'alice.vouchers' you need again send a RequestPrepareAnnounce JSON object to NIS which this time looks like this:

```json

{
         "transaction":
         {
             "timeStamp": 9111526,
             "fee": 150000,
             "type": 8193,
             "deadline": 9154726,
             "version": -1744830463,
             "signer": "d99e88c90da71a4b0d848454e59e296c9ef7a8f018f3eaa3a198dc460b6621a4",
             "rentalFeeSink": "3e82e1c1e4a75adaa3cba8c101c3cd31d9817a2eb966eb3b511fb2ed45b8e262",
             "rentalFee": 10000000,
             "newPart": "vouchers",
             "parent": "alice"
         },
         "privateKey": "00983bb01d05edecfaef55df9486c111abb6299c754a002069b1d0ef4537441bda"
}

```


This time the parent is set to the parent namespace, in this case the root namespace 'alice'. The rental fee for a sub-namespace is 10 XEM. Be sure to wait until you own the root namespace or NIS will respond with an error message. Once the transaction is included in a block, you own the sub-namespace 'alice.vouchers' as long as the root namespace 'alice' does not expire.

If you want to rent the sub-namespace 'alice.vouchers.special' you have to issue a RequestPrepareAnnounce object again, this time with parent set to 'alice.vouchers'. and the newPart being 'special'.

After a year the root namespace expires. In order not to let this happen you need to send a provision namespace transaction for the root namespace within one month before it expires. The RequestPrepareAnnounce object is the same as if you were renting the namespace for the first time. The renewal of the root namespace also automatically renews any sub-namespace of that root namespace that the account already owns.

Creating mosaics
----------------

### Creating a mosaic definition

The basics of the NEM mosaic concept can be found in the chapter [Mosaics](#mosaics).
To define and create a mosaic type you need to issue a [MosaicDefinitionCreationTransaction](#mosaicDefinitionCreationTransaction). As usual this is done by sending a RequestPrepareAnnounce JSON object to NIS which in this case would look like this:

```json

{
        "transaction":
        {
            "timeStamp": 9111526,
            "fee": 150000,
            "type": 16385,
            "deadline": 9154726,
            "version": -1744830463,
            "signer": "cbda3edb771d42801a5c6ce0725f9374efade19a8933d6ac22ccfa50c777d0f9",
            "creationFee": 10000000,
            "creationFeeSink": "53e140b5947f104cabc2d6fe8baedbc30ef9a0609c717d9613de593ec2a266d3",
            "mosaicDefinition": {
                "creator": "cbda3edb771d42801a5c6ce0725f9374efade19a8933d6ac22ccfa50c777d0f9",
                "description": "precious vouchers",
                "id": {
                    "namespaceId": "alice.vouchers",
                    "name": "Alice's gift vouchers"
                },
                "properties": [{
                    "name": "divisibility",
                    "value": "0"
                },{
                    "name": "initialSupply",
                    "value": "1000"
                },{
                    "name": "supplyMutable",
                    "value": "true"
                },{
                    "name": "transferable",
                    "value": "false"
                }
            ],
            "levy": {
                "type": 1,
                "recipient": "TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH",
                "mosaicId": {
                    "namespaceId": "nem",
                    "name": "xem"
                },
                "fee": 10
                }
            }
        },
        "privateKey": "00983bb01d05edecfaef55df9486c111abb6299c754a002069b1d0ef4537441bda"
}

```


With the above transaction a mosaic with id 'alice.vouchers \* Alice's gift vouchers' is created within the namespace 'alice.vouchers'. The account must own that namespace in order to be able to create a mosaic in it. There is a high creation fee for creating mosaic definition in order to discourage squatting. As stated in the previous chapter, the fee is not transferred to the block harvester but to a special account whose public key is provided in the field 'creationFeeSink'.

The mosaic has the following properties:

*   It is not divisible, i.e. the vouchers that the mosaic represents can only be transferred as a whole, not partially.
*   There will be initially 1000 vouchers (mosaics of that type).
*   The supply (the number of mosaics of that type) can be changed at a later point.
*   The vouchers are not transferable among accounts. Only the creator of the mosaic can transfer vouchers to other accounts and once an account owns a voucher it can only be transferred back to the creator.

The definition also implies a levy with each transfer. The levy section states that there is an additional fee of 10 XEM for each transfer. That fee is send to the recipient with address TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH.
This levy part of the transaction is optional. If that part is ommited no additional fee arises from transferring the mosaics.

Reasons for NIS now accepting the transactions are most likely:

*   The transaction signer does not own the namespace that is specified in the mosaic definition or the namespace has expired.
*   A mosaic definition with the specified mosaic id already exists (see discussion below about altering mosaic definitions).
*   The public key of the creation fee sink is invalid or the creation fee is too low.
*   The mosaic id in the levy part of the transaction is unknown to NIS.

When the transaction gets included into a block and the block is executed, The creator will be credited the amount of mosaics stated in the 'initialSupply' field (in the example 1000).

### Altering a mosaic definition

There might be the need to alter a mosaic definition, either because you want to change the description or because you supplied faulty properties or faulty levy data. This is done simply by issuing another mosaic definition creation transaction as described above with the same mosaic id but different description/properties/levy. However there are some restriction when doing so:

*   The description can be changed at any point even if the creator does not own the entire supply.
*   Properties and the levy data can **only** be changed if the creator owns every single mosaic of that type. This is necessary to prevent the creator from secretly introducing a levy or inflating the mosaic by increasing the supply.

Keep in mind that renewing the mosaic definition costs you 10 XEM again, so it is worthwhile to double check the data before issuing the transaction.

### Changing the mosaic supply

In case you created a mosaic definition with 'supplyMutable' set to true, you are able to change the mosaic supply. To do so, you must issue a [MosaicSupplyChangeTransaction](#mosaicSupplyChangeTransaction). This is done by sending a RequestPrepareAnnounce JSON object to NIS which in this case would look like this:

```json

{
        "transaction":
        {
            "timeStamp": 9111526,
            "fee": 150000,
            "type": 16386,
            "deadline": 9154726,
            "version": -1744830463,
            "signer": "d99e88c90da71a4b0d848454e59e296c9ef7a8f018f3eaa3a198dc460b6621a4",
            "supplyType": 1,
            "delta": 100,
            "mosaicId": {
                "namespaceId": "alice.vouchers",
                "name": "Alice's gift vouchers"
            }
        },
        "privateKey": "00983bb01d05edecfaef55df9486c111abb6299c754a002069b1d0ef4537441bda"
}

```


In the above example the supply for an existing mosaic with id 'alice.vouchers \* Alice's gift vouchers' is changed. Specifically

*   the supplyType 1 means the supply is increased (a supply type of 2 means a supply decrease).
*   the delta of 100 means that another 100 units are credited to the creators account.

Reasons for NIS now accepting the transactions are most likely:

*   The transaction signer is not the creator os the mosaic.
*   The mosaic definition states that the supply is immutable.
*   When attempting to increase the supply, the total supply must not exceed 9,000,000,000 mosaics.
*   When attempting to decrease the supply, the creator must own the number of mosaics that he wants to delete.

After the transaction gets included into the block chain, the supply change is realized.

Creating a signed transaction
-----------------------------

This chapter explains which data from the transactions you need to sign and what JSON object you to send to NIS.

### Gathering data for the signature

To create a transaction signature you need to sign an array of bytes extracted from the transaction. Since there is more than one type of transaction the byte array will have a different structure for different types of transactions. Nevertheless the first part of the byte array has the same structure for every transaction. Note that:

*   when the field denotes a number the endianess matters.
*   the order in which the fields are concatenated matters.
Common transaction part of the byte array*   **Transaction type:** 4 bytes (integer). The following types are supported:
    *   0x0101 (transfer transaction)
    *   0x0801 (importance transfer transaction)
    *   0x1001 (multisig aggregate modification transfer transaction)
    *   0x1002 (multisig signature transaction)
    *   0x1004 (multisig transaction)
    *   0x2001 (provision namespace transaction)
    *   0x4001 (mosaic definition creation transaction)
    *   0x4002 (mosaic supply change transaction)
    **example (importance transfer transaction):** 0x01, 0x08, 0x00, 0x00
*   **Version:** 4 bytes (integer). The following versions are supported:

    For importance transfer transactions, multisig transactions, multisig signature transactions, provision namespace transactions, mosaic definition creation transactions and mosaic supply change transactions the version must be

    *   0x68 << 24 + 1 (main network)
    *   0x60 << 24 + 1 (mijin network)
    *   0x98 << 24 + 1 (test network)
    **Example (main network):** 0x01, 0x00, 0x00, 0x68

    For transfer transactions and multisig aggregate modification transactions the version must be

    *   0x68 << 24 + 2 (main network)
    *   0x60 << 24 + 2 (mijin network)
    *   0x98 << 24 + 2 (test network)
    **Example (main network):** 0x02, 0x00, 0x00, 0x68
*   **Timestamp:** 4 bytes (integer).
    **Example (timestamp = 0x129623):** 0x23, 0x96, 0x12, 0x00
*   **Length of public key byte array (always 32):** 4 bytes (integer).
    **Always:** 0x20, 0x00, 0x00, 0x00
*   **Public key bytes of signer:** 32 bytes.
    **Example:** 0x6d, 0xa3, 0x76, 0x07, 0x13, 0x01, 0x9e, 0x26, 0xb1, 0x86, 0x24, 0x3a, 0xb6, 0xec, 0xba, 0x9f, 0x70, 0x78, 0x4c, 0x59, 0x92, 0x3d, 0x68, 0x9a, 0xb5, 0x4d, 0x4b, 0x2b, 0xf0, 0xe2, 0x0f, 0x5d
*   **Fee (micro nem):** 8 bytes (long).
    **Example (12 nem):** 0x00, 0x1b, 0xb7, 0x00, 0x00, 0x00, 0x00, 0x00
*   **Deadline:** 4 bytes (integer).
    **Example (deadline = 0x147824):** 0x24, 0x78, 0x14, 0x00
Transfer transaction part*   **Length of recipient address (always 40):** 4 bytes (integer).
    **Always:** 0x28, 0x00, 0x00, 0x00
*   **Recipient address:** 40 bytes (using UTF8 encoding).
    **Example ("NACCH2WPJYVQ3PLGMVZVRK5JI6POTJXXHLUG3P4J"):** 0x4e, 0x41, 0x43, 0x43, 0x48, 0x32, 0x57, 0x50, 0x4a, 0x59, 0x56, 0x51, 0x33, 0x50, 0x4c, 0x47, 0x4d, 0x56, 0x5a, 0x56, 0x52, 0x4b, 0x35, 0x4a, 0x49, 0x36, 0x50, 0x4f, 0x54, 0x4a, 0x58, 0x58, 0x48, 0x4c, 0x55, 0x47, 0x33, 0x50, 0x34, 0x4a
*   **Amount (micro nem):** 8 bytes (long).
    **Example (1234 NEM):** 0x80, 0x58, 0x8d, 0x49, 0x00, 0x00, 0x00, 0x00
*   **Length of message field:** 4 bytes (integer). Note: if the length is 0 then the following 2 fields do not apply.
    **Example:** 0x24, 0x00, 0x00, 0x00
*   **Message type:** 4 bytes (integer). The following message types are supported.
    *   0x01 (plain message)
    *   0x02 (secure, i.e. encrypted, message)
    **Example:** 0x01, 0x00, 0x00, 0x00
*   **Length of payload:** 4 bytes (integer).
    **Example:** 0x05, 0x00, 0x00, 0x00
*   **Payload:** UTF8 encoded string.
    **Example ("Hello"):** 0x48, 0x65, 0x6c, 0x6c, 0x6f

**Note:** the following part is optional and only available for version 2 transfer transactions that have an attachment.

*   **Number of mosaics:** 4 bytes (integer).
    **Example (1 mosaic):** 0x01, 0x00, 0x00, 0x00

The following part is repeated for every mosaic in the attachment.

*   **Length of mosaic structure:** 4 bytes (integer).
    **Example:** 0x1c, 0x00, 0x00, 0x00
*   **Length of mosaic id structure:** 4 bytes (integer).
    **Example:** 0x10, 0x00, 0x00, 0x00
*   **Length of namespace id string:** 4 bytes (integer).
    **Example:** 0x03, 0x00, 0x00, 0x00
*   **namespace id string:** UTF8 encoded string.
    **Example: ("id9")** 0x69, 0x64, 0x39
*   **Length of mosaic name string:** 4 bytes (integer).
    **Example:** 0x05, 0x00, 0x00, 0x00
*   **Mosaic name string:** UTF8 encoded string.
    **Example: ("name9")** 0x6e, 0x61, 0x6d, 0x65, 0x39
*   **Quantity:** 8 bytes (long).
    **Example: (24)** 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
Importance transfer transaction part*   **Importance transfer mode:** 4 bytes (integer). The following modes are supported:
    *   0x01 (Activate)
    *   0x02 (Deactivate)
    **Example (mode Activate):** 0x01, 0x00, 0x00, 0x00
*   **Length of remote account public key byte array (always 32):** 4 bytes (integer).
    **Always:** 0x20, 0x00, 0x00, 0x00
*   **Public key bytes of remote account:** 32 bytes.
    **Example:** 0x6d, 0xa3, 0x76, 0x07, 0x13, 0x01, 0x9e, 0x26, 0xb1, 0x86, 0x24, 0x3a, 0xb6, 0xec, 0xba, 0x9f, 0x70, 0x78, 0x4c, 0x59, 0x92, 0x3d, 0x68, 0x9a, 0xb5, 0x4d, 0x4b, 0x2b, 0xf0, 0xe2, 0x0f, 0x5d
Aggregate modification transaction part*   **Number of cosignatory modifications:** 4 bytes (integer).
    **Example:** 0x03, 0x00, 0x00, 0x00

The following part is repeated for every cosignatory modification

*   **Length of cosignatory modification structure:** 4 bytes (integer).
    **Always:** 0x28, 0x00, 0x00, 0x00
*   **Modification type:** 4 bytes (integer). The following modification types are supported:
    *   0x01 (Add cosignatory)
    *   0x02 (Delete cosignatory)
    **Example (Delete):** 0x02, 0x00, 0x00, 0x00
*   **Length of cosignatory's public key byte array (always 32):** 4 bytes (integer).
    **Always:** 0x20, 0x00, 0x00, 0x00
*   **Public key bytes of cosignatory:** 32 bytes.
    **Example:** 0x6d, 0xa3, 0x76, 0x07, 0x13, 0x01, 0x9e, 0x26, 0xb1, 0x86, 0x24, 0x3a, 0xb6, 0xec, 0xba, 0x9f, 0x70, 0x78, 0x4c, 0x59, 0x92, 0x3d, 0x68, 0x9a, 0xb5, 0x4d, 0x4b, 0x2b, 0xf0, 0xe2, 0x0f, 0x5d

The following part describes the minimum cosignatories modification. The part is optional. Version 1 aggregate modification transactions should omit this part. Version 2 aggregate modification transactions with no minimum cosignatories modification should only write the length field with value 0x00, 0x00, 0x00, 0x00.

*   **Length of minimum cosignatories modification structure:** 4 bytes (integer).
    **Always:** 0x04, 0x00, 0x00, 0x00
*   **Relative change:** 4 bytes (integer).
    **Example (relative change of 2):** 0x02, 0x00, 0x00, 0x00
Multisig signature transaction part*   **Length of hash object (hash of the corresponding multisig transaction):** 4 bytes (integer).
    **Always:** 0x24, 0x00, 0x00, 0x00
*   **Length of hash:** 4 bytes (integer).
    **Always:** 0x20, 0x00, 0x00, 0x00
*   **SHA3 hash bytes:** 32 bytes.
    **Example:** 0x7d, 0x76, 0xfe, 0x26, 0xc4, 0x54, 0x61, 0xf7, 0x4b, 0xcb, 0x76, 0xac, 0xae, 0xb0, 0x17, 0x39, 0x9e, 0xbe, 0x50, 0xaa, 0x71, 0x46, 0xe2, 0x62, 0x57, 0x39, 0x5f,0xbb,0xc0,0x25,0xac,0xb7
*   **Length of address of the corresponding multisig account (always 40):** 4 bytes (integer).
    **Always:** 0x28, 0x00, 0x00, 0x00
*   **Multisig account address:** 40 bytes (using UTF8 encoding).
    **Example ("NACCH2WPJYVQ3PLGMVZVRK5JI6POTJXXHLUG3P4J"):** 0x4e, 0x41, 0x43, 0x43, 0x48, 0x32, 0x57, 0x50, 0x4a, 0x59, 0x56, 0x51, 0x33, 0x50, 0x4c, 0x47, 0x4d, 0x56, 0x5a, 0x56, 0x52, 0x4b, 0x35, 0x4a, 0x49, 0x36, 0x50, 0x4f, 0x54, 0x4a, 0x58, 0x58, 0x48, 0x4c, 0x55, 0x47, 0x33, 0x50, 0x34, 0x4a
Multisig transaction part*   **Length of inner transaction object. This can be a transfer, an importance transfer or an aggregate modification transaction.**
    **Example:** 0x74, 0x00, 0x00, 0x00

What follows here is the inner transaction object. The structure is one of the structures described above transactions (excluding signature transactions).

Provision namespace transaction part*   **Length of rental fee sink's Encoded Address (always 40):** 4 bytes (integer).
    **Always:** 0x28, 0x00, 0x00, 0x00
*   **Address bytes of rental fee sink:** 40 bytes.
    **Network dependant sink address (i.e. TAMESPACEWH4MKFMBCVFERDPOOP4FK7MTDJEYP35):** 0x54, 0x41, 0x4d, 0x45, 0x53, 0x50, 0x41, 0x43, 0x45, 0x57, 0x48, 0x34, 0x4d, 0x4b, 0x46, 0x4d, 0x42, 0x43, 0x56, 0x46, 0x45, 0x52, 0x44, 0x50, 0x4f, 0x4f, 0x50, 0x34, 0x46, 0x4b, 0x37, 0x4d, 0x54, 0x44, 0x4a, 0x45, 0x59, 0x50, 0x33, 0x35
*   **Rental fee (Root always: 100000000, Sub always: 10000000) for namespace:** 8 bytes (long).
    *   **Root always:** 0x00, 0xe1, 0xf5, 0x05, 0x00, 0x00, 0x00, 0x00
    *   **Sub always:** 0x80, 0x96, 0x98, 0x00, 0x00, 0x00, 0x00, 0x00
*   **Length of new part string:** 4 bytes (integer).
    **Example:** 0x03, 0x00, 0x00, 0x00
*   **New part string:** UTF8 encoded string.
    **Example: ("bar")** 0x62, 0x61, 0x72
*   **Length of parent string:** 4 bytes (integer). **Note:** If the parent should be null (provisioning a root namespace), then this field has to be set to 0xff, 0xff, 0xff, 0xff and the next field is omitted!
    **Example:** 0x03, 0x00, 0x00, 0x00
*   **Parent string:** UTF8 encoded string.
    **Example: ("foo")** 0x66, 0x6f, 0x6f
Mosaic definition creation transaction part*   **Length of mosaic definition structure:** 4 bytes (integer).
    **Example:** 0x29, 0x01, 0x00, 0x00
*   **Length of creator's public key byte array (always 32):** 4 bytes (integer).
    **Always:** 0x20, 0x00, 0x00, 0x00
*   **Public key bytes of creator:** 32 bytes.
    **Example:** 0x8f, 0xcd, 0xce, 0xd0, 0x85, 0xcb, 0x58, 0xe3, 0x62, 0x6e, 0x7e, 0xfb, 0xab, 0xc7, 0xa6, 0x3d, 0x87, 0x3e, 0x7d, 0xf5, 0xb6, 0x24, 0x6c, 0x65, 0x9b, 0x2c, 0x10, 0x8f, 0x90, 0xab, 0x44, 0xf2
*   **Length of mosaic id structure:** 4 bytes (integer).
    **Example:** 0x2b, 0x00, 0x00, 0x00
*   **Length of namespace id string:** 4 bytes (integer).
    **Example:** 0x0e, 0x00, 0x00, 0x00
*   **Namespace id string:** UTF8 encoded string.
    **Example: ("alice.vouchers")** 0x61, 0x6c, 0x69, 0x63, 0x65, 0x2e, 0x76, 0x6f, 0x75, 0x63, 0x68, 0x65, 0x72, 0x73
*   **Length of mosaic name string:** 4 bytes (integer).
    **Example:** 0x15, 0x00, 0x00, 0x00
*   **Mosaic name string:** UTF8 encoded string.
    **Example: ("Alice's gift vouchers")** 0x41, 0x6c, 0x69, 0x63, 0x65, 0x27, 0x73, 0x20, 0x67, 0x69, 0x66, 0x74, 0x20, 0x76, 0x6f, 0x75, 0x63, 0x68, 0x65, 0x72, 0x73
*   **Length of description string:** 4 bytes (integer).
    **Example:** 0x11, 0x00, 0x00, 0x00
*   **Description string:** UTF8 encoded string.
    **Example: ("precious vouchers")** 0x70, 0x72, 0x65, 0x63, 0x69, 0x6f, 0x75, 0x73, 0x20, 0x76, 0x6f, 0x75, 0x63, 0x68, 0x65, 0x72, 0x73
*   **Number of properties:** 4 bytes (integer).
    **Example:** 0x02, 0x00, 0x00, 0x00

The following 5 fields are repeated for every property. **Note:** The property values are always strings

*   **Length of the property structure:** 4 bytes (integer).
    **Example:** 0x15, 0x00, 0x00, 0x00
*   **Length of the property name:** 4 bytes (integer).
    **Example:** 0x0c, 0x00, 0x00, 0x00
*   **Property name:** UTF8 encoded string.
    **Example: ("divisibility")** 0x64, 0x69, 0x76, 0x69, 0x73, 0x69, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79
*   **Length of the property value:** 4 bytes (integer).
    **Example:** 0x01, 0x00, 0x00, 0x00
*   **Property value:** UTF8 encoded string.
    **Example: ("3")** 0x33
*   **Length of the property structure:** 4 bytes (integer).
    **Example:** 0x16, 0x00, 0x00, 0x00
*   **Length of the property name:** 4 bytes (integer).
    **Example:** 0x0d, 0x00, 0x00, 0x00
*   **Property name:** UTF8 encoded string.
    **Example: ("initialSupply")** 0x69, 0x6e, 0x69, 0x74, 0x69, 0x61, 0x6c, 0x53, 0x75, 0x70, 0x70, 0x6c, 0x79
*   **Length of the property value:** 4 bytes (integer).
    **Example:** 0x01, 0x00, 0x00, 0x00
*   **Property value:** UTF8 encoded string.
    **Example: ("0")** 0x30
*   **Length of the property structure:** 4 bytes (integer).
    **Example:** 0x1a, 0x00, 0x00, 0x00
*   **Length of the property name:** 4 bytes (integer).
    **Example:** 0x0d, 0x00, 0x00, 0x00
*   **Property name:** UTF8 encoded string.
    **Example: ("supplyMutable")** 0x73, 0x75, 0x70, 0x70, 0x6c, 0x79, 0x4d, 0x75, 0x74, 0x61, 0x62, 0x6c, 0x65
*   **Length of the property value:** 4 bytes (integer).
    **Example:** 0x05, 0x00, 0x00, 0x00
*   **Property value:** UTF8 encoded string.
    **Example: ("false")** 0x66, 0x61, 0x6c, 0x73, 0x65
*   **Length of the property structure:** 4 bytes (integer).
    **Example:** 0x18, 0x00, 0x00, 0x00
*   **Length of the property name:** 4 bytes (integer).
    **Example:** 0x0c, 0x00, 0x00, 0x00
*   **Property name:** UTF8 encoded string.
    **Example: ("transferable")** 0x74, 0x72, 0x61, 0x6e, 0x73, 0x66, 0x65, 0x72, 0x61, 0x62, 0x6c, 0x65
*   **Length of the property value:** 4 bytes (integer).
    **Example:** 0x04, 0x00, 0x00, 0x00
*   **Property value:** UTF8 encoded string.
    **Example: ("true")** 0x74, 0x72, 0x75, 0x65

**Note:** The following levy object is optional. Set length field to 0 if the mosaic definition has no levy and omit all subsequent fields up to the comment "The levy structure ends here.".

*   **Length of levy structure:** 4 bytes (integer).
    **Example:** 0x4c, 0x00, 0x00, 0x00
*   **Fee type:** 4 bytes (integer). The following fee types are supported.
    *   0x01 (absolute fee)
    *   0x02 (percentile fee)
    **Example:** 0x01, 0x00, 0x00, 0x00
*   **Length of recipient address field (always 40):** 4 bytes (integer).
    **Example:** 0x28, 0x00, 0x00, 0x00
*   **Recipient address:** 40 bytes (using UTF8 encoding).
    **Example ("NACCH2WPJYVQ3PLGMVZVRK5JI6POTJXXHLUG3P4J"):** 0x4e, 0x41, 0x43, 0x43, 0x48, 0x32, 0x57, 0x50, 0x4a, 0x59, 0x56, 0x51, 0x33, 0x50, 0x4c, 0x47, 0x4d, 0x56, 0x5a, 0x56, 0x52, 0x4b, 0x35, 0x4a, 0x49, 0x36, 0x50, 0x4f, 0x54, 0x4a, 0x58, 0x58, 0x48, 0x4c, 0x55, 0x47, 0x33, 0x50, 0x34, 0x4a
*   **Length of mosaic id structure:** 4 bytes (integer).
    **Example:** 0x10, 0x00, 0x00, 0x00
*   **Length of namespace id string:** 4 bytes (integer).
    **Example:** 0x03, 0x00, 0x00, 0x00
*   **Namespace id string:** UTF8 encoded string.
    **Example: ("id2")** 0x69, 0x64, 0x32
*   **Length of mosaic name string:** 4 bytes (integer).
    **Example:** 0x05, 0x00, 0x00, 0x00
*   **Mosaic name string:** UTF8 encoded string.
    **Example: ("name2")** 0x6e, 0x61, 0x6d, 0x65, 0x32
*   **Fee quantity:** 8 bytes (long).
    **Example: (123)** 0x7b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

The levy structure ends here.

*   **Length of creation fee sink's encoded address byte array (always 40):** 4 bytes (integer).
    **Always:** 0x28, 0x00, 0x00, 0x00
*   **Address key bytes of creation fee sink:** 40 bytes.
    **Network dependant sink address (i.e. TBMOSAICOD4F54EE5CDMR23CCBGOAM2XSJBR5OLC):** 0x54, 0x42, 0x4d, 0x4f, 0x53, 0x41, 0x49, 0x43, 0x4f, 0x44, 0x34, 0x46, 0x35, 0x34, 0x45, 0x45, 0x35, 0x43, 0x44, 0x4d, 0x52, 0x32, 0x33, 0x43, 0x43, 0x42, 0x47, 0x4f, 0x41, 0x4d, 0x32, 0x58, 0x53, 0x4a, 0x42, 0x52, 0x35, 0x4f, 0x4c, 0x43
*   **Fee quantity:** 8 bytes (long).
    **Always: (5000000000)** 0x00, 0xf2, 0x05, 0x2a, 0x01, 0x00, 0x00, 0x00
Mosaic supply change transaction part*   **Length of mosaic id structure:** 4 bytes (integer).
    **Example:** 0x12, 0x00, 0x00, 0x00
*   **Length of namespace id string:** 4 bytes (integer).
    **Example:** 0x07, 0x00, 0x00, 0x00
*   **Namespace id string:** UTF8 encoded string.
    **Example: ("foo.bar")** 0x66, 0x6f, 0x6f, 0x2e, 0x62, 0x61, 0x72
*   **Length of mosaic name string:** 4 bytes (integer).
    **Example:** 0x03, 0x00, 0x00, 0x00
*   **Mosaic name string:** UTF8 encoded string.
    **Example: ("baz")** 0x62, 0x61, 0x7a
*   **Supply type:** 4 bytes (integer). The following supply types are supported.
    *   0x01 (increase supply)
    *   0x02 (decrease supply)
    **Example:** 0x01, 0x00, 0x00, 0x00
*   **Delta (change in supply):** 8 bytes (long).
    **Example: (100)** 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
Building the byte array

To build the final byte array that needs to be signed, simply concatenate the common part for a transaction and the type specific part. For example if you want to build the byte array for a transfer transaction you have as common something that looks like

0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6f, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x68, 0x32, 0x03, 0xb4, 0x55, 0x09, 0x0e, 0x2f, 0xfe, 0xd6, 0x48, 0x53, 0x6c, 0x99, 0x01, 0x4d, 0x1c, 0xa9, 0x2c, 0x10, 0x47, 0xaf, 0xbc, 0xae, 0x58, 0x05, 0x7b, 0xb6, 0xa6, 0x98, 0xc8, 0x0b, 0x80, 0x84, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

and a transfer transaction specific part

0x28, 0x00, 0x00, 0x00, 0x54, 0x41, 0x49, 0x34, 0x35, 0x32, 0x53, 0x37, 0x44, 0x4c, 0x36, 0x57, 0x48, 0x57, 0x54, 0x5a, 0x5a, 0x32, 0x57, 0x33, 0x44, 0x49, 0x4d, 0x34, 0x32, 0x36, 0x58, 0x57, 0x49, 0x4a, 0x4b, 0x4c, 0x55, 0x4e, 0x58, 0x4e, 0x4b, 0x54, 0x37, 0x4c, 0x40, 0x2f, 0x07, 0x2f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

which gives you the final array

0x01, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x6f, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x68, 0x32, 0x03, 0xb4, 0x55, 0x09, 0x0e, 0x2f, 0xfe, 0xd6, 0x48, 0x53, 0x6c, 0x99, 0x01, 0x4d, 0x1c, 0xa9, 0x2c, 0x10, 0x47, 0xaf, 0xbc, 0xae, 0x58, 0x05, 0x7b, 0xb6, 0xa6, 0x98, 0xc8, 0x0b, 0x80, 0x84, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 0x28, 0x00, 0x00, 0x00, 0x54, 0x41, 0x49, 0x34, 0x35, 0x32, 0x53, 0x37, 0x44, 0x4c, 0x36, 0x57, 0x48, 0x57, 0x54, 0x5a, 0x5a, 0x32, 0x57, 0x33, 0x44, 0x49, 0x4d, 0x34, 0x32, 0x36, 0x58, 0x57, 0x49, 0x4a, 0x4b, 0x4c, 0x55, 0x4e, 0x58, 0x4e, 0x4b, 0x54, 0x37, 0x4c, 0x40, 0x2f, 0x07, 0x2f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

Signing this array will give you the 64 byte long signature.

Calculating the hash of a transaction

NIS uses the SHA3-256 hash function. To create a hash of a transaction you need to hash the byte array of the transaction. See the section above to learn how to build the byte array from a transaction.

### Sending the data to NIS

After preparing the data as described in the last section you can send the array and the corresponding signature via a RequestAnnounce request


|API path:            |Request type: POST|
|---------------------|------------------|
|/transaction/announce|                  |


#### Description:

Creates and broadcasts a transaction. The private key is not involved.

#### Parameter:



#### Example:

Request cannot be performed in a browser.

#### Example of returned JSON [NemAnnounceResult](#nemAnnounceResult) object:

```json
{
        "type":1,
        "code":1,
        "message":"SUCCESS",
        "transactionHash": {
        "data":"c1786437336da077cd572a27710c40c378610e8d33880bcb7bdb0a42e3d35586"
        },
        "innerTransactionHash": {
        "data":"cc317a7674d56352b4c711096a7594bd11908bf518293a191fc2faa12eac0fbb"
        }
}
```


#### Possible Errors:

The possible erros are described in chapter 6.1.

Transaction fees
----------------

In order for the harvesters to have an incentive to run a node that is harvesting blocks, users have to pay a fee for every transaction that is going to be included in a block chain.

Different transaction types have different fees. In order to get a transaction validated by a NIS, the fee provided must be at least the minimum fee.

**Note:** Depending on the transaction type there could be additional fees due to the action during transaction execution (e.g. renting a namespace)

The following chart summarizes the minimum fees for each transaction type. All calculation are done with rounded amounts of XEM (i.e. micro XEM are ignored):



* Transfer transaction: Importance transfer transaction
  * The fee is the sum of the fee for transferring an amount of                    XEM and the fee for appending a message to the transaction.Fees for transferring XEM to another account:                    0.05 XEM per 10,000 XEM transferred, capped at 1.25 XEM                    Example:                    0.20 XEM fee for a 45,000 XEM transfer, 1.25 XEM fee for a 500,000 XEM transfer.Fees for appending a message to a transaction:                    0.05 XEM per commenced 32 message bytes (messageLength / 32 + 1).                    Example:                    The unencrypted message „The New Economy Movement will change the world!!!” has a length 49                    characters and thus will cost 0.15 XEM fee.Fees for transferring a mosaic to another account:                    mosaics with divisibility of 0 and a maximum supply of 10,000 are called small business mosaics.	                    0.05 XEM fee for any transfer of a small business mosaic. For each mosaic that is transferred the fee is calculated the following way:                        given a mosaic with initial supply s, divisibility d and quantity q, the XEM equivalent is (round to the next smaller integer)                        xemEquivalent = (8,999,999,999 * q) / (s * 10^d)                         To take into account the total quantities for different mosaics, an adjustment term is calculated.                        For a mosaic called m calculate maxMosaicQuantity = 9,000,000,000,000,000  totalMosaicQuantity = mosaic m supply * 10 ^ (mosaic m divisibility)  supplyRelatedAdjustment = floor(0.8 * ln(maxMosaicQuantity  / totalMosaicQuantity)  Then the unweighted fee is calculated as                                unweightedFee = max(1L, xemFee - supplyRelatedAdjustment)Finally, the weighted fee can be calculated:                                fee = unweightedFee * feeUnit                        Example:                        Suppose you have a mosaic with 9,000,000 supply and divisibility of 3.						 totalMosaicQuantity  = 9,000,000 * 1,000 = 9,000,000,000  supplyRelatedAdjustment = floor(0.8 * ln(9,000,000,000,000,000 / 9,000,000,000)) = floor(11.052) = 11  transferring 150 such mosaics (i.e. a quantity of 150,000 smallest units) has	                        xemEquivalent = (8,999,999,999 * 150,000) / (9,000,000 * 10^3) = 149,999	                        xemFee = 14 XEM So the transaction will have the following unweighted fee:	                        unweightedFee = 14 XEM - 11 XEM = 3 XEMWeighted with the current fee unit of 0.05:                                fee = 3 XEM * 0.05 = 0.15 XEM: 0.15 XEM
* Transfer transaction: Aggregate modification transaction
  * The fee is the sum of the fee for transferring an amount of                    XEM and the fee for appending a message to the transaction.Fees for transferring XEM to another account:                    0.05 XEM per 10,000 XEM transferred, capped at 1.25 XEM                    Example:                    0.20 XEM fee for a 45,000 XEM transfer, 1.25 XEM fee for a 500,000 XEM transfer.Fees for appending a message to a transaction:                    0.05 XEM per commenced 32 message bytes (messageLength / 32 + 1).                    Example:                    The unencrypted message „The New Economy Movement will change the world!!!” has a length 49                    characters and thus will cost 0.15 XEM fee.Fees for transferring a mosaic to another account:                    mosaics with divisibility of 0 and a maximum supply of 10,000 are called small business mosaics.	                    0.05 XEM fee for any transfer of a small business mosaic. For each mosaic that is transferred the fee is calculated the following way:                        given a mosaic with initial supply s, divisibility d and quantity q, the XEM equivalent is (round to the next smaller integer)                        xemEquivalent = (8,999,999,999 * q) / (s * 10^d)                         To take into account the total quantities for different mosaics, an adjustment term is calculated.                        For a mosaic called m calculate maxMosaicQuantity = 9,000,000,000,000,000  totalMosaicQuantity = mosaic m supply * 10 ^ (mosaic m divisibility)  supplyRelatedAdjustment = floor(0.8 * ln(maxMosaicQuantity  / totalMosaicQuantity)  Then the unweighted fee is calculated as                                unweightedFee = max(1L, xemFee - supplyRelatedAdjustment)Finally, the weighted fee can be calculated:                                fee = unweightedFee * feeUnit                        Example:                        Suppose you have a mosaic with 9,000,000 supply and divisibility of 3.						 totalMosaicQuantity  = 9,000,000 * 1,000 = 9,000,000,000  supplyRelatedAdjustment = floor(0.8 * ln(9,000,000,000,000,000 / 9,000,000,000)) = floor(11.052) = 11  transferring 150 such mosaics (i.e. a quantity of 150,000 smallest units) has	                        xemEquivalent = (8,999,999,999 * 150,000) / (9,000,000 * 10^3) = 149,999	                        xemFee = 14 XEM So the transaction will have the following unweighted fee:	                        unweightedFee = 14 XEM - 11 XEM = 3 XEMWeighted with the current fee unit of 0.05:                                fee = 3 XEM * 0.05 = 0.15 XEM: 0.5 XEM
* Transfer transaction: Multisig transaction
  * The fee is the sum of the fee for transferring an amount of                    XEM and the fee for appending a message to the transaction.Fees for transferring XEM to another account:                    0.05 XEM per 10,000 XEM transferred, capped at 1.25 XEM                    Example:                    0.20 XEM fee for a 45,000 XEM transfer, 1.25 XEM fee for a 500,000 XEM transfer.Fees for appending a message to a transaction:                    0.05 XEM per commenced 32 message bytes (messageLength / 32 + 1).                    Example:                    The unencrypted message „The New Economy Movement will change the world!!!” has a length 49                    characters and thus will cost 0.15 XEM fee.Fees for transferring a mosaic to another account:                    mosaics with divisibility of 0 and a maximum supply of 10,000 are called small business mosaics.	                    0.05 XEM fee for any transfer of a small business mosaic. For each mosaic that is transferred the fee is calculated the following way:                        given a mosaic with initial supply s, divisibility d and quantity q, the XEM equivalent is (round to the next smaller integer)                        xemEquivalent = (8,999,999,999 * q) / (s * 10^d)                         To take into account the total quantities for different mosaics, an adjustment term is calculated.                        For a mosaic called m calculate maxMosaicQuantity = 9,000,000,000,000,000  totalMosaicQuantity = mosaic m supply * 10 ^ (mosaic m divisibility)  supplyRelatedAdjustment = floor(0.8 * ln(maxMosaicQuantity  / totalMosaicQuantity)  Then the unweighted fee is calculated as                                unweightedFee = max(1L, xemFee - supplyRelatedAdjustment)Finally, the weighted fee can be calculated:                                fee = unweightedFee * feeUnit                        Example:                        Suppose you have a mosaic with 9,000,000 supply and divisibility of 3.						 totalMosaicQuantity  = 9,000,000 * 1,000 = 9,000,000,000  supplyRelatedAdjustment = floor(0.8 * ln(9,000,000,000,000,000 / 9,000,000,000)) = floor(11.052) = 11  transferring 150 such mosaics (i.e. a quantity of 150,000 smallest units) has	                        xemEquivalent = (8,999,999,999 * 150,000) / (9,000,000 * 10^3) = 149,999	                        xemFee = 14 XEM So the transaction will have the following unweighted fee:	                        unweightedFee = 14 XEM - 11 XEM = 3 XEMWeighted with the current fee unit of 0.05:                                fee = 3 XEM * 0.05 = 0.15 XEM: 0.15 XEM
* Transfer transaction: Multisig signature transaction
  * The fee is the sum of the fee for transferring an amount of                    XEM and the fee for appending a message to the transaction.Fees for transferring XEM to another account:                    0.05 XEM per 10,000 XEM transferred, capped at 1.25 XEM                    Example:                    0.20 XEM fee for a 45,000 XEM transfer, 1.25 XEM fee for a 500,000 XEM transfer.Fees for appending a message to a transaction:                    0.05 XEM per commenced 32 message bytes (messageLength / 32 + 1).                    Example:                    The unencrypted message „The New Economy Movement will change the world!!!” has a length 49                    characters and thus will cost 0.15 XEM fee.Fees for transferring a mosaic to another account:                    mosaics with divisibility of 0 and a maximum supply of 10,000 are called small business mosaics.	                    0.05 XEM fee for any transfer of a small business mosaic. For each mosaic that is transferred the fee is calculated the following way:                        given a mosaic with initial supply s, divisibility d and quantity q, the XEM equivalent is (round to the next smaller integer)                        xemEquivalent = (8,999,999,999 * q) / (s * 10^d)                         To take into account the total quantities for different mosaics, an adjustment term is calculated.                        For a mosaic called m calculate maxMosaicQuantity = 9,000,000,000,000,000  totalMosaicQuantity = mosaic m supply * 10 ^ (mosaic m divisibility)  supplyRelatedAdjustment = floor(0.8 * ln(maxMosaicQuantity  / totalMosaicQuantity)  Then the unweighted fee is calculated as                                unweightedFee = max(1L, xemFee - supplyRelatedAdjustment)Finally, the weighted fee can be calculated:                                fee = unweightedFee * feeUnit                        Example:                        Suppose you have a mosaic with 9,000,000 supply and divisibility of 3.						 totalMosaicQuantity  = 9,000,000 * 1,000 = 9,000,000,000  supplyRelatedAdjustment = floor(0.8 * ln(9,000,000,000,000,000 / 9,000,000,000)) = floor(11.052) = 11  transferring 150 such mosaics (i.e. a quantity of 150,000 smallest units) has	                        xemEquivalent = (8,999,999,999 * 150,000) / (9,000,000 * 10^3) = 149,999	                        xemFee = 14 XEM So the transaction will have the following unweighted fee:	                        unweightedFee = 14 XEM - 11 XEM = 3 XEMWeighted with the current fee unit of 0.05:                                fee = 3 XEM * 0.05 = 0.15 XEM: 0.15 XEM
* Transfer transaction: Provision namespace transaction
  * The fee is the sum of the fee for transferring an amount of                    XEM and the fee for appending a message to the transaction.Fees for transferring XEM to another account:                    0.05 XEM per 10,000 XEM transferred, capped at 1.25 XEM                    Example:                    0.20 XEM fee for a 45,000 XEM transfer, 1.25 XEM fee for a 500,000 XEM transfer.Fees for appending a message to a transaction:                    0.05 XEM per commenced 32 message bytes (messageLength / 32 + 1).                    Example:                    The unencrypted message „The New Economy Movement will change the world!!!” has a length 49                    characters and thus will cost 0.15 XEM fee.Fees for transferring a mosaic to another account:                    mosaics with divisibility of 0 and a maximum supply of 10,000 are called small business mosaics.	                    0.05 XEM fee for any transfer of a small business mosaic. For each mosaic that is transferred the fee is calculated the following way:                        given a mosaic with initial supply s, divisibility d and quantity q, the XEM equivalent is (round to the next smaller integer)                        xemEquivalent = (8,999,999,999 * q) / (s * 10^d)                         To take into account the total quantities for different mosaics, an adjustment term is calculated.                        For a mosaic called m calculate maxMosaicQuantity = 9,000,000,000,000,000  totalMosaicQuantity = mosaic m supply * 10 ^ (mosaic m divisibility)  supplyRelatedAdjustment = floor(0.8 * ln(maxMosaicQuantity  / totalMosaicQuantity)  Then the unweighted fee is calculated as                                unweightedFee = max(1L, xemFee - supplyRelatedAdjustment)Finally, the weighted fee can be calculated:                                fee = unweightedFee * feeUnit                        Example:                        Suppose you have a mosaic with 9,000,000 supply and divisibility of 3.						 totalMosaicQuantity  = 9,000,000 * 1,000 = 9,000,000,000  supplyRelatedAdjustment = floor(0.8 * ln(9,000,000,000,000,000 / 9,000,000,000)) = floor(11.052) = 11  transferring 150 such mosaics (i.e. a quantity of 150,000 smallest units) has	                        xemEquivalent = (8,999,999,999 * 150,000) / (9,000,000 * 10^3) = 149,999	                        xemFee = 14 XEM So the transaction will have the following unweighted fee:	                        unweightedFee = 14 XEM - 11 XEM = 3 XEMWeighted with the current fee unit of 0.05:                                fee = 3 XEM * 0.05 = 0.15 XEM: 0.15 XEMplus:Fee for root namespace provisioning: 100 XEMFee for sub-namespace provisioning: 10 XEM
* Transfer transaction: Mosaic definition creation transaction
  * The fee is the sum of the fee for transferring an amount of                    XEM and the fee for appending a message to the transaction.Fees for transferring XEM to another account:                    0.05 XEM per 10,000 XEM transferred, capped at 1.25 XEM                    Example:                    0.20 XEM fee for a 45,000 XEM transfer, 1.25 XEM fee for a 500,000 XEM transfer.Fees for appending a message to a transaction:                    0.05 XEM per commenced 32 message bytes (messageLength / 32 + 1).                    Example:                    The unencrypted message „The New Economy Movement will change the world!!!” has a length 49                    characters and thus will cost 0.15 XEM fee.Fees for transferring a mosaic to another account:                    mosaics with divisibility of 0 and a maximum supply of 10,000 are called small business mosaics.	                    0.05 XEM fee for any transfer of a small business mosaic. For each mosaic that is transferred the fee is calculated the following way:                        given a mosaic with initial supply s, divisibility d and quantity q, the XEM equivalent is (round to the next smaller integer)                        xemEquivalent = (8,999,999,999 * q) / (s * 10^d)                         To take into account the total quantities for different mosaics, an adjustment term is calculated.                        For a mosaic called m calculate maxMosaicQuantity = 9,000,000,000,000,000  totalMosaicQuantity = mosaic m supply * 10 ^ (mosaic m divisibility)  supplyRelatedAdjustment = floor(0.8 * ln(maxMosaicQuantity  / totalMosaicQuantity)  Then the unweighted fee is calculated as                                unweightedFee = max(1L, xemFee - supplyRelatedAdjustment)Finally, the weighted fee can be calculated:                                fee = unweightedFee * feeUnit                        Example:                        Suppose you have a mosaic with 9,000,000 supply and divisibility of 3.						 totalMosaicQuantity  = 9,000,000 * 1,000 = 9,000,000,000  supplyRelatedAdjustment = floor(0.8 * ln(9,000,000,000,000,000 / 9,000,000,000)) = floor(11.052) = 11  transferring 150 such mosaics (i.e. a quantity of 150,000 smallest units) has	                        xemEquivalent = (8,999,999,999 * 150,000) / (9,000,000 * 10^3) = 149,999	                        xemFee = 14 XEM So the transaction will have the following unweighted fee:	                        unweightedFee = 14 XEM - 11 XEM = 3 XEMWeighted with the current fee unit of 0.05:                                fee = 3 XEM * 0.05 = 0.15 XEM: 0.15 XEM
* Transfer transaction: Mosaic supply change transaction
  * The fee is the sum of the fee for transferring an amount of                    XEM and the fee for appending a message to the transaction.Fees for transferring XEM to another account:                    0.05 XEM per 10,000 XEM transferred, capped at 1.25 XEM                    Example:                    0.20 XEM fee for a 45,000 XEM transfer, 1.25 XEM fee for a 500,000 XEM transfer.Fees for appending a message to a transaction:                    0.05 XEM per commenced 32 message bytes (messageLength / 32 + 1).                    Example:                    The unencrypted message „The New Economy Movement will change the world!!!” has a length 49                    characters and thus will cost 0.15 XEM fee.Fees for transferring a mosaic to another account:                    mosaics with divisibility of 0 and a maximum supply of 10,000 are called small business mosaics.	                    0.05 XEM fee for any transfer of a small business mosaic. For each mosaic that is transferred the fee is calculated the following way:                        given a mosaic with initial supply s, divisibility d and quantity q, the XEM equivalent is (round to the next smaller integer)                        xemEquivalent = (8,999,999,999 * q) / (s * 10^d)                         To take into account the total quantities for different mosaics, an adjustment term is calculated.                        For a mosaic called m calculate maxMosaicQuantity = 9,000,000,000,000,000  totalMosaicQuantity = mosaic m supply * 10 ^ (mosaic m divisibility)  supplyRelatedAdjustment = floor(0.8 * ln(maxMosaicQuantity  / totalMosaicQuantity)  Then the unweighted fee is calculated as                                unweightedFee = max(1L, xemFee - supplyRelatedAdjustment)Finally, the weighted fee can be calculated:                                fee = unweightedFee * feeUnit                        Example:                        Suppose you have a mosaic with 9,000,000 supply and divisibility of 3.						 totalMosaicQuantity  = 9,000,000 * 1,000 = 9,000,000,000  supplyRelatedAdjustment = floor(0.8 * ln(9,000,000,000,000,000 / 9,000,000,000)) = floor(11.052) = 11  transferring 150 such mosaics (i.e. a quantity of 150,000 smallest units) has	                        xemEquivalent = (8,999,999,999 * 150,000) / (9,000,000 * 10^3) = 149,999	                        xemFee = 14 XEM So the transaction will have the following unweighted fee:	                        unweightedFee = 14 XEM - 11 XEM = 3 XEMWeighted with the current fee unit of 0.05:                                fee = 3 XEM * 0.05 = 0.15 XEM: 0.15 XEM


Requests for additional information from NIS
--------------------------------------------

Several requests supply additional information about the internal status of NIS.

Those requests may get dropped in future versions of NIS without further notice, you should not rely on their existence.

Monitoring the network time
---------------------------


|API path:                  |Request type: GET|
|---------------------------|-----------------|
|/debug/time-synchronization|                 |


#### Description:

Gets an array of time synchronization results as described in _Appendix A:_ [TimeSynchronizationResult](#timeSynchronizationResult) . You can monitor the change in network time with this information.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/debug/time-synchronization](http://127.0.0.1:7890/debug/time-synchronization)

#### Example of returned array of JSON [TimeSynchronizationResult](#timeSynchronizationResult) objects:

```json
{
       "data": [
       {
              "dateTime": "2014-11-19 19:23:04",
              "currentTimeOffset": 1747,
              "change": 57
       },
       {
              "dateTime": "2014-11-19 19:24:17",
              "currentTimeOffset": 1776,
              "change": 29
       },
       {
              "dateTime": "2014-11-19 19:25:18",
              "currentTimeOffset": 1729,
              "change": -47
       }]
}
```


#### Possible Errors:

None.

Monitoring incoming and outgoing calls
--------------------------------------


|API path:                  |Request type: GET|
|---------------------------|-----------------|
|/debug/connections/incoming|                 |


#### Description:

Gets an audit collection of incoming calls as described in _Appendix A:_ [AuditCollection](#auditCollection) . You can monitor the outstanding and recent incoming requests with this information.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/debug/connections/incoming](http://127.0.0.1:7890/debug/connections/incoming)

#### Example of returned JSON [AuditCollection](#auditCollection) object:

```json
{
       "outstanding": [
       {
              "path": "/debug/connections/incoming",
              "start-time": 9317306,
              "host": "127.0.0.1",
              "elapsed-time": 0,
              "id": 4070
       }],
       "most-recent": [
       {
              "path": "/debug/connections/incoming",
              "start-time": 9317306,
              "host": "127.0.0.1",
              "elapsed-time": 0,
              "id": 4070
       },
       {
              "path": "/chain/score",
              "start-time": 9317303,
              "host": "95.16.203.168",
              "elapsed-time": 3,
              "id": 4069
       }]
}
```


#### Possible Errors:

None.


|API path:                  |Request type: GET|
|---------------------------|-----------------|
|/debug/connections/outgoing|                 |


#### Description:

Gets an audit collection of outgoing calls as described in _Appendix A:_ [AuditCollection](#auditCollection) . You can monitor the outstanding and recent outgoing requests with this information.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/debug/connections/outgoing](http://127.0.0.1:7890/debug/connections/outgoing)

#### Example of returned JSON [AuditCollection](#auditCollection) object:

```json
{
       "outstanding": [
       {
              "path": "/chain/blocks-after",
              "start-time": 9317511,
              "host": "88.12.55.125",
              "elapsed-time": 6,
              "id": 6452
       }],
       "most-recent": [
       {
              "path": "/chain/blocks-after",
              "start-time": 9317511,
              "host": "88.12.55.125",
              "elapsed-time": 6,
              "id": 6452
       },
       {
              "path": "/chain/hashes-from",
              "start-time": 9317511,
              "host": "88.12.55.125",
              "elapsed-time": 6,
              "id": 6451
       }]
}
```


#### Possible Errors:

None.

Monitoring timers
-----------------


|API path:                |Request type: GET|
|-------------------------|-----------------|
|/debug/connections/timers|                 |


#### Description:

Gets an array of task monitor structures as described in _Appendix A:_ [NemAsyncTimerVisitor](#nemAsyncTimerVisitor) . You can monitor the statistics for periodic tasks with this information.

#### No parameter:

#### Example:

[http://127.0.0.1:7890/debug/timers](http://127.0.0.1:7890/debug/timers)

#### Example of returned array of JSON [NemAsyncTimerVisitor](#nemAsyncTimerVisitor) objects:

```json
{
       "data": [
       {
              "last-delay-time": 3000,
              "executions": 1024,
              "failures": 0,
              "successes": 1024,
              "last-operation-start-time": 9317695,
              "is-executing": 0,
              "name": "FORAGING",
              "average-operation-time": 0,
              "last-operation-time": 0
       },
       {
              "last-delay-time": 74181,
              "executions": 71,
              "failures": 0,
              "successes": 71,
              "last-operation-start-time": 9317654,
              "is-executing": 0,
              "name": "REFRESH",
              "average-operation-time": 6,
              "last-operation-time": 7
       }]
}
```


#### Possible Errors:

None.

Appendix A: Description of the JSON Structures
----------------------------------------------

AccountHistoricalDataViewModel
------------------------------

#### Description:

Nodes can support a feature for retrieving historical data of accounts. If a node supports this feature, it will return an array of AccountHistoricalDataViewModel objects.

#### JSON structure by example:

```json
{
        "height": 8976,
        "address": "NALICELGU3IVY4DPJKHYLSSVYFFWYS5QPLYEZDJJ",
        "balance": 80670000000,
        "vestedBalance": 13949175142,
        "unvestedBalance": 66720824858,
        "importance": 0.00008166760846617221,
        "pageRank": 0.0006944567083595363
}
```


#### Description of the fields:


|height         |The height for which the data is valid.|
|---------------|---------------------------------------|
|address        |The address of the account.            |
|balance        |The balance of the account.            |
|vestedBalance  |The vested part of the balance.        |
|unvestedBalance|The unvested part of the balance.      |
|importance     |The importance of the account.         |
|pageRank       |The page rank part of the importance.  |


AccountImportanceViewModel
--------------------------

#### Description:

Each account is assigned an importance in the NEM network. The ability of an account to generate new blocks is proportional to its importance. The importance is a number between 0 and 1.

#### JSON structure by example:

```json
{
       "address": "TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS"
       "importance":
       {
           "isSet": 1,
           "score": 0.0011561555164258449,
           "ev": 0.004367936531009263,
           "height": 38413
       }
}
```


#### Description of the fields:



* address: importance
  * The address of the account.: Substructure that describes the importance of the account.
* address: isSet
  * The address of the account.: Indicates if the fields "score", "ev" and "height" are available.isSet can have the values 0 or 1. In case            isSet is 0 the fields are not available.
* address: score
  * The address of the account.: The importance of the account. The importance ranges between 0 and 1.
* address: ev
  * The address of the account.: The page rank portion of the importance. The page rank ranges between 0 and 1.
* address: height
  * The address of the account.: The height at which the importance calculation was performed.


AccountInfo
-----------

#### Description:

The account structure describes basic information for an account.

#### JSON structure by example:

```json
{
       "address": "TALICELCD3XPH4FFI5STGGNSNSWPOTG5E4DS2TOS",
       "balance": 124446551689680,
       "vestedBalance": 1041345514976241,
       "importance": 0.010263666447108395,
       "publicKey": "a11a1a6c17a24252e674d151713cdf51991ad101751e4af02a20c61b59f1fe1a",
       "label": null,
       "harvestedBlocks": 645,
       "multisigInfo": {}
}
```


#### Description of the fields:

#### Description of the fields:


|address        |The address of the account.                                |
|---------------|-----------------------------------------------------------|
|balance        |The balance of the account in micro NEM.                   |
|vestedBalance  |The vested part of the balance of the account in micro NEM.|
|importance     |The importance of the account.                             |
|publicKey      |The public key of the account.                             |
|label          |The label of the account (not used, always null).          |
|harvestedBlocks|The number blocks that the account already harvested.      |


#### Description:

The account meta data describes additional information for the account. See [Account related requests](#account-related-requests) for details.

#### JSON structure by example:

```json
{
       "status": "LOCKED",
       "remoteStatus": "ACTIVE",
        "cosignatoryOf" : [
            <AccountInfo>,
            <AccountInfo>
        ],
        "cosignatories" : [
            <AccountInfo>,
            <AccountInfo>
        ]
}
```


#### Description of the fields:



* status: remoteStatus
  * The harvesting status of a queried account.The harvesting status can be one of the following values:"UNKNOWN":  The harvesting status of the account is not known."LOCKED":  The account is not harvesting."UNLOCKED":  The account is harvesting.: The status of remote harvesting of a queried account.The remote harvesting status can be one of the following values:"REMOTE":  The account is a remote account and therefore remoteStatus is not applicable for it."ACTIVATING":  The account has activated remote harvesting but it is not yet active."ACTIVE":  The account has activated remote harvesting and remote harvesting is active."DEACTIVATING":  The account has deactivated remote harvesting but remote harvesting is still active."INACTIVE":  The account has inactive remote harvesting, or it has deactivated remote harvesting and deactivation is operational.
* status: cosignatoryOf
  * The harvesting status of a queried account.The harvesting status can be one of the following values:"UNKNOWN":  The harvesting status of the account is not known."LOCKED":  The account is not harvesting."UNLOCKED":  The account is harvesting.: JSON array of AccountInfo structures. The account is cosignatory for each of the accounts in the array.
* status: cosignatories
  * The harvesting status of a queried account.The harvesting status can be one of the following values:"UNKNOWN":  The harvesting status of the account is not known."LOCKED":  The account is not harvesting."UNLOCKED":  The account is harvesting.: JSON array of AccountInfo structures. The array holds all accounts that are a cosignatory for this account.


#### Description:

The account meta data pair includes durable information for an account and additional information about its state.

#### JSON structure by example:

```json
{
    "account":
        <AccountInfo>,
    "meta":
        <AccountMetaData>
}
```


#### Description of the fields:


|account          |Contains the account object.                                 |
|-----------------|-------------------------------------------------------------|
|<AccountInfo>    |The account object as described in AccountInfo.              |
|meta             |Contains the account meta data object.                       |
|<AccountMetaData>|The account meta data object as described in AccountMetaData.|


AccountPrivateKeyTransactionsPage
---------------------------------

#### Description:

The account private key transactions page contains data that NIS needs to retrieve a set of transactions from the database. The data includes the private key of the account for which transactions are retrieved. Use requests that use this structure only when NIS is running locally.

The fields "hash" and "id" are optional.

#### JSON structure by example:

```json
{
    "value": "68e4f79f886927de698df4f857de2aada41ccca6617e56bb0d61623b35b08cc0",
    "hash": "44e4968e5aa35fe182d4def5958e23cf941c4bf809364afb4431ebbf6a18c039",
    "id": "12345"
}
```


#### Description of the fields:


|value|The private key as hexadecimal string.|
|-----|--------------------------------------|
|hash |The optional hash value.              |
|id   |The optional transaction id.          |


#### Description:

The application meta data object supplies additional information about the application running on a node.

#### JSON structure by example:

```json
{
       "currentTime": 9189086,
       "application": "NEM Infrastructure Server",
       "startTime": 9060202,
       "version": "0.4.30-BETA",
       "signer": "CN=NEM Community,OU=Development Team,O=NEM,L=Internet,ST=web,C=WD"
}
```


#### Description of the fields:



* currentTime: application
  * The current network time, i.e. the number of seconds that have elapsed since the creation of the nemesis block.: The name of the application running on the node.
* currentTime: startTime
  * The current network time, i.e. the number of seconds that have elapsed since the creation of the nemesis block.: The network time when the application was started.
* currentTime: version
  * The current network time, i.e. the number of seconds that have elapsed since the creation of the nemesis block.: The application version.
* currentTime: signer
  * The current network time, i.e. the number of seconds that have elapsed since the creation of the nemesis block.: The signer of the certificate used by the application.


AuditCollection
---------------

#### Description:

An audit collection consists of two arrays, containing information about incoming requests from other nodes. The first array contains information about outstanding (i.e. not yet processed requests) and the second array contains information about the most recent requests. The audit collection is for debug purposes.

#### JSON structure by example:

```json
{
       "outstanding": [{
              "path": "/chain/score",
              "start-time": 9020618,
              "host": "86.124.91.183",
              "elapsed-time": 5,
              "id": 797725
       }],
       "most-recent": [{
              "path": "/push/transaction",
              "start-time": 9020621,
              "host": "hachi.nem.ninja",
              "elapsed-time": 2,
              id": 797750
       }]
}
```


#### Description of the fields:


|path        |The relative URL path.                                                |
|------------|----------------------------------------------------------------------|
|start-time  |The number of seconds elapsed since the creation of the nemesis block.|
|host        |The host which initiated the request.                                 |
|elapsed-time|The time in seconds that has elapsed since the request was received.  |
|id          |The unique id of the request.                                         |


Block
-----

#### Description:

A block is the structure that contains the transaction information. A block can contain up to 120 transactions. Blocks are generated and signed by accounts and are the instrument by which information is spread in the network.

#### JSON structure by example (main network):

```json
{
       "timeStamp": 9022656,
       "signature": "256ebcfa4f92e2881963359c51095a390b9f4d1b3fee75ae19f96d5e6bcf055abbcaae3e55bcc17e6214924e4e6a9ebbe77357236b1a235e944950b851bda804",
       "prevBlockHash":
       {
              "data": "0a3d6bea020bb1a503364c37d57392342f368389bb23b05799c54d536d94749b"
       },
       "type": 1,
       "transactions": [
              Transaction1, Transaction2, …, Transaction11
       ],
       "version": 1744830465,
       "signer": "6c66ea288522990db7a0a63c9c20f532cdcb68dc3c9544fb20f7322c92ceadbb",
       "height": 39324
}
```


#### Description of the fields:



* timeStamp: Signature
  * The number of seconds elapsed since the creation of the nemesis block.: The signature of the block. The signature was generated by the            signer and can be used to validate that the block data was not modified by a            node.
* timeStamp: prevBlockHash
  * The number of seconds elapsed since the creation of the nemesis block.: The sha3-256 hash of the last block as hex-string.
* timeStamp: type
  * The number of seconds elapsed since the creation of the nemesis block.: The block type. There are currently two block types used:            -1:  Only the nemesis block has this type.1:  Regular block type.
* timeStamp: transactions
  * The number of seconds elapsed since the creation of the nemesis block.: The array of transaction structures. See            Appendix A: Transaction            for more details about this structure.
* timeStamp: version
  * The number of seconds elapsed since the creation of the nemesis block.: The block version. The following versions are supported.            0x68 << 24 + 1 (1744830465 as 4 byte integer): the main network version0x60 << 24 + 1 (1610612737 as 4 byte integer): the mijin network version0x98 << 24 + 1 (-1744830463 as 4 byte integer): the test network version
* timeStamp: signer
  * The number of seconds elapsed since the creation of the nemesis block.: The public key of the harvester of the block as hexadecimal number.
* timeStamp: height
  * The number of seconds elapsed since the creation of the nemesis block.: The height of the block. Each block has a unique height.            Subsequent blocks differ in height by 1.


BlockChainScore
---------------

#### Description:

The block chain score is a measure how good the block chain is. The higher the score, the better the block chain is.

#### JSON structure by example:

```json
{
       "score": "17a3077c927d9a7e"
}
```


#### Description of the fields:



BlockHeight
-----------

#### Description:

The block height describes the position of the block within the block chain. The first block of the chain has height one. Each subsequent block has a height which is one higher than the previous block.

#### JSON structure by example:

```json
{
       "height": 2649
}
```


#### Description of the fields:



BootNodeRequest
---------------

#### Description:

The BootNodeRequest JSNON object is used to transfer the relevant data for booting a local node to NIS. With the boot data NIS can create the local node object and connect to the network.

#### JSON structure by example:

```json
{
       "metaData":
       {
              "application":"NIS"
       },
       "endpoint":
       {
              "protocol":"http",
              "port":7890,
              "host":"localhost"
       },
       "identity":
       {
              "private-key":"a6cbd01d04edecfaef51df9486c111abb6299c764a00206eb1d01f4587491b3f",
              "name":"Alice"
       }
}
```


#### Description of the fields:

|metaData   |Denotes the beginning of the metaData substructure.  |
|-----------|-----------------------------------------------------|
|application|The application name.                                |
|endpoint   |Denotes the beginning of the endpoint substructure.  |
|protocol   |The protocol to use (only HTTP supported as for now).|
|port       |The port to use.                                     |
|host       |The IP address to use.                               |
|identity   |Denotes the fof the identity substructure.           |
|private-key|The private key used for creating the identity.      |
|name       |The name of the node (can be anything).              |


CommunicationTimeStamps
-----------------------

#### Description:

Communication timestamps contain information about the network time of a remote NIS. NEM uses a time synchronization mechanism to synchronize time across the network. Each node maintains a network time which is the time of the computer clock plus an offset which compensates for the deviation from the computer clocks of other nodes.

#### JSON structure by example:

```json
{
       "sendTimeStamp": 9145477789,
       "receiveTimeStamp": 9145477789
}
```


#### Description of the fields:


|sendTimeStamp   |The network time at the moment the reply was sent.      |
|----------------|--------------------------------------------------------|
|receiveTimeStamp|The network time at the moment the request was received.|


ExplorerBlockViewModel
----------------------

#### Description:

The following structure is used by the NEM block chain explorer for convenience reason. The data is similar but not identical to that of a [Block](#block).

#### JSON structure by example:

```json
{
        "data":[
            {
                "txes":[
                    <ExplorerTransferViewModel>,
                    &vellip;
                    <ExplorerTransferViewModel>
                ],
                "block": <Block> ,
                "hash":"a6f62c62eedf4fafe6991e5cf31eae440963577c919f4eae86b4db8f8e572dce",
                "difficulty": 23456345897
            },
            …
        ]
}
```


#### Description of the fields:



* txes: <ExplorerTransferViewModel>
  * Array containing the transactions of the block.: The ExplorerBlockViewModel object as described in ExplorerTransferViewModel
* txes: block
  * Array containing the transactions of the block.: Entry containing a JSON block object.
* txes: <Block>
  * Array containing the transactions of the block.: The Block object as described in            Appendix A: Block
* txes: hash
  * Array containing the transactions of the block.: The hash of the block as hexadecimal string.
* txes: difficulty
  * Array containing the transactions of the block.: The block difficulty.


ExplorerTransferViewModel
-------------------------

#### Description:

The following structure is used by the NEM block chain explorer for convenience reason. The data is similar but not identical to that of a [Transaction](#transaction) structure.

#### JSON structure by example:

```json
{
       "tx": <Transaction>,
       "hash": "5cba4614e52af19417fb53c4bdf442a57b9f558aee17ece530a5220da55cf47d",
       "innerHash": "ae3b107f1216e1ccf12b6f3c3c555bc1d95311747338ce66f539ea2c18c0aa57"
}
```


#### Description of the fields:



* tx: <Transaction>
  * Entry containing the JSON Transaction object.: The Transaction object. Depending on the type of the transaction the structure will look different. See            Appendix A: Transaction objects            for the different transaction types.
* tx: hash
  * Entry containing the JSON Transaction object.: The hash of the transaction.
* tx: innerHash
  * Entry containing the JSON Transaction object.: The hash of the inner transaction. This entry is only available for multisig transactions


ExtendedNodeExperiencePair
--------------------------

#### Description:

When exchanging data with other nodes the result of the communication is divided into three different outcomes: success, neutral and failure. In the cases of success and failure the result is saved to be able to judge the quality of a node. This has influence on the probability that a certain node is selected as partner.

#### JSON structure by example:

```json
{
       "node":
       {
              <Node>
       },
       "syncs": 822,
       "experience":
       {
              "s": 357,
              "f": 0
       }
}
```


#### Description of the fields:


|node      |Denotes the beginning of the of the Node substructure.                   |
|----------|-------------------------------------------------------------------------|
|<Node>    |The remote Node object as described in Node.                             |
|syncs     |The number of synchronization attempts the node had with the remote node.|
|experience|Denotes the beginning of the of the NodeExperience substructure.         |
|s         |The number of successful communications with the remote node.            |
|f         |The number of failed communications with the remote node.                |


HarvestInfo
-----------

#### Description:

A HarvestInfo object contains information about a block that an account harvested.

#### JSON structure by example:

```json
{
       "timeStamp": 8963798,
       "id": 254378,
       "difficulty": 46534789865332,
       "totalFee": 2041299054,
       "height": 38453
}
```


#### Description of the fields:



* timeStamp: id
  * The number of seconds elapsed since the creation of the nemesis block.: The database id for the harvested block.
* timeStamp: difficulty
  * The number of seconds elapsed since the creation of the nemesis block.: The block difficulty. The initial difficulty was set to 100000000000000. The block difficulty is always between one tenth and ten            times the initial difficulty.
* timeStamp: totalFee
  * The number of seconds elapsed since the creation of the nemesis block.: The total fee collected by harvesting the block.
* timeStamp: height
  * The number of seconds elapsed since the creation of the nemesis block.: The height of the harvested block.


KeyPairViewModel
----------------

#### Description:

A KeyPairViewModel object contains information about a new account. Information includes the private key, the public key and the address

#### JSON structure by example:

```json
{
    "privateKey": "0962c6505d02123c40e858ff8ef21e2b7b5466be12c4770e3bf557aae828390f",
    "publicKey": "c2e19751291d01140e62ece9ee3923120766c6302e1099b04014fe1009bc89d3",
    "address": "NCKMNCU3STBWBR7E3XD2LR7WSIXF5IVJIDBHBZQT"
}
```


#### Description of the fields:


|privateKey|The private key of the account as hexadeciaml string.|
|----------|-----------------------------------------------------|
|publicKey |The public key of the account as hexadeciaml string. |
|address   |The address of the account.                          |


Transaction objects
-------------------

### ImportanceTransferTransaction

#### Description:

NIS has the ability to transfer the importance of one account to another account for harvesting. The account receiving the importance is called the remote account. Importance transfer transactions are part of the secure harvesting feature of NEM. Once an importance transaction has been included in a block it needs 6 hours to become active.

#### JSON structure by example (main network):

```json
{
    "timeStamp": 9111526,
    "signature": "651a19ccd09c1e0f8b25f6a0aac5825b0a20f158ca4e0d78f2abd904a3966b6e3599a47b9ff199a3a6e1152231116fa4639fec684a56909c22cbf6db66613901",
    "fee": 150000,
    "mode": 1,
    "remoteAccount": "cc6c9485d15b992501e57fe3799487e99de272f79c5442de94eeb998b45e0144",
    "type": 2049,
    "deadline": 9154726,
    "version": 1744830465,
    "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
}
```


#### Description of the fields:



* timeStamp: signature
  * The number of seconds elapsed since the creation of            the nemesis block.        : The transaction signature (missing if part of a multisig            transaction).
* timeStamp: fee
  * The number of seconds elapsed since the creation of            the nemesis block.        : The fee for the transaction. The higher the fee, the higher the            priority of the transaction. Transactions with high priority get included in            a block before transactions with lower priority.
* timeStamp: mode
  * The number of seconds elapsed since the creation of            the nemesis block.        :             The mode. Possible values are:            1:  Activate remote harvesting.2:  Deactivate remote harvesting.
* timeStamp: remoteAccount
  * The number of seconds elapsed since the creation of            the nemesis block.        : The public key of the receiving account as            hexadecimal string.
* timeStamp: type
  * The number of seconds elapsed since the creation of            the nemesis block.        : The transaction type.
* timeStamp: deadline
  * The number of seconds elapsed since the creation of            the nemesis block.        : The deadline of the transaction. The deadline is given as            the number of seconds elapsed since the creation of the nemesis block.            If a transaction does not get included in a block before the deadline is            reached, it is deleted.
* timeStamp: version
  * The number of seconds elapsed since the creation of            the nemesis block.        : The version of the structure.
* timeStamp: signer
  * The number of seconds elapsed since the creation of            the nemesis block.        : The public key of the account that created the transaction.


### MosaicDefinitionCreationTransaction

#### Description:

Before a mosaic can be created or transferred, a corresponding definition of the mosaic has to be created and published to the network. This is done via a mosaic definition creation transaction.

#### JSON structure by example (test network):

```json
{
        "timeStamp": 9111526,
        "signature": "651a19ccd09c1e0f8b25f6a0aac5825b0a20f158ca4e0d78f2abd904a3966b6e3599a47b9ff199a3a6e1152231116fa4639fec684a56909c22cbf6db66613901",
        "fee": 150000,
        "type": 16385,
        "deadline": 9154726,
        "version": -1744830463,
        "signer": "cbda3edb771d42801a5c6ce0725f9374efade19a8933d6ac22ccfa50c777d0f9",
        "creationFee": 10000000,
        "creationFeeSink": "53e140b5947f104cabc2d6fe8baedbc30ef9a0609c717d9613de593ec2a266d3",
        "mosaicDefinition": {
            "creator": "cbda3edb771d42801a5c6ce0725f9374efade19a8933d6ac22ccfa50c777d0f9",
            "description": "precious vouchers",
            "id": {
                "namespaceId": "alice.vouchers",
                "name": "Alice's gift vouchers"
            },
            "properties": [{
                    "name": "divisibility",
                    "value": "3"
                },{
                    "name": "initialSupply",
                    "value": "1000"
                },{
                    "name": "supplyMutable",
                    "value": "false"
                },{
                    "name": "transferable",
                    "value": "true"
                }
            ],
            "levy": {
                "type": 1,
                "recipient": "TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH",
                "mosaicId": {
                    "namespaceId": "nem",
                    "name": "xem"
                },
                "fee": 1000
            }
        }
}
```


#### Description of the fields:



* timeStamp: signature
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction signature (missing if part of a multisig transaction).
* timeStamp: fee
  * The number of seconds elapsed since the creation of the nemesis block.: The fee for the transaction. The higher the fee, the higher the            priority of the transaction. Transactions with high priority get included in            a block before transactions with lower priority.
* timeStamp: type
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction type.
* timeStamp: deadline
  * The number of seconds elapsed since the creation of the nemesis block.: The deadline of the transaction. The deadline is given as            the number of seconds elapsed since the creation of the nemesis block.            If a transaction does not get included in a block before the deadline is            reached, it is deleted.
* timeStamp: version
  * The number of seconds elapsed since the creation of the nemesis block.: The version of the structure.
* timeStamp: signer
  * The number of seconds elapsed since the creation of the nemesis block.: The public key of the account that created the transaction.
* timeStamp: creationFee
  * The number of seconds elapsed since the creation of the nemesis block.: The fee for the creation of the mosaic.
* timeStamp: creationFeeSink
  * The number of seconds elapsed since the creation of the nemesis block.: The public key of the account to which the creation fee is tranferred.
* timeStamp: mosaicDefinition
  * The number of seconds elapsed since the creation of the nemesis block.: The actual mosaic definition. See MosaicDefinition for details.


### MosaicSupplyChangeTransaction

#### Description:

In case a mosaic definition has the property 'supplyMutable' set to true, the creator of the mosaic definition can change the supply, i.e. increase or decrease the supply.

#### JSON structure by example (test network):

```json
{
        "timeStamp": 9111526,
        "signature": "651a19ccd09c1e0f8b25f6a0aac5825b0a20f158ca4e0d78f2abd904a3966b6e3599a47b9ff199a3a6e1152231116fa4639fec684a56909c22cbf6db66613901",
        "fee": 150000,
        "type": 16386,
        "deadline": 9154726,
        "version": -1744830463,
        "signer": "d99e88c90da71a4b0d848454e59e296c9ef7a8f018f3eaa3a198dc460b6621a4",
        "supplyType": 1,
        "delta": 123,
        "mosaicId": {
            "namespaceId": "alice.vouchers",
            "name": "gift vouchers"
        }
}
```


#### Description of the fields:



* timeStamp: signature
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction signature (missing if part of a multisig transaction).
* timeStamp: fee
  * The number of seconds elapsed since the creation of the nemesis block.: The fee for the transaction. The higher the fee, the higher the            priority of the transaction. Transactions with high priority get included in            a block before transactions with lower priority.
* timeStamp: type
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction type.
* timeStamp: deadline
  * The number of seconds elapsed since the creation of the nemesis block.: The deadline of the transaction. The deadline is given as            the number of seconds elapsed since the creation of the nemesis block.            If a transaction does not get included in a block before the deadline is            reached, it is deleted.
* timeStamp: version
  * The number of seconds elapsed since the creation of the nemesis block.: The version of the structure.
* timeStamp: signer
  * The number of seconds elapsed since the creation of the nemesis block.: The public key of the account that created the transaction.
* timeStamp: supplyType
  * The number of seconds elapsed since the creation of the nemesis block.: The supply type. Supported supply types are:            1: Increase in supply.2: Decrease in supply.
* timeStamp: delta
  * The number of seconds elapsed since the creation of the nemesis block.: The supply change in units for the mosaic.
* timeStamp: mosaicId
  * The number of seconds elapsed since the creation of the nemesis block.: The mosaic id. See MosaicId for details.


### MultisigAggregateModificationTransaction

#### Description:

Multisig aggregate modification transactions are part of the NEM's multisig account system. A multisig aggregate modification transaction holds an array of multisig cosignatory modifications and a single multisig minimum cosignatories modification inside the transaction. A multisig aggregate modification transaction can be wrapped by a multisig transaction. Aggregate modification transactions that use the minCosignatories field need to have version 0x68000002 (decimal 1744830466) for mainnet, 0x98000002 (decimal -1744830462) for testnet and 0x60000002 (decimal 1610612738) for mijin network.

#### JSON structure by example (main network):

```json
{
    "timeStamp": 9111526,
    "signature": "651a19ccd09c1e0f8b25f6a0aac5825b0a20f158ca4e0d78f2abd904a3966b6e3599a47b9ff199a3a6e1152231116fa4639fec684a56909c22cbf6db66613901",
    "fee": 500000,
    "type": 257,
    "deadline": 9154726,
    "version": 1744830466,
    "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a",
    "modifications": [
        <MultisigCosignatoryModification>,
        <MultisigCosignatoryModification>
    ],
    "minCosignatories" : {
        "relativeChange" : 2
    }
}
```


#### Description of the fields:



* timeStamp: signature
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction signature (missing if part of a multisig transaction).
* timeStamp: fee
  * The number of seconds elapsed since the creation of the nemesis block.: The fee for the transaction. The higher the fee, the higher the priority of the transaction. Transactions with high priority get included            in a block before transactions with lower priority.
* timeStamp: type
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction type.
* timeStamp: deadline
  * The number of seconds elapsed since the creation of the nemesis block.: The deadline of the transaction. The deadline is given as the number of seconds elapsed since the creation of the nemesis block. If a            transaction does not get included in a block before the deadline is reached, it is deleted.
* timeStamp: version
  * The number of seconds elapsed since the creation of the nemesis block.: The version of the structure.
* timeStamp: signer
  * The number of seconds elapsed since the creation of the nemesis block.: The public key of the account that created the transaction.
* timeStamp: modifications
  * The number of seconds elapsed since the creation of the nemesis block.: The JSON array of multisig modifications.
* timeStamp: minCosignatories
  * The number of seconds elapsed since the creation of the nemesis block.: JSON object that holds the minimum cosignatories modification.
* timeStamp: relativeChange
  * The number of seconds elapsed since the creation of the nemesis block.: Value indicating the relative change of the minimum cosignatories.


### MultisigCosignatoryModification

#### Description:

Multisig cosignatory modifications are part of the NEM's multisig account system. With a multisig cosignatory modification a cosignatory is added to or deleted from a multisig account. Multisig cosignatory modifications are part of a multisig aggregate modification transactions, see details there.

#### JSON structure by example:

```json
{
    "modificationType": 1,
    "cosignatoryAccount": "213150649f51d6e9113316cbec5bf752ef7968c1e823a28f19821e91daf848be"
}
```


#### Description of the fields:



* modificationType: cosignatoryAccount
  * The type of modification. Possible values are:            1:  Add a new cosignatory.2:  Delete an existing cosignatory.: The public key of the cosignatory account as hexadecimal string


### MultisigSignatureTransaction

#### Description:

Multisig signature transactions are part of the NEM's multisig account system. Multisig signature transactions are included in the corresponding multisig transaction and are the way a cosignatory of a multisig account can sign a multisig transaction for that account.

#### JSON structure by example (test network):

```json
{
    "timeStamp": 9111526,
    "signature": "651a19ccd09c1e0f8b25f6a0aac5825b0a20f158ca4e0d78f2abd904a3966b6e3599a47b9ff199a3a6e1152231116fa4639fec684a56909c22cbf6db66613901",
    "fee": 150000,
    "type": 257,
    "deadline": 9154726,
    "version": -1744830463,
    "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a",
    "otherHash": {
        "data": "44e4968e5aa35fe182d4def5958e23cf941c4bf809364afb4431ebbf6a18c039"
    },
    "otherAccount": "TDGIMREMR5NSRFUOMPI5OOHLDATCABNPC5ID2SVA"
}
```


#### Description of the fields:



* timeStamp: signature
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction signature.
* timeStamp: fee
  * The number of seconds elapsed since the creation of the nemesis block.: The fee for the transaction.
* timeStamp: type
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction type.
* timeStamp: deadline
  * The number of seconds elapsed since the creation of the nemesis block.: The deadline of the transaction. The deadline is given as the number of seconds elapsed since the creation of the nemesis block. If a            transaction does not get included in a block before the deadline is reached, it is deleted.
* timeStamp: version
  * The number of seconds elapsed since the creation of the nemesis block.: The version of the structure.
* timeStamp: signer
  * The number of seconds elapsed since the creation of the nemesis block.: The public key of the account that created the transaction.
* timeStamp: otherHash
  * The number of seconds elapsed since the creation of the nemesis block.: The hash of the inner transaction of the corresponding multisig transaction.
* timeStamp: otherAccount
  * The number of seconds elapsed since the creation of the nemesis block.: The address of the corresponding multisig account.


### MultisigTransaction

#### Description:

Multisig transaction are the only way to make transaction from a multisig account to another account. A multisig transaction carries another transaction inside (often referred to as "inner" transaction). The inner transaction can be a transfer, an importance transfer or an aggregate modification transaction. A multisig transaction also has multisig signature transactions from the cosignatories of the multisig account inside.

#### JSON structure by example (test network):

```json
{
    "timeStamp": 9111526,
    "signature": "651a19ccd09c1e0f8b25f6a0aac5825b0a20f158ca4e0d78f2abd904a3966b6e3599a47b9ff199a3a6e1152231116fa4639fec684a56909c22cbf6db66613901",
    "fee": 150000,
    "type": 257,
    "deadline": 9154726,
    "version": -1744830463,
    "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a",
    "otherTrans": <inner transaction>,
    "signatures":[
        <MultisigSignatureTransaction>,
        <MultisigSignatureTransaction>
    ]
}
```


#### Description of the fields:



* timeStamp: signature
  *  The number of seconds elapsed since the creation of the nemesis block.:  The transaction signature.
* timeStamp: fee
  *  The number of seconds elapsed since the creation of the nemesis block.:  The fee for the transaction.
* timeStamp: type
  *  The number of seconds elapsed since the creation of the nemesis block.:  The transaction type.
* timeStamp: deadline
  *  The number of seconds elapsed since the creation of the nemesis block.:  The deadline of the transaction. The deadline is given as the number of seconds elapsed since the creation of the nemesis block. If            a transaction does not get included in a block before the deadline is reached, it is deleted.
* timeStamp: version
  *  The number of seconds elapsed since the creation of the nemesis block.:  The version of the structure.
* timeStamp: signer
  *  The number of seconds elapsed since the creation of the nemesis block.:  The public key of the account that created the transaction.
* timeStamp: otherTrans
  *  The number of seconds elapsed since the creation of the nemesis block.:  The inner transaction. The inner transaction can be a transfer transaction, an importance transfer transaction or a multisig            aggregate modification transaction. The inner transaction does not have a valid signature.
* timeStamp: signatures
  *  The number of seconds elapsed since the creation of the nemesis block.:  The JSON array of MulsigSignatureTransaction objects.


### ProvisionNamespaceTransaction

#### Description:

Accounts can rent a namespace for one year and after a year renew the contract. This is done via a ProvisionNamespaceTransaction.

#### JSON structure by example (test network):

```json
{
        "timeStamp": 9111526,
        "signature": "651a19ccd09c1e0f8b25f6a0aac5825b0a20f158ca4e0d78f2abd904a3966b6e3599a47b9ff199a3a6e1152231116fa4639fec684a56909c22cbf6db66613901",
        "fee": 150000,
        "type": 8193,
        "deadline": 9154726,
        "version": -1744830463,
        "signer": "d99e88c90da71a4b0d848454e59e296c9ef7a8f018f3eaa3a198dc460b6621a4",
        "rentalFeeSink": "3e82e1c1e4a75adaa3cba8c101c3cd31d9817a2eb966eb3b511fb2ed45b8e262",
        "rentalFee": 10000000,
        "newPart": "voucher",
        "parent": "alice"
}
```


#### Description of the fields:



* timeStamp: signature
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction signature (missing if part of a multisig transaction).
* timeStamp: fee
  * The number of seconds elapsed since the creation of the nemesis block.: The fee for the transaction. The higher the fee, the higher the            priority of the transaction. Transactions with high priority get included in            a block before transactions with lower priority.
* timeStamp: type
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction type.
* timeStamp: deadline
  * The number of seconds elapsed since the creation of the nemesis block.: The deadline of the transaction. The deadline is given as            the number of seconds elapsed since the creation of the nemesis block.            If a transaction does not get included in a block before the deadline is            reached, it is deleted.
* timeStamp: version
  * The number of seconds elapsed since the creation of the nemesis block.: The version of the structure.
* timeStamp: signer
  * The number of seconds elapsed since the creation of the nemesis block.: The public key of the account that created the transaction.
* timeStamp: rentalFeeSink
  * The number of seconds elapsed since the creation of the nemesis block.: The public key of the account to which the rental fee is transferred.
* timeStamp: rentalFee
  * The number of seconds elapsed since the creation of the nemesis block.: The fee for renting the namespace.
* timeStamp: newPart
  * The number of seconds elapsed since the creation of the nemesis block.: The new part which is concatenated to the parent with a '.' as separator.
* timeStamp: parent
  * The number of seconds elapsed since the creation of the nemesis block.: The parent namespace. This can be null if the transaction rents a root namespace.


### TransferTransaction

#### Description:

Transfer transactions contain data about transfers of XEM or mosaics to another account. There are two version of transfer transactions, version 1 and version 2. Version 1 transfer transaction are only capable of transferring XEM and a message while version 2 transfer transactions additionally can transfer a set of mosaics.

#### JSON structure by example (v1 transfer transaction, test network):

```json
{
        "timeStamp": 9111526,
        "amount": 1000000000,
        "signature": "651a19ccd09c1e0f8b25f6a0aac5825b0a20f158ca4e0d78f2abd904a3966b6e3599a47b9ff199a3a6e1152231116fa4639fec684a56909c22cbf6db66613901",
        "fee": 50000,
        "recipient": "TDGIMREMR5NSRFUOMPI5OOHLDATCABNPC5ID2SVA",
        "type": 257,
        "deadline": 9154726,
        "message":
        {
        "payload": "74657374207472616e73616374696f6e",
        "type": 1
        },
        "version": -1744830463,
        "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
}
```


#### JSON structure by example (v2 transfer transaction, test network):

```json
{
        "timeStamp": 9111526,
        "amount": 123000000,
        "signature": "fad7ea2b5df5f7846f45fd9983a75ad8d333af3660f4f0d355864420f4482605d675e89d97177385338b226097342b4222add52c5397423f9eaf6b01fe3ef70c",
        "fee": 100000,
        "recipient": "TBEH27FNRS43FNH3PXE4XN3H7HXA37H77APSZW46",
        "type": 257,
        "deadline": 9154726,
        "message":
        {
            "payload": "74657374207472616e73616374696f6e",
            "type": 1
        },
        "version": -1744830462,
        "signer": "cb4ef3709d25ccd0c022b2d53e4ce31478ebc4bf177b1b54482afb8e55692521",
        "mosaics":[{
            "mosaicId":{
                "namespaceId": "id0",
                "name": "name0"
            },
            "quantity": 10
        },{
            "mosaicId":{
                "namespaceId": "id1",
                "name": "name1"
            },
            "quantity": 11
        }]
}
```


#### Description of the fields:



* timeStamp: amount
  * The number of seconds elapsed since the creation of the nemesis block.: The amount of micro NEM that is transferred from sender to recipient.
* timeStamp: signature
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction signature.
* timeStamp: fee
  * The number of seconds elapsed since the creation of the nemesis block.: The fee for the transaction. The higher the fee, the higher the            priority of the transaction. Transactions with high priority get included in            a block before transactions with lower priority.
* timeStamp: recipient
  * The number of seconds elapsed since the creation of the nemesis block.: The address of the recipient.
* timeStamp: type
  * The number of seconds elapsed since the creation of the nemesis block.: The transaction type.
* timeStamp: deadline
  * The number of seconds elapsed since the creation of the nemesis block.: The deadline of the transaction. The deadline is given as the            number of seconds elapsed since the creation of the nemesis block. If a            transaction does not get included in a block before the deadline is reached, it            is deleted.
* timeStamp: message
  * The number of seconds elapsed since the creation of the nemesis block.: Optionally a transaction can contain a message. In this case the            transaction contains a message substructure. If not the field is null.
* timeStamp: payload
  * The number of seconds elapsed since the creation of the nemesis block.:             Optional field in case the transaction contains a message. The            payload is the actual (possibly encrypted) message data.
* timeStamp: type
  * The number of seconds elapsed since the creation of the nemesis block.:             Optional field in case the transaction contains a message. The            field holds the message type information. Possible message types are:            1:  The message is not encrypted.2:  The message is encrypted.
* timeStamp: version
  * The number of seconds elapsed since the creation of the nemesis block.: The version of the structure.
* timeStamp: signer
  * The number of seconds elapsed since the creation of the nemesis block.: The public key of the account that created the transaction.
* timeStamp: mosaics
  * The number of seconds elapsed since the creation of the nemesis block.: The array of Mosaic objects.


Mosaic
------

#### Description:

A mosaic describes an instance of a mosaic definition. Mosaics can be transferred by means of a transfer transaction.

#### JSON structure by example:

```json
{
        "mosaicId": {
            "namespaceId": "alice.drinks",
            "name": "orange juice"
        },
        "quantity": 123000
}
```


#### Description of the fields:



* mosaicId: quantity
  * The mosaic id. See MosaicId: The mosaic quantity. The quantity is always given in smallest units for the mosaic,            i.e. if it has a divisibility of 3 the quantity is given in millis.


MosaicDefinition
----------------

#### Description:

A mosaic definition describes an asset class. Some fields are mandatory while others are optional. The properties of a mosaic definition always have a default value and only need to be supplied if they differ from the default value.

#### JSON structure by example:

```json
{
        "creator": "10cfe522fe23c015b8ab24ef6a0c32c5de78eb55b2152ed07b6a092121187100",
        "id": {
            "namespaceId": "alice.drinks",
            "name": "orange juice"
        },
        "description": "A healthy drink with lots of vitamins",
        "properties": [{
            "name": "divisibility",
            "value": "3"
        },{
            "name": "initialSupply",
            "value": "1000"
        },{
            "name": "supplyMutable",
            "value": "false"
        },{
            "name": "transferable",
            "value": "true"
        }],
        "levy": {
            "type": 1,
            "recipient": "TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH",
            "mosaicId": {
                "namespaceId": "alice.drinks",
                "name": "orange juice"
            },
            "fee": 1000
        }
}
```


#### Description of the fields:



* creator: id
  * The public key of the mosaic definition creator.: The mosaic id. See MosaicId.
* creator: description
  * The public key of the mosaic definition creator.: The mosaic description. The description may have a length of up to 512 characters and cannot be empty.
* creator: properties
  * The public key of the mosaic definition creator.: The mosaic properties.            The properties may be an empty array in which case default values for all properties are applied.            See MosaicProperties for further details.
* creator: levy
  * The public key of the mosaic definition creator.: The optional levy for the mosaic. A creator can demand that each mosaic transfer induces an additional fee.            See MosaicLevy for further details.


#### Description:

A mosaic definition consists of a database id and a mosaic definition object. The id is needed for requests that support paging.

#### JSON structure by example:

```json
{
        "meta" {
            "id": 3541
        }
        "mosaic": {
            "creator": "10cfe522fe23c015b8ab24ef6a0c32c5de78eb55b2152ed07b6a092121187100",
            "id": {
                "namespaceId": "alice.drinks",
                "name": "orange juice"
            },
            "description": "A healthy drink with lots of vitamins",
            "properties": [
            ]
        }
}
```


#### Description of the fields:



* meta: id
  * The label for the meta data object.: The id for the mosaic definition object.
* meta: mosaic
  * The label for the meta data object.: The label for the mosaic definition object. See MosaicDefinition for a detailed            description of the object.
* meta: creator
  * The label for the meta data object.: The public key of the mosaic definition creator.
* meta: id
  * The label for the meta data object.: The mosaic id. See MosaicId.
* meta: description
  * The label for the meta data object.: The mosaic description. The description may have a length of up to 512 characters and cannot be empty.
* meta: properties
  * The label for the meta data object.: The mosaic properties.


MosaicProperties
----------------

#### Description:

Each mosaic definition comes with a set of properties. Each property has a default value which will be applied in case it was not specified. Future release may add additional properties to the set of available properties. The available properties and their default values are:

*   **divisibility:** defines the smallest sub-unit that a mosaic can be divided into. A divisibility of 0 means that only entire units can be transferred while a divisibility of 3 means the mosaic can be transferred in milli-units.
*   **initialSupply:** defines how many units of the mosaic are initially created. These mosaics are credited to the creator of the mosaic. The initial supply has an upper limit of 9,000,000,000 units.
*   **supplyMutable:** determines whether or not the supply can be changed by the creator at a later point using a [MosaicSupplyChangeTransaction](#mosaicSupplyChangeTransaction). Possible values are "true" and "false", the former meaning the supply can be changed and the latter that the supply is fixed for all times.
*   **transferable:** determines whether or not the a mosaic can be transferred to a user other than the creator. In certain scenarios it is not wanted that user are able to trade the mosaic (for example when the mosaic represents bonus points which the company does not want to be tranferable to other users). Possible values are "true" and "false", the former meaning the mosaic can be arbitrarily transferred among users and the latter meaning the mosaic can only be transferred to and from the creator.

#### JSON structure by example:

```json
[{
        "name": "divisibility",
        "value": "3"
        },{
        "name": "initialSupply",
        "value": "1000"
        },{
        "name": "supplyMutable",
        "value": "false"
        },{
        "name": "transferable",
        "value": "true"
}]
```


#### Description of the fields:


|name |The name of the mosaic property.|
|-----|--------------------------------|
|value|The name of the mosaic property.|


MosaicLevy
----------

#### Description:

A mosaic definition can optionally specify a levy for transferring those mosaics. This might be needed by legal entities needing to collect some taxes for transfers.

#### JSON structure by example:

```json
{
        "type": 1,
        "recipient": "TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH",
        "mosaicId":  {
            "namespaceId": "nem",
            "name": "xem"
        },
        "fee": 1000
}
```


#### Description of the fields:



* type: recipient
  * The levy type. The following types are supported:            1: The levy is an absolute fee. The field 'fee' states how many sub-units of the specified mosaic will be transferred to the recipient.2: The levy is calculated from the transferred amount.                The field 'fee' states how many percentiles of the transferred quantity will transferred to the recipient.            : The recipient of the levy.
* type: mosaicId
  * The levy type. The following types are supported:            1: The levy is an absolute fee. The field 'fee' states how many sub-units of the specified mosaic will be transferred to the recipient.2: The levy is calculated from the transferred amount.                The field 'fee' states how many percentiles of the transferred quantity will transferred to the recipient.            : The mosaic in which the levy is paid.
* type: fee
  * The levy type. The following types are supported:            1: The levy is an absolute fee. The field 'fee' states how many sub-units of the specified mosaic will be transferred to the recipient.2: The levy is calculated from the transferred amount.                The field 'fee' states how many percentiles of the transferred quantity will transferred to the recipient.            : The fee. The interpretation is dependent on the type of the levy


MosaicId
--------

#### Description:

A mosaic id uniquely identifies an underlying mosaic definition.

#### JSON structure by example:

```json
{
        "namespaceId": "alice.drinks",
        "name": "orange juice"
}
```


#### Description of the fields:



* namespaceId: name
  * The corresponding namespace id. See the description of the structure Namespace. for details.: The name of the mosaic definition.


Namespace
---------

#### Description:

A namespace is the NEM version of a domain. You can rent a namespace for the duration of a year by paying a fee. The naming of the parts of a namespace has certain restrictions, see the corresponding chapter on namespaces.

#### JSON structure by example:

```json
{
        "fqn": "makoto.metal.coins",
        "owner": "TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH",
        "height": 13465
}
```


#### Description of the fields:


|fqn   |The fully qualified name of the namespace, also named namespace id.|
|------|-------------------------------------------------------------------|
|owner |The owner of the namespace.                                        |
|height|The height at which the ownership begins.                          |


#### Description:

A namespace consists of a namespace object and a database id. the id is needed for requests that support paging.

#### JSON structure by example:

```json
{
        "meta":{
            "id":26264,
        },
        "namespace":{
            "fqn": "makoto.metal.coins",
            "owner": "TD3RXTHBLK6J3UD2BH2PXSOFLPWZOTR34WCG4HXH",
            "height": 13465
        }
}
```


#### Description of the fields:


|meta     |The label for the meta data object.                                |
|---------|-------------------------------------------------------------------|
|id       |The database id for the namespace object.                          |
|namespace|The label for the namespace object.                                |
|fqn      |The fully qualified name of the namespace, also named namespace id.|
|owner    |The owner of the namespace.                                        |
|height   |The height at which the ownership begins.                          |


NemAnnounceResult
-----------------

#### Description:

The NemAnnounceResult extends the [NemRequestResult](#nemRequestResult) by supplying the additional fields 'transactionHash' and in case of a multisig transaction 'innerTransactionHash'.

#### JSON structure by example:

```json
{
        "type": 4,
        "code": 6,
        "message": "status",
        "transactionHash": {
        "data":"c1786437336da077cd572a27710c40c378610e8d33880bcb7bdb0a42e3d35586"
        },
        "innerTransactionHash": {
        "data": "44e4968e5aa35fe182d4def5958e23cf941c4bf809364afb4431ebbf6a18c039"
        }
}
```


#### Description of the fields:



* type: code
  *  See description of NemRequestResult.:  See description of NemRequestResult.
* type: message
  *  See description of NemRequestResult.:  See description of NemRequestResult.
* type: transactionHash
  *  See description of NemRequestResult.:  The JSON hash object of the transaction.
* type: innerTransactionHash
  *  See description of NemRequestResult.:  The JSON hash object of the inner transaction or null if the transaction is not a multisig transaction.


NemAsyncTimerVisitor
--------------------

#### Description:

NIS uses timers to schedule periodic tasks. Those tasks are monitored and their result is memorized. The NemAsyncTimeVisitor structure holds the information.

#### JSON structure by example:

```json
{
       "last-delay-time": 3000,
       "executions": 1024,
       "failures": 0,
       "successes": 1024,
       "last-operation-start-time": 9317695,
       "is-executing": 0,
       "name": "FORAGING",
       "average-operation-time": 0,
       "last-operation-time": 0
}
```


#### Description of the fields:


|last-delay-time          |The number of milliseconds since the last execution of the timer.|
|-------------------------|-----------------------------------------------------------------|
|executions               |The number of times the task was executed.                       |
|failures                 |The number times the task failed.                                |
|successes                |The number times the task was successful.                        |
|last-operation-start-time|The time at which the task started last time.                    |
|is-executing             |True if the task is executing, false otherwise.                  |
|name                     |The name of the task.                                            |
|average-operation-time   |The number of seconds the task needed on average.                |
|last-operation-time      |The number of seconds the task needed the last time.             |


NemRequestResult
----------------

Some requests such as announcing a new transaction return detailed information about the outcome of the request. In those cases the result of the request is returned in a special JSON object called NemRequestResult. The structure is typically used for requests that perform validation or return a status.

#### JSON structure by example:

```json
{
       "type": 4,
       "code": 6,
       "message": "status"
}
```


#### Description of the fields:



* type: code
  * The type is dependent on the request which was answered.The interpretation of the code field depends on the type. Currently the following                types are supported:1:  The result is a validation result.2:  The result is a heart beat result.4:  The result indicates a status.: The meaning of the code is dependent on the type.            For type 1 (validation result) only 0 and 1 mean there was no            failure. For a complete list of validation results see            Appendix B: NIS Errors            The following codes are the most frequent ones occurring:            0: Neutral result. A typical example would be that a node validates an incoming transaction and realizes that it already knows about the transaction. In this case it is neither a success (meaning the node has a new transaction) nor a failure (because the transaction itself is valid).1: Success result. A typical example would be that a node validates a new valid transaction.2: Unknown failure. The validation failed for unknown reasons.3: The entity that was validated has already past its deadline.4: The entity used a deadline which lies too far in the future.5: There was an account involved which had an insufficient balance to perform the operation.6: The message supplied with the transaction is too large.7: The hash of the entity which got validated is already in the database.8: The signature of the entity could not be validated.9: The entity used a timestamp that lies too far in the past.10: The entity used a timestamp that lies in the future which is not acceptable.11: The entity is unusable.12: The score of the remote block chain is inferior (although a superior score was promised).13: The remote block chain failed validation.14: There was a conflicting importance transfer detected.15: There were too many transaction in the supplied block.16: The block contains a transaction that was signed by the harvester.17: A previous importance transaction conflicts with a new transaction.18: An importance transfer activation was attempted while previous one is active.19: An importance transfer deactivation was attempted but is not active.For type 2 the following codes are supported:1: Successful heart beat detected.For type 3 the following codes are supported:0: Unknown status.1: NIS is stopped.2: NIS is starting.3: NIS is running.4: NIS is booting the local node (implies NIS is running).5: The local node is booted (implies NIS is running).6: The local node is synchronized (implies NIS is running and the local node is booted).7: There is no remote node available (implies NIS is running and the local node is booted).8: NIS is currently loading the block chain.


NisNodeInfo
-----------

#### Description:

The NisNodeInfo object provides detailed information about a node.

#### JSON structure by example:

```json
{
       "node": {
              <Node>
       },
       "nisInfo": {
              <ApplicationMetaData>
       }
}
```


#### Description of the fields:


|node                 |Denotes the beginning of the node substructure.                    |
|---------------------|-------------------------------------------------------------------|
|<Node>               |The Node object as described in Node.                              |
|nisInfo              |Denotes the beginning of the application meta data substructure.   |
|<ApplicationMetaData>|The ApplicationMetaData object as described in ApplicationMetaData.|


Node
----

#### Description:

Nodes are the entities that perform communication in the network like sending and receiving data. A node has an identity which is tied to an account through which the node can identify itself to the network. The communication is done through the endpoint of the node. Additionally a node provides meta data information.

#### JSON structure by example:

```json
{
       "metaData":
       {
              "features": 1,
              "networkId": -104,
              "application": "NIS",
              "version": "0.4.30-BETA",
              "platform": "Oracle Corporation (1.8.0_05) on Windows 8.1"
       },
       "endpoint":
       {
              "protocol": "http",
              "port": 7890,
              "host": "85.25.36.97"
       },
       "identity":
       {
              "name": "Hi, I am Alice2",
              "public-key": "3302e7703ee9f364c25bbfebb9c12ac91fa9dcd69e09a5d4f3830d71505a2350"
       }
}
```


#### Description of the fields:



* metaData: features
  * Denotes the beginning of the meta data substructure.: The number of features the nodes has.
* metaData: networkId
  * Denotes the beginning of the meta data substructure.: The network id. The following network ids are supported:104 (hex 0x68): The main network id.96 (hex 0x60): The mijin network id.152 (hex 0x98): The test network id.
* metaData: application
  * Denotes the beginning of the meta data substructure.: The name of the application that is running the node.
* metaData: version
  * Denotes the beginning of the meta data substructure.: The version of the application.
* metaData: platform
  * Denotes the beginning of the meta data substructure.: The underlying platform (OS, java version).
* metaData: endpoint
  * Denotes the beginning of the meta data substructure.: Denotes the beginning of the endpoint substructure.
* metaData: protocol
  * Denotes the beginning of the meta data substructure.: The protocol used for the communication (HTTP or HTTPS).
* metaData: port
  * Denotes the beginning of the meta data substructure.: The port used for the communication.
* metaData: host
  * Denotes the beginning of the meta data substructure.: The IP address of the endpoint.
* metaData: identity
  * Denotes the beginning of the meta data substructure.: Denotes the beginning of the identity substructure.
* metaData: name
  * Denotes the beginning of the meta data substructure.: The name of the node.
* metaData: public-key
  * Denotes the beginning of the meta data substructure.: The public key used to identify the node.


NodeCollection
--------------

#### Description:

A NodeCollection object holds arrays of nodes with different statuses. The following statuses are supported:

#### Description of the fields:



* inactive: active
  * A connection to the node cannot be established.: A connection can be established and the remote node responds in a timely manner.
* inactive: busy
  * A connection to the node cannot be established.: A connection can be established but the node cannot provide            information within the timeout limits.
* inactive: failure
  * A connection to the node cannot be established.: A fatal error occurs when trying to establish a connection or the            node couldn't authenticate itself correctly.
* inactive: data
  * A connection to the node cannot be established.: Generic status indicating the node collection just lists nodes without            saying anything about the status of the node.


#### JSON structure by example:

```json
{
       "inactive": [
              <Node>,
              <Node>
       ],
       "active": [
              <Node>,
              <Node>
       ],
       "busy": [
              <Node>,
              <Node>
       ],
       "failure": [
              <Node>,
              <Node>
       ],
}
```


#### Description of the fields:


|inactive|Denotes the beginning of the array of inactive nodes.|
|--------|-----------------------------------------------------|
|active  |Denotes the beginning of the array of active nodes.  |
|busy    |Denotes the beginning of the array of busy nodes.    |
|failure |Denotes the beginning of the array of failing nodes. |
|<Node>  |The Node object as described in Node.                |


PrivateKey
----------

#### Description:

A private key is a key to an account. Anyone having the private key to an account can initiate any account related action. **Therefore a private key must be kept secret at all costs.**

#### JSON structure by example:

```json
{
    "value": "68e4f79f886927de698df4f857de2aada41ccca6617e56bb0d61623b35b08cc0",
}
```


#### Description of the fields:



RequestAnnounce
---------------

#### Description:

A RequestAnnounce object is used to transfer the transaction data and the signature to NIS in order to initiate and broadcast a transaction.

#### JSON structure by example:

```json
{
        "data": "010100000100000000000000200000002b76078fa709bbe675
                 2222b215abc7ec0152ffe831fb4f9aed3e7749a425900a0009
                 3d0000000000000000002800000054444e46555946584f5353
                 334e4e4c4f35465a5348535a49354c33374b4e514945485055
                 4d584c54c0d45407000000000b00000001000000030000000c
                 3215",
        "signature": "db2473513c7f0ce9f8de6345f0fbe773
                      dc687eb571123d08eab4d98f96849eae
                      b63fa8756fb6c59d9b9d0e551537c1cd
                      ad4a564747ff9291db4a88b65c97c10d"
}
```


#### Description of the fields:



* data: signature
  * The transaction data as string. The string is created by            first creating the corresponding byte array (see chapter 6.7)            and then converting the byte array to a hexadecimal string.        : The signature for the transaction as hexadecimal string.


RequestPrepareAnnounce
----------------------

#### Description:

A RequestPrepareAnnounce object is used to transfer transaction data and a private key to NIS in order to initiate and broadcast a transaction.

#### JSON structure by example (test network):

```json
{
       "transaction":
       {
              "timeStamp": 9111526,
              "amount": 1000000000,
              "fee": 50000,
              "recipient": "TDGIMREMR5NSRFUOMPI5OOHLDATCABNPC5ID2SVA",
              "type": 257,
              "deadline": 9154726,
              "message":
              {
                     "payload": "74657374207472616e73616374696f6e",
                     "type": 1
              },
              "version": -1744830463,
              "signer": "a1aaca6c17a24252e674d155713cdf55996ad00175be4af02a20c67b59f9fe8a"
       },
       "privateKey": "68e4f79f886927de698df4f857de2aada41ccca6617e56bb0d61623b35b08cc0"
}
```


#### Description of the fields:



* transaction: privateKey
  * Denotes the beginning of the transaction data part. The            transaction data is described in            Appendix A: Transaction            . The field 'signature is            missing since the transaction is not signed at this point.        : The private key which NIS will use to sign the transaction.


TimeSynchronizationResult
-------------------------

#### Description:

A time synchronization result is the outcome of the network time synchronization of a node with other remote nodes. To agree upon a common time nodes need to synchronize time every hour.

#### JSON structure by example:

```json
{
       "dateTime": "2014-11-16 20:47:06",
       "currentTimeOffset": 2786,
       "change": 36
}
```


#### Description of the fields:


|dateTime         |The date and time when the synchronization was performed.       |
|-----------------|----------------------------------------------------------------|
|currentTimeOffset|The current offset to the local computer clock in milliseconds. |
|change           |The change in milliseconds compared to the last synchronization.|


#### Description:

Transactions meta data object contains additional information about the transaction.

#### JSON structure by example:

```json
{
       "height": 40706,
        "id": 2769,
        "hash": {
            "data":"37c34ead4c3fe6af42d994135798262f785ba2d807c02ac3608bc10da12e5f87"
        }
}
```


#### Description of the fields:


|height|The height of the block in which the transaction was included.|
|------|--------------------------------------------------------------|
|id    |The id of the transaction.                                    |
|hash  |The transaction hash.                                         |


#### Description:

Transactions meta data object contains additional information about the transaction.

#### JSON structure by example:

```json
{
       "meta":
              <TransactionMetaData>,
       "transaction":
              <Transaction>
}
```


#### Description of the fields:



* meta: <TransactionMetaData>
  * Contains the transaction meta data object.: The transaction meta data object as described in TransactionMetaData.
* meta: Transaction
  * Contains the transaction meta data object.: Contains the transaction object.
* meta: <Transaction>
  * Contains the transaction meta data object.: The transaction object as described in Transaction.


#### Description:

The unconfirmed transaction meta data contains the hash of the inner transaction in case the transaction is a multisig transaction. This data is need to initiate a multisig signature transaction.

```json
{
    data": "d7c9e33421e43bf4a5d6e21304c8096c599142755d581bd6e9037f41545a5873"
}
```


#### Description of the fields:



#### Description:

Transactions meta data object contains additional information about the transaction.

```json
{
    "meta":
        <UnconfirmedTransactionMetaData>,
    "transaction":
        <Transaction>
}
```


#### Description of the fields:



* meta: <UnconfirmedTransactionMetaData>
  *  Contains the transaction meta data object.:  The transaction meta data object as described in UnconfirmedTransactionMetaData.
* meta: transaction
  *  Contains the transaction meta data object.:  Contains the transaction object.
* meta: <Transaction>
  *  Contains the transaction meta data object.:  The transaction object as described in Transaction.


Error object
------------

#### Description:

If NIS encounters an error due to either invalid requests or internal problems, it returns a JSON error object. The interpretation of the error object is dependant on the context. See [Appendix B: NIS Errors](#appendix-B:-NIS-errors) for detailed information about possible errors.

#### JSON structure by example

```json
{
       "timeStamp": 9108808,
       "error": "Bad Request",
       "message": "address must be valid",
       "status": 400
}
```


#### Description of the fields:


|timeStamp|The number of seconds elapsed since the creation of the nemesis block.|
|---------|----------------------------------------------------------------------|
|error    |The general description of the error.                                 |
|message  |The detailed error message.                                           |
|Status   |The HTTP status.                                                      |


Appendix B: NIS Errors
----------------------

In case NIS encounters an error while processing a request it returns a JSON error object whose structure is described in _Appendix A:_ [Error object](#error-object) . This chapter describes the errors messages that can be returned from NIS.

Error messages
--------------

Request method 'GET' not supported

The request was performed as GET request but was expected to be a POST request.

address must be valid:

At least one address supplied in the request was invalid. Addresses are validated before processing a request. If validation fails, an error containing this message is returned.

FAILURE\_SERVER\_LIMIT:

The number of accounts that are allowed to harvest on NIS was exceeded.

JSON Object was expected:

A parameter is missing in the request.

FAILURE\_UNKNOWN\_ACCOUNT:

The account specified in the request is not known.

block not found in the db

The block that was requested could not be found in the database.

height must be positive

The block height supplied in a request was zero or negative. Block height must always be greater than zero.

network has not been booted yet

Most requests need the node that should answer the request to be already booted. If node is not booted yet, this error message will be returned.

network boot was already attempted

It was attempted to boot an already booted node. Nodes can only be booted once.

remote 123.45.67.89 attempted to call local /node/boot

It was attempted to boot a remote node. Only local node can be booted.

FAILURE\_PAST\_DEADLINE

The deadline for the entity has already expired. The deadline must always lie in the future.

FAILURE\_FUTURE\_DEADLINE

The deadline lies too far in the future. Deadlines are only allowed to lie up to 24 hours in the future.

FAILURE\_INSUFFICIENT\_BALANCE

The account does not have enough funds.

FAILURE\_MESSAGE\_TOO\_LARGE

The message for the transaction exceeds the limit of 512 bytes.

FAILURE\_HASH\_EXISTS

The hash of the entity already exists either in the cache or in the database.

FAILURE\_SIGNATURE\_NOT\_VERIFIABLE

The signature of the entity failed upon verification.

FAILURE\_TIMESTAMP\_TOO\_FAR\_IN\_PAST

The timestamp of the entity lies to far in the past.

FAILURE\_TIMESTAMP\_TOO\_FAR\_IN\_FUTURE

The timestamp of the entity lies too far in the future.

FAILURE\_INELIGIBLE\_BLOCK\_SIGNER

Validation failed because the block had an ineligible signer. This usually occurs when remote harvesting is in the process of being activated or deactivated.

FAILURE\_ENTITY\_UNUSABLE\_OUT\_OF\_SYNC

The entity cannot be processed because the remote node is out of synchronization with the local node. This happens frequently when a node is not fully synchronized and receives a new block with much larger height than its own chain.

FAILURE\_INSUFFICIENT\_FEE

The supplied transaction has an insufficient fee.

FAILURE\_NEMESIS\_ACCOUNT\_TRANSACTION\_AFTER\_NEMESIS\_BLOCK

The supplied transaction has the nemesis account as sender and cannot be included in a normal block.

FAILURE\_TRANSACTION\_CACHE\_TOO\_FULL

The transaction was rejected because the transaction cache is too full. This happens when an account tries to send too many transactions in a short time. To improve the chance that the transaction gets accepted you can try to raise the transaction fee.

FAILURE\_WRONG\_NETWORK

Entity was rejected because it has the wrong network specified.

FAILURE\_CANNOT\_HARVEST\_FROM\_BLOCKED\_ACCOUNT

Block was rejected because it was harvested by a blocked account (typically a reserved NEM fund).

FAILURE\_DESTINATION\_ACCOUNT\_HAS\_NONZERO\_BALANCE

The importance cannot be transferred to an account with nonzero balance.

FAILURE\_IMPORTANCE\_TRANSFER\_IN\_PROGRESS

The transaction is conflicting because there is already a transfer of importance in progress.

FAILURE\_IMPORTANCE\_TRANSFER\_NEEDS\_TO\_BE\_DEACTIVATED

The transaction is conflicting because the importance was already transferred.

FAILURE\_IMPORTANCE\_TRANSFER\_IS\_NOT\_ACTIVE

The transaction is conflicting because no importance has been transferred yet.

FAILURE\_TRANSACTION\_NOT\_ALLOWED\_FOR\_REMOTE

Validation failed because transaction is using remote account in an improper way.

FAILURE\_MULTISIG\_NOT\_A\_COSIGNER

The multisig transaction was rejected because the signer of the transaction is not a cosignatory of the sender account of the inner transaction.

FAILURE\_MULTISIG\_INVALID\_COSIGNERS

Validation failed because the cosignatories attached to a multisig transaction were invalid.

FAILURE\_MULTISIG\_NO\_MATCHING\_MULTISIG

The signature transaction was rejected because the corresponding multisig transaction was not found.

FAILURE\_TRANSACTION\_NOT\_ALLOWED\_FOR\_MULTISIG

The transaction was rejected because the signer is a multisig account. Multisig accounts are not allowed to initiate any transaction (only cosignatories are allowed to do so).

FAILURE\_MULTISIG\_ALREADY\_A\_COSIGNER

The transaction was rejected because it tried to add a cosignatory to a multisig account which already has this cosignatory.

FAILURE\_MULTISIG\_MODIFICATION\_MULTIPLE\_DELETES

The transaction was rejected because it tried to remove multiple cosignatories at once. It is only allowed to remove one cosignatory at a time.

FAILURE\_MULTISIG\_MODIFICATION\_REDUNDANT\_MODIFICATIONS

The transaction was rejected because it tried to do redundant modifications. This can happen if a transaction tries to add the same cosignatory two time.

FAILURE\_CONFLICTING\_MULTISIG\_MODIFICATION

The transaction was rejected because it contained conflicting modifications to a multisig account. This can for instance happen if a transaction tries to add and then delete the same cosignatory.

FAILURE\_TOO\_MANY\_MULTISIG\_COSIGNERS

The transaction was rejected because it contains too many cosignatories. The maximum number of cosignatories allowed for a multisig account is 32.

FAILURE\_MULTISIG\_ACCOUNT\_CANNOT\_BE\_COSIGNER

Validation failed because a multisig modification would result in a multisig account being a cosigner.

FAILURE\_MULTISIG\_MIN\_COSIGNATORIES\_OUT\_OF\_RANGE

Validation failed because the minimum number of cosignatories is negative or larger than the number of cosignatories.

FAILURE\_NAMESPACE\_UNKNOWN

Validation failed because the namespace is unknown.

FAILURE\_NAMESPACE\_ALREADY\_EXISTS

Validation failed because the namespace already exists.

FAILURE\_NAMESPACE\_EXPIRED

Validation failed because the namespace has expired.

FAILURE\_NAMESPACE\_OWNER\_CONFLICT

Validation failed because the transaction signer is not the owner of the namespace.

FAILURE\_NAMESPACE\_INVALID\_NAME

Validation failed because the name for the namespace is invalid.

FAILURE\_NAMESPACE\_INVALID\_RENTAL\_FEE\_SINK

Validation failed because the specified namespace rental fee sink is invalid.

FAILURE\_NAMESPACE\_INVALID\_RENTAL\_FEE

Validation failed because the specified rental fee is invalid.

FAILURE\_NAMESPACE\_PROVISION\_TOO\_EARLY

Validation failed because the provision was done too early.

FAILURE\_NAMESPACE\_NOT\_CLAIMABLE

Validation failed because the namespace contains a reserved part and is not claimable.

FAILURE\_MOSAIC\_UNKNOWN

Validation failed because the mosaic is unknown.

FAILURE\_MOSAIC\_MODIFICATION\_NOT\_ALLOWED

Validation failed because the modification of the existing mosaic is not allowed.

FAILURE\_MOSAIC\_CREATOR\_CONFLICT

Validation failed because the transaction signer is not the creator of the mosaic.

FAILURE\_MOSAIC\_SUPPLY\_IMMUTABLE

Validation failed because the mosaic supply is immutable.

FAILURE\_MOSAIC\_MAX\_SUPPLY\_EXCEEDED

Validation failed because the maximum overall mosaic supply is exceeded.

FAILURE\_MOSAIC\_SUPPLY\_NEGATIVE

Validation failed because the resulting mosaic supply would be negative.

FAILURE\_MOSAIC\_NOT\_TRANSFERABLE

Validation failed because the mosaic is not transferable.

FAILURE\_MOSAIC\_DIVISIBILITY\_VIOLATED

Validation failed because the divisibility of the mosaic is violated.

FAILURE\_CONFLICTING\_MOSAIC\_CREATION

Validation failed because conflicting mosaic creation is present.

FAILURE\_MOSAIC\_INVALID\_CREATION\_FEE\_SINK

Validation failed because the mosaic creation fee sink is invalid.

FAILURE\_MOSAIC\_INVALID\_CREATION\_FEE

Validation failed because the specified creation fee is invalid.

FAILURE\_TOO\_MANY\_MOSAIC\_TRANSFERS

Validation failed because a transfer transaction had too many attached mosaic transfers.
