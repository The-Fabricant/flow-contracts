import DieselNFT from "../../contracts/DieselNFT.cdc"

pub struct DieselDetails {
  pub let id: UInt64
  pub let serialNumber: UInt32
  pub let numberMintedPerDieselDataID: UInt32
  pub let dieselDataID: UInt32
  pub let name: String
  pub let description: String
  pub let mainVideo: String

  init(
    id: UInt64,
    serialNumber: UInt32,
    numberMintedPerDieselDataID: UInt32,
    dieselDataID: UInt32,
    name: String,
    description: String,
    mainVideo: String
  )
  {
    self.id = id
    self.serialNumber = serialNumber
    self.numberMintedPerDieselDataID = numberMintedPerDieselDataID
    self.dieselDataID = dieselDataID
    self.name = name
    self.description = description
    self.mainVideo = mainVideo
  }
}

pub fun main(account: Address): [DieselDetails] {

    let acct = getAccount(account)

    let dieselCollectionRef = acct.getCapability(DieselNFT.CollectionPublicPath)
                            .borrow<&{DieselNFT.DieselCollectionPublic}>()!

    var ids = dieselCollectionRef.getIDs();
    let dict: [DieselDetails] = []
    for id in ids {
        let token = dieselCollectionRef.borrowDiesel(id: id)!
        let dataID = token.diesel.dieselDataID
        let dieselData = DieselNFT.getDieselData(id: dataID)
        dict.append(  
          DieselDetails(
            id: id,
            serialNumber: token.diesel.serialNumber,
            numberMintedPerDieselDataID: DieselNFT.getDieselNumberMinted(id: dataID),
            dieselDataID: dataID,
            name: dieselData.name,
            description: dieselData.description,
            mainVideo: dieselData.mainVideo
          )
        )
    }
    return dict
}