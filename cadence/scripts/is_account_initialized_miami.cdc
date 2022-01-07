  import MiamiNFT from "../contracts/MiamiNFT.cdc"

  pub fun hasMiamiNFT(_ address: Address): Bool {
    return getAccount(address)
      .getCapability<&{MiamiNFT.MiamiCollectionPublic}>(MiamiNFT.CollectionPublicPath)
      .check()
  }

  pub fun main(address: Address): {String: Bool} {
    let ret: {String: Bool} = {}
      ret["HasMiami"] = hasMiamiNFT(address)
    return ret
  }