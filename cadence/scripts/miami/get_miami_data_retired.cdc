import MiamiNFT from "../../contracts/MiamiNFT.cdc"

pub fun main(miamiDataID: UInt32): Bool {
    return MiamiNFT.getMiamiDataRetired(miamiDataID: miamiDataID)
}
 