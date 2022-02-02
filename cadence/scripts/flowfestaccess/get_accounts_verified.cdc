import FlowFestAccess from "../../contracts/FlowFestAccess.cdc"
// This script returns the size of an account's Fabricant collection.

pub fun main(): {Address: UInt64} {
    return FlowFestAccess.getAccountsVerified()
}