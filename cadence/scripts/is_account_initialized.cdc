  import FungibleToken from "../contracts/FungibleToken.cdc"
  import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
  import TheFabricantMysteryBox_FF1 from "../contracts/TheFabricantMysteryBox_FF1.cdc"

  pub fun hasFabricantNFT(_ address: Address): Bool {
    return getAccount(address)
      .getCapability<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath)
      .check()
  }


  pub fun main(address: Address): {String: Bool} {
    let ret: {String: Bool} = {}
    ret["HasTheFabricantMysteryBox"] = hasFabricantNFT(address)
    return ret
  }