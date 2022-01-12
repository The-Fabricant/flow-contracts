  import TheFabricantMysteryBox_FF1 from "../contracts/TheFabricantMysteryBox_FF1.cdc"

  pub fun hasFlowFest(_ address: Address): Bool {
    return getAccount(address)
      .getCapability<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath)
      .check()
  }

  pub fun main(address: Address): {String: Bool} {
    let ret: {String: Bool} = {}
      ret["HasFlowFest"] = hasFlowFest(address)
    return ret
  }