import MiamiNFT from "../../contracts/MiamiNFT.cdc"
pub fun main(): {UInt32: MiamiNFT.MiamiData} {

    return MiamiNFT.getMiamiDatas()
}