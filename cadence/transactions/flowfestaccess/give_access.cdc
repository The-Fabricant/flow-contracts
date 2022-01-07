import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"
import FlowFestAccess from "../../contracts/FlowFestAccess.cdc"
// This transaction gives a user access to the website if they have a flowfest nft

transaction() {
    prepare(signer: AuthAccount) {
        let collectionRef = signer.getCapability<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath)
        
        let ids = collectionRef.borrow()!.getIDs()

        let allIDs = FlowFestAccess.getAccountsVerified().values
        //loop through collection's id array. If it is not in map, save it in map.
        for id in ids {
            if(!allIDs.contains(id)){
                FlowFestAccess.giveAccess(id: id, collectionCap: collectionRef)
                return 
            }
        }
    }
}