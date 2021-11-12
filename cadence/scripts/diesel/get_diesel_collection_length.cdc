import NonFungibleToken from "../../contracts/NonFungibleToken.cdc"
import DieselNFT from "../../contracts/DieselNFT.cdc"

// This script returns the size of an account's Diesel collection.

pub fun main(address: Address): Int {
    let account = getAccount(address)

    let collectionRef = account.getCapability(DieselNFT.CollectionPublicPath)
        .borrow<&{DieselNFT.DieselCollectionPublic}>()
        ?? panic("Could not borrow capability from public collection")
    
    return collectionRef.getIDs().length
}