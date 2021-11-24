import MiamiNFT from "../../contracts/MiamiNFT.cdc"
import FlowToken from "../../contracts/FlowToken.cdc"
import FungibleToken from "../../contracts/FungibleToken.cdc"
transaction(recipientAddr: Address, miamiDataID: UInt32, royaltyVaultAddr: Address, quantity: UInt64) {

    let adminRef: &MiamiNFT.Admin

    let royaltyVault: Capability<&FlowToken.Vault{FungibleToken.Receiver}> 

    prepare(acct: AuthAccount) {

        self.adminRef = acct.borrow<&MiamiNFT.Admin>(from: MiamiNFT.AdminStoragePath)
            ?? panic("No admin resource in storage")

        self.royaltyVault = getAccount(royaltyVaultAddr).getCapability<&FlowToken.Vault{FungibleToken.Receiver}>(/public/flowTokenReceiver)
    }

    execute {

        // Mint all the new NFTs
        let collection <- self.adminRef.batchMintNFT(miamiDataID: miamiDataID, royaltyVault: self.royaltyVault, quantity: quantity)

        // Get the account object for the recipient of the minted tokens
        let recipient = getAccount(recipientAddr)

        // get the Collection reference for the receiver
        let receiverRef = recipient.getCapability(MiamiNFT.CollectionPublicPath).borrow<&{MiamiNFT.MiamiCollectionPublic}>()
            ?? panic("Cannot borrow a reference to the recipient's collection")

        // deposit the NFT in the receivers collection
        receiverRef.batchDeposit(tokens: <-collection)

    }
}