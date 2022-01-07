import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"
import FlowFestAccess from "../../contracts/FlowFestAccess.cdc"
// This script returns the size of an account's Fabricant collection.

pub fun main(address: Address): Bool {
    let account = getAccount(address)
    let collectionRef = account.getCapability<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath)
    //check if have flowfest collection
    if (collectionRef.borrow() == nil) {
        return false
    }

    //check if flowfest collection has 1 nft that has not been used to verify
    let ids = collectionRef.borrow()!.getIDs()

    let allIDs = FlowFestAccess.getAccountsVerified().values
    // loop through all ids, if one of them has not been used, return true
    for id in ids {
        if(!allIDs.contains(id)){
            return true
        }
    }
    return false
}