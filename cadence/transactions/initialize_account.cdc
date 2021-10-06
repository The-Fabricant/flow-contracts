import FlowToken from "../contracts/FlowToken.cdc"
import FungibleToken from "../contracts/FungibleToken.cdc"
import TheFabricantMysteryBox_FF1 from "../contracts/TheFabricantMysteryBox_FF1.cdc"

pub fun hasFlowToken(_ address: Address): Bool {
let receiver = getAccount(address)
    .getCapability<&FlowToken.Vault{FungibleToken.Receiver}>(/public/flowTokenReceiver)
    .check()
let balance = getAccount(address)
    .getCapability<&FlowToken.Vault{FungibleToken.Balance}>(/public/flowTokenBalance)
    .check()
return receiver && balance
}

pub fun hasTheFabricantMysteryBox_FF1(_ address: Address): Bool {
    return getAccount(address)
        .getCapability<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath)
        .check()
}

transaction {

    prepare(acct: AuthAccount) {
        if !hasFlowToken(acct.address) {
        if acct.borrow<&FlowToken.Vault>(from: /storage/flowTokenVault) == nil {
          acct.save(<-FlowToken.createEmptyVault(), to: /storage/flowTokenVault)
        }
        acct.unlink(/public/flowTokenReceiver)
        acct.unlink(/public/flowTokenBalance)
        acct.link<&FlowToken.Vault{FungibleToken.Receiver}>(/public/flowTokenReceiver, target: /storage/flowTokenVault)
        acct.link<&FlowToken.Vault{FungibleToken.Balance}>(/public/flowTokenBalance, target: /storage/flowTokenVault)
        }

        if !hasTheFabricantMysteryBox_FF1(acct.address) {
        if acct.borrow<&TheFabricantMysteryBox_FF1.Collection>(from: TheFabricantMysteryBox_FF1.CollectionStoragePath) == nil {
            let collection <- TheFabricantMysteryBox_FF1.createEmptyCollection() as! @TheFabricantMysteryBox_FF1.Collection
            // Put the new Collection in storage
            acct.save(<-collection, to: TheFabricantMysteryBox_FF1.CollectionStoragePath)
        }
        acct.unlink(TheFabricantMysteryBox_FF1.CollectionPublicPath)
        // create a public capability for the collection
        acct.link<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>(TheFabricantMysteryBox_FF1.CollectionPublicPath, target: TheFabricantMysteryBox_FF1.CollectionStoragePath)
        }
    }
    
}
  
