import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"
import FlowFestAccess from "../../contracts/FlowFestAccess.cdc"
// This script checks whether they have a flowfest nft they can redeem

pub fun main(address: Address): [UInt64] {
    let account = getAccount(address)
    let redeemableNFTs: [UInt64] = []
    let collectionRef = account.getCapability<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath)
    //check if have flowfest collection
    if (collectionRef.borrow() == nil) {
        return redeemableNFTs
    }

    //check if flowfest collection has 1 nft that has not been used to verify
    let ids = collectionRef.borrow()!.getIDs()

    let allIDs = FlowFestAccess.getAccountsVerified().values
    // loop through all ids, if one of them has not been used, return true
    for id in ids {
        if(!allIDs.contains(id)){
            redeemableNFTs.append(id)
        }
    }
    return redeemableNFTs
}