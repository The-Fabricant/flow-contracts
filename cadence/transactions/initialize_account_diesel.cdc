import FlowToken from "../contracts/FlowToken.cdc"
import FungibleToken from "../contracts/FungibleToken.cdc"
import DieselNFT from "../contracts/DieselNFT.cdc"

transaction() {

    prepare(acct: AuthAccount) {
        if !acct
        .getCapability<&{DieselNFT.DieselCollectionPublic}>(DieselNFT.CollectionPublicPath)
        .check() {
        if acct.borrow<&DieselNFT.Collection>(from: DieselNFT.CollectionStoragePath) == nil {
            let collection <- DieselNFT.createEmptyCollection() as! @DieselNFT.Collection
            // Put the new Collection in storage
            acct.save(<-collection, to: DieselNFT.CollectionStoragePath)
        }
        acct.unlink(DieselNFT.CollectionPublicPath)
        // create a public capability for the collection
        acct.link<&{DieselNFT.DieselCollectionPublic}>(DieselNFT.CollectionPublicPath, target: DieselNFT.CollectionStoragePath)
        }
    }
    
}
  
