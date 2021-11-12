import DieselNFT from "../../contracts/DieselNFT.cdc"

pub fun main(dieselDataID: UInt32): Bool {
    return DieselNFT.getDieselDataRetired(dieselDataID: dieselDataID)
}
 