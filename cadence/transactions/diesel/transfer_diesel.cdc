import NonFungibleToken from "../../contracts/NonFungibleToken.cdc"
import DieselNFT from "../../contracts/DieselNFT.cdc"

transaction(recipient: Address, withdrawID: UInt64) {
    prepare(signer: AuthAccount) {
        
        // get the recipients public account object
        let recipient = getAccount(recipient)

        // borrow a reference to the signer's NFT collection
        let collectionRef = signer.borrow<&DieselNFT.Collection>(from: DieselNFT.CollectionStoragePath)
            ?? panic("Could not borrow a reference to the owner's collection")


        // Get the hat collection capability of the receiver of nft
        let nftReceiver = recipient
            .getCapability(DieselNFT.CollectionPublicPath)
            .borrow<&{DieselNFT.FabricantCollectionPublic}>()
            ?? panic("Unable to borrow recipient's hat collection")

        // withdraw the NFT from the owner's collection
        let nft <- collectionRef.withdraw(withdrawID: withdrawID)

        // Deposit the NFT in the recipient's collection
        nftReceiver.deposit(token: <-nft)
    }
}