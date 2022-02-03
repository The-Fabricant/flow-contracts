import FlowToken from "../contracts/FlowToken.cdc"
import FungibleToken from "../contracts/FungibleToken.cdc"
import MiamiNFT from "../contracts/MiamiNFT.cdc"

transaction() {

    prepare(acct: AuthAccount) {
        if !acct.getCapability<&{MiamiNFT.MiamiCollectionPublic}>(MiamiNFT.CollectionPublicPath).check(){
            if acct.borrow<&MiamiNFT.Collection>(from: MiamiNFT.CollectionStoragePath) == nil {
                let collection <- MiamiNFT.createEmptyCollection() as! @MiamiNFT.Collection
                // Put the new Collection in storage
                acct.save(<-collection, to: MiamiNFT.CollectionStoragePath)
            }
            acct.unlink(MiamiNFT.CollectionPublicPath)
            // create a public capability for the collection
            acct.link<&{MiamiNFT.MiamiCollectionPublic}>(MiamiNFT.CollectionPublicPath, target: MiamiNFT.CollectionStoragePath)
        }
    }
    
}
  
