import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"
import FlowToken from "../../contracts/FlowToken.cdc"
import FungibleToken from "../../contracts/FungibleToken.cdc"
transaction(recipientAddr: Address, fabricantDataID: UInt32, royaltyVaultAddr: Address) {

    let adminRef: &TheFabricantMysteryBox_FF1.Admin

    let royaltyVault: Capability<&FlowToken.Vault{FungibleToken.Receiver}>

    prepare(acct: AuthAccount) {

        self.adminRef = acct.borrow<&TheFabricantMysteryBox_FF1.Admin>(from: TheFabricantMysteryBox_FF1.AdminStoragePath)
            ?? panic("No admin resource in storage")

        self.royaltyVault = getAccount(royaltyVaultAddr).getCapability<&FlowToken.Vault{FungibleToken.Receiver}>(/public/flowTokenReceiver)
    }

    execute {

        // Mint the nft with specific name
        let nft <- self.adminRef.mintNFT(fabricantDataID: fabricantDataID, royaltyVault: self.royaltyVault)

        let recipient = getAccount(recipientAddr)

        // Get the fabricant collection capability of the receiver of nft
        let nftReceiver = recipient
            .getCapability(TheFabricantMysteryBox_FF1.CollectionPublicPath)
            .borrow<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>()
            ?? panic("Unable to borrow recipient's fabricant collection")

        // Deposit the fabricant
        nftReceiver.deposit(token: <- nft)

    }

}



 