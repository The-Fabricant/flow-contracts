import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"

pub fun main(fabricantDataID: UInt32): Bool {
    return TheFabricantMysteryBox_FF1.getFabricantDataRetired(fabricantDataID: fabricantDataID)
}
 