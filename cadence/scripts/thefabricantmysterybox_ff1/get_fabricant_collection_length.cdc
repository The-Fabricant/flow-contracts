import NonFungibleToken from "../../contracts/NonFungibleToken.cdc"
import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"

// This script returns the size of an account's Fabricant collection.

pub fun main(address: Address): Int {
    let account = getAccount(address)

    let collectionRef = account.getCapability(TheFabricantMysteryBox_FF1.CollectionPublicPath)
        .borrow<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>()
        ?? panic("Could not borrow capability from public collection")
    
    return collectionRef.getIDs().length
}