import DieselNFT from "../../contracts/DieselNFT.cdc"
import FlowToken from "../../contracts/FlowToken.cdc"
import FungibleToken from "../../contracts/FungibleToken.cdc"
transaction(recipientAddr: Address, dieselDataID: UInt32, royaltyVaultAddr: Address, quantity: UInt64) {

    let adminRef: &DieselNFT.Admin

    let royaltyVault: Capability<&FlowToken.Vault{FungibleToken.Receiver}> 

    prepare(acct: AuthAccount) {

        self.adminRef = acct.borrow<&DieselNFT.Admin>(from: DieselNFT.AdminStoragePath)
            ?? panic("No admin resource in storage")

        self.royaltyVault = getAccount(royaltyVaultAddr).getCapability<&FlowToken.Vault{FungibleToken.Receiver}>(/public/flowTokenReceiver)
    }

    execute {

        // Mint all the new NFTs
        let collection <- self.adminRef.batchMintNFT(dieselDataID: dieselDataID, royaltyVault: self.royaltyVault, quantity: quantity)

        // Get the account object for the recipient of the minted tokens
        let recipient = getAccount(recipientAddr)

        // get the Collection reference for the receiver
        let receiverRef = recipient.getCapability(DieselNFT.CollectionPublicPath).borrow<&{DieselNFT.DieselCollectionPublic}>()
            ?? panic("Cannot borrow a reference to the recipient's collection")

        // deposit the NFT in the receivers collection
        receiverRef.batchDeposit(tokens: <-collection)

    }
}