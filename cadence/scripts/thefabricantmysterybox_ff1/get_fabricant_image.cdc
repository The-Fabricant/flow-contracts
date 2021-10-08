import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"

pub fun main(account: Address, id: UInt64): String{

    let acct = getAccount(account)

    let fabricantCollectionRef = acct.getCapability(TheFabricantMysteryBox_FF1.CollectionPublicPath)
                            .borrow<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>()!

    let token = fabricantCollectionRef.borrowFabricant(id: id)!
    let dataID = token.fabricant.fabricantDataID
    let fabricantData = TheFabricantMysteryBox_FF1.getFabricantData(id: dataID)

    return fabricantData.mainImage

}