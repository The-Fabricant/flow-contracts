import FlowFestAccess from "../../contracts/FlowFestAccess.cdc"
// This script checks whether an address has already redeemed a flowfest nft

pub fun main(address: Address): Bool {
    return FlowFestAccess.isAccountVerified(address: address)
}