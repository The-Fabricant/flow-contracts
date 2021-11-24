import NonFungibleToken from "../../contracts/NonFungibleToken.cdc"
import MiamiNFT from "../../contracts/MiamiNFT.cdc"

// This script returns the size of an account's Miami collection.

pub fun main(address: Address): Int {
    let account = getAccount(address)

    let collectionRef = account.getCapability(MiamiNFT.CollectionPublicPath)
        .borrow<&{MiamiNFT.MiamiCollectionPublic}>()
        ?? panic("Could not borrow capability from public collection")
    
    return collectionRef.getIDs().length
}