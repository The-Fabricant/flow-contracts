import MiamiNFT from "../../contracts/MiamiNFT.cdc"
import FlowToken from "../../contracts/FlowToken.cdc"
import FungibleToken from "../../contracts/FungibleToken.cdc"
transaction(recipientAddr: Address, miamiDataID: UInt32, royaltyVaultAddr: Address) {

    let adminRef: &MiamiNFT.Admin

    let royaltyVault: Capability<&FlowToken.Vault{FungibleToken.Receiver}>

    prepare(acct: AuthAccount) {

        self.adminRef = acct.borrow<&MiamiNFT.Admin>(from: MiamiNFT.AdminStoragePath)
            ?? panic("No admin resource in storage")

        self.royaltyVault = getAccount(royaltyVaultAddr).getCapability<&FlowToken.Vault{FungibleToken.Receiver}>(/public/flowTokenReceiver)
    }

    execute {

        // Mint the nft with specific name
        let nft <- self.adminRef.mintNFT(miamiDataID: miamiDataID, royaltyVault: self.royaltyVault)

        let recipient = getAccount(recipientAddr)

        // Get the miami collection capability of the receiver of nft
        let nftReceiver = recipient
            .getCapability(MiamiNFT.CollectionPublicPath)
            .borrow<&{MiamiNFT.MiamiCollectionPublic}>()
            ?? panic("Unable to borrow recipient's miami collection")

        // Deposit the miami
        nftReceiver.deposit(token: <- nft)

    }

}



 