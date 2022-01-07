import MiamiNFT from "../../contracts/MiamiNFT.cdc"

pub struct MiamiDetails {
  pub let serialNumber: UInt32
  pub let numberMintedPerMiamiDataID: UInt32
  pub let miamiDataID: UInt32
  pub let name: String
  pub let description: String
  pub let mainVideo: String

  init(
    serialNumber: UInt32,
    numberMintedPerMiamiDataID: UInt32,
    miamiDataID: UInt32,
    name: String,
    description: String,
    mainVideo: String
  )
  {
    self.serialNumber = serialNumber
    self.numberMintedPerMiamiDataID = numberMintedPerMiamiDataID
    self.miamiDataID = miamiDataID
    self.name = name
    self.description = description
    self.mainVideo = mainVideo
  }
}

pub fun main(account: Address, id: UInt64): MiamiDetails {

    let acct = getAccount(account)

    let miamiCollectionRef = acct.getCapability(MiamiNFT.CollectionPublicPath)
                            .borrow<&{MiamiNFT.MiamiCollectionPublic}>()!

    let token = miamiCollectionRef.borrowMiami(id: id)!
    let dataID = token.miami.miamiDataID
    let miamiData = MiamiNFT.getMiamiData(id: dataID)
    let details =  
    MiamiDetails(
        serialNumber: token.miami.serialNumber,
        numberMintedPerMiamiDataID: MiamiNFT.getMiamiNumberMinted(id: dataID),
        miamiDataID: dataID,
        name: miamiData.name,
        description: miamiData.description,
        mainVideo: miamiData.mainVideo
    )

    return details
}