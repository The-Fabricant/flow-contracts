import MiamiNFT from "../../contracts/MiamiNFT.cdc"

pub fun main(account: Address, id: UInt64): String{

    let acct = getAccount(account)

    let miamiCollectionRef = acct.getCapability(MiamiNFT.CollectionPublicPath)
                            .borrow<&{MiamiNFT.MiamiCollectionPublic}>()!

    let token = miamiCollectionRef.borrowMiami(id: id)!
    let dataID = token.miami.miamiDataID
    let miamiData = MiamiNFT.getMiamiData(id: dataID)

    return miamiData.mainVideo

}