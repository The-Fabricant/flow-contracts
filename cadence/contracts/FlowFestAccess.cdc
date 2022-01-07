import NonFungibleToken from "./NonFungibleToken.cdc"
import FungibleToken from "./FungibleToken.cdc"
import TheFabricantMysteryBox_FF1 from "./TheFabricantMysteryBox_FF1.cdc"
pub contract FlowFestAccess {

    // -----------------------------------------------------------------------
    // FlowFestAccess contract Events
    // -----------------------------------------------------------------------
    pub event AccountVerified(address: Address, id: UInt64)
    access(self) var accountsVerified: {Address: UInt64}

    pub fun giveAccess(id: UInt64, collectionCap: Capability<&{TheFabricantMysteryBox_FF1.FabricantCollectionPublic}>){
        pre {
            FlowFestAccess.isAccountVerified(address: collectionCap.address) == false:
            "account already has access"
        }
        let collection = collectionCap.borrow()!
        let ids = collection.getIDs()
        if ids.contains(id) {
            FlowFestAccess.accountsVerified[collectionCap.address] = id
        }
        emit AccountVerified(address: collectionCap.address, id: id)
    }

    pub fun getAccountsVerified(): {Address: UInt64} {
        return FlowFestAccess.accountsVerified
    }

    pub fun isAccountVerified(address: Address): Bool {
        for key in FlowFestAccess.accountsVerified.keys {
            if key == address {
                return true
            }
        }
        return false
    }
    // -----------------------------------------------------------------------
    // initialization function
    // -----------------------------------------------------------------------
    //
    init() {
        self.accountsVerified = {}
    }
}
 