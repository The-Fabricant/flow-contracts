import DieselNFT from "../../contracts/DieselNFT.cdc"
import FlowToken from "../../contracts/FlowToken.cdc"
import FungibleToken from "../../contracts/FungibleToken.cdc"
transaction(recipientAddr: Address, dieselDataID: UInt32, royaltyVaultAddr: Address) {

    let adminRef: &DieselNFT.Admin

    let royaltyVault: Capability<&FlowToken.Vault{FungibleToken.Receiver}>

    prepare(acct: AuthAccount) {

        self.adminRef = acct.borrow<&DieselNFT.Admin>(from: DieselNFT.AdminStoragePath)
            ?? panic("No admin resource in storage")

        self.royaltyVault = getAccount(royaltyVaultAddr).getCapability<&FlowToken.Vault{FungibleToken.Receiver}>(/public/flowTokenReceiver)
    }

    execute {

        // Mint the nft with specific name
        let nft <- self.adminRef.mintNFT(dieselDataID: dieselDataID, royaltyVault: self.royaltyVault)

        let recipient = getAccount(recipientAddr)

        // Get the diesel collection capability of the receiver of nft
        let nftReceiver = recipient
            .getCapability(DieselNFT.CollectionPublicPath)
            .borrow<&{DieselNFT.DieselCollectionPublic}>()
            ?? panic("Unable to borrow recipient's diesel collection")

        // Deposit the diesel
        nftReceiver.deposit(token: <- nft)

    }

}



 