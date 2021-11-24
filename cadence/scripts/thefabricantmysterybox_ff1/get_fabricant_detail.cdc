import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"

pub struct FabricantDetails {
  pub let id: UInt64
  pub let serialNumber: UInt32
  pub let numberMintedPerFabricantDataID: UInt32
  pub let fabricantDataID: UInt32
  pub let mainImage: String

  init(
    id: UInt64,
    serialNumber: UInt32,
    numberMintedPerFabricantDataID: UInt32,
    fabricantDataID: UInt32,
    mainImage: String
  )
  {
    self.id = id
    self.serialNumber = serialNumber
    self.numberMintedPerFabricantDataID = numberMintedPerFabricantDataID
    self.fabricantDataID = fabricantDataID
    self.mainImage = mainImage
  }
}

pub fun main(account: Address, id: UInt64): FabricantDetails {

    let acct = getAccount(account)

    let fabricantCollectionRef = acct.getCapability(TheFabricantMysteryBox_FF1.CollectionPublicPath)
                            .borrow<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>()!

    let token = fabricantCollectionRef.borrowFabricant(id: id)!
    let dataID = token.fabricant.fabricantDataID
    let fabricantData = TheFabricantMysteryBox_FF1.getFabricantData(id: dataID)
    let details =  
    FabricantDetails(
        serialNumber: token.fabricant.serialNumber,
        numberMintedPerFabricantDataID: TheFabricantMysteryBox_FF1.getFabricantNumberMinted(id: dataID),
        fabricantDataID: dataID,
        mainImage: fabricantData.mainImage
    )

    return details
}