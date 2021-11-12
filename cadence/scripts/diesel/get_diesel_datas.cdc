import DieselNFT from "../../contracts/DieselNFT.cdc"
pub fun main(): {UInt32: DieselNFT.DieselData} {

    return DieselNFT.getDieselDatas()
}