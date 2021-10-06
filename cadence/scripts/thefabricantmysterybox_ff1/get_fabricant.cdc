import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"

pub fun main(account: Address): &TheFabricantMysteryBox_FF1.NFT {

    let acct = getAccount(account)

    let fabricantCollectionRef = acct.getCapability(TheFabricantMysteryBox_FF1.CollectionPublicPath)
                            .borrow<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>()!

    let token = fabricantCollectionRef.borrowFabricant(id: 1)!
    return token

}