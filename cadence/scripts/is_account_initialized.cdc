  import FungibleToken from "../contracts/FungibleToken.cdc"
  import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
  import DieselNFT from "../contracts/DieselNFT.cdc"

  pub fun hasDieselNFT(_ address: Address): Bool {
    return getAccount(address)
      .getCapability<&{DieselNFT.DieselCollectionPublic}>(DieselNFT.CollectionPublicPath)
      .check()
  }


  pub fun main(address: Address): {String: Bool} {
    let ret: {String: Bool} = {}
    ret["HasDiesel"] = hasDieselNFT(address)
    return ret
  }