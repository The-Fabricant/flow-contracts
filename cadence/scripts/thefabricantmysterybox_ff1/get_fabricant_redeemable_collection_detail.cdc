import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"
import FlowFestAccess from "../../contracts/FlowFestAccess.cdc"

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

pub fun main(account: Address): [FabricantDetails] {

    let acct = getAccount(account)

    let fabricantCollectionRef = acct.getCapability(TheFabricantMysteryBox_FF1.CollectionPublicPath)
                            .borrow<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>()!

    var ids = fabricantCollectionRef.getIDs();
    let redeemableIds: [UInt64] = []
    let allIDs = FlowFestAccess.getAccountsVerified().values
    // loop through all ids, if one of them has not been used, return true
    for id in ids {
        if(!allIDs.contains(id)){
            redeemableIds.append(id)
        }
    }
    
    let dict: [FabricantDetails] = []
    for id in redeemableIds {
        let token = fabricantCollectionRef.borrowFabricant(id: id)!
        let dataID = token.fabricant.fabricantDataID
        let fabricantData = TheFabricantMysteryBox_FF1.getFabricantData(id: dataID)
        dict.append(  
          FabricantDetails(
            id: id,
            serialNumber: token.fabricant.serialNumber,
            numberMintedPerFabricantDataID: TheFabricantMysteryBox_FF1.getFabricantNumberMinted(id: dataID),
            fabricantDataID: dataID,
            mainImage: fabricantData.mainImage
          )
        )
    }
    return dict
}