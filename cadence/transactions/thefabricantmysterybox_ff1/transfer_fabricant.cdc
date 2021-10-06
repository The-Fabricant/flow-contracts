import NonFungibleToken from "../../contracts/NonFungibleToken.cdc"
import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"

// This transaction transfers a Kitty Item from one account to another.

transaction(recipient: Address, withdrawID: UInt64) {
    prepare(signer: AuthAccount) {
        
        // get the recipients public account object
        let recipient = getAccount(recipient)

        // borrow a reference to the signer's NFT collection
        let collectionRef = signer.borrow<&TheFabricantMysteryBox_FF1.Collection>(from: TheFabricantMysteryBox_FF1.CollectionStoragePath)
            ?? panic("Could not borrow a reference to the owner's collection")


        // Get the hat collection capability of the receiver of nft
        let nftReceiver = recipient
            .getCapability(TheFabricantMysteryBox_FF1.CollectionPublicPath)
            .borrow<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>()
            ?? panic("Unable to borrow recipient's hat collection")

        // withdraw the NFT from the owner's collection
        let nft <- collectionRef.withdraw(withdrawID: withdrawID)

        // Deposit the NFT in the recipient's collection
        nftReceiver.deposit(token: <-nft)
    }
}