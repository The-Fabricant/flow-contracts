import DieselNFT from "../../contracts/DieselNFT.cdc"

pub fun main(account: Address, id: UInt64): String{

    let acct = getAccount(account)

    let dieselCollectionRef = acct.getCapability(DieselNFT.CollectionPublicPath)
                            .borrow<&{DieselNFT.DieselCollectionPublic}>()!

    let token = dieselCollectionRef.borrowDiesel(id: id)!
    let dataID = token.diesel.dieselDataID
    let dieselData = DieselNFT.getDieselData(id: dataID)

    return dieselData.mainVideo

}