import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"
pub fun main(): {UInt32: TheFabricantMysteryBox_FF1.FabricantData} {

    return TheFabricantMysteryBox_FF1.getFabricantDatas()
}