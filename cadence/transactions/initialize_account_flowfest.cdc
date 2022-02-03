import FlowToken from "../contracts/FlowToken.cdc"
import FungibleToken from "../contracts/FungibleToken.cdc"
import TheFabricantMysteryBox_FF1 from "../contracts/TheFabricantMysteryBox_FF1.cdc"

transaction {

    prepare(acct: AuthAccount) {
        if !acct.getCapability<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath).check(){
            if acct.borrow<&TheFabricantMysteryBox_FF1.Collection>(from: TheFabricantMysteryBox_FF1.CollectionStoragePath) == nil {
                let collection <- TheFabricantMysteryBox_FF1.createEmptyCollection() as! @TheFabricantMysteryBox_FF1.Collection
                // Put the new Collection in storage
                acct.save(<-collection, to: TheFabricantMysteryBox_FF1.CollectionStoragePath)
            }
            acct.unlink(TheFabricantMysteryBox_FF1.CollectionPublicPath)
            // create a public capability for the collection
            acct.link<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath, target: TheFabricantMysteryBox_FF1.CollectionStoragePath)
        }
    }
    
}
  
