import MiamiNFT from "../../contracts/MiamiNFT.cdc"

pub struct MiamiDetails {
  pub let id: UInt64
  pub let serialNumber: UInt32
  pub let numberMintedPerMiamiDataID: UInt32
  pub let miamiDataID: UInt32
  pub let name: String
  pub let description: String
  pub let mainVideo: String
  pub let season: String
  pub let creator: Address


  init(
    id: UInt64,
    serialNumber: UInt32,
    numberMintedPerMiamiDataID: UInt32,
    miamiDataID: UInt32,
    name: String,
    description: String,
    mainVideo: String,
    season: String,
    creator: Address
  )
  {
    self.id = id
    self.serialNumber = serialNumber
    self.numberMintedPerMiamiDataID = numberMintedPerMiamiDataID
    self.miamiDataID = miamiDataID
    self.name = name
    self.description = description
    self.mainVideo = mainVideo
    self.season = season
    self.creator = creator
  }
}

pub fun main(account: Address): [MiamiDetails] {

    let acct = getAccount(account)

    let miamiCollectionRef = acct.getCapability(MiamiNFT.CollectionPublicPath)
                            .borrow<&{MiamiNFT.MiamiCollectionPublic}>()!

    var ids = miamiCollectionRef.getIDs();
    let dict: [MiamiDetails] = []
    for id in ids {
        let token = miamiCollectionRef.borrowMiami(id: id)!
        let dataID = token.miami.miamiDataID
        let miamiData = MiamiNFT.getMiamiData(id: dataID)
        dict.append(  
          MiamiDetails(
            id: id,
            serialNumber: token.miami.serialNumber,
            numberMintedPerMiamiDataID: MiamiNFT.getMiamiNumberMinted(id: dataID),
            miamiDataID: dataID,
            name: miamiData.name,
            description: miamiData.description,
            mainVideo: miamiData.mainVideo,
            season: miamiData.season,
            creator: miamiData.creator
          )
        )
    }
    return dict
}