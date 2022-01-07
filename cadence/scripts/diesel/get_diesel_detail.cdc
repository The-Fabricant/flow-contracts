import DieselNFT from "../../contracts/DieselNFT.cdc"

pub struct DieselDetails {
  pub let serialNumber: UInt32
  pub let numberMintedPerDieselDataID: UInt32
  pub let dieselDataID: UInt32
  pub let name: String
  pub let description: String
  pub let mainVideo: String

  init(
    serialNumber: UInt32,
    numberMintedPerDieselDataID: UInt32,
    dieselDataID: UInt32,
    name: String,
    description: String,
    mainVideo: String
  )
  {
    self.serialNumber = serialNumber
    self.numberMintedPerDieselDataID = numberMintedPerDieselDataID
    self.dieselDataID = dieselDataID
    self.name = name
    self.description = description
    self.mainVideo = mainVideo
  }
}

pub fun main(account: Address, id: UInt64): DieselDetails {

    let acct = getAccount(account)

    let dieselCollectionRef = acct.getCapability(DieselNFT.CollectionPublicPath)
                            .borrow<&{DieselNFT.DieselCollectionPublic}>()!

    let token = dieselCollectionRef.borrowDiesel(id: id)!
    let dataID = token.diesel.dieselDataID
    let dieselData = DieselNFT.getDieselData(id: dataID)
    let details =  
    DieselDetails(
        serialNumber: token.diesel.serialNumber,
        numberMintedPerDieselDataID: DieselNFT.getDieselNumberMinted(id: dataID),
        dieselDataID: dataID,
        name: dieselData.name,
        description: dieselData.description,
        mainVideo: dieselData.mainVideo
    )

    return details
}