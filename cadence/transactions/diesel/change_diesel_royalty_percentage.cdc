import DieselNFT from "../../contracts/DieselNFT.cdc"

transaction(newRoyaltyPercentage: UFix64) {

    let adminRef: &DieselNFT.Admin

    prepare(acct: AuthAccount) {

        self.adminRef = acct.borrow<&DieselNFT.Admin>(from: DieselNFT.AdminStoragePath)
            ?? panic("No admin resource in storage")

    }

    execute {

        self.adminRef.changeRoyaltyPercentage(newRoyaltyPercentage: newRoyaltyPercentage)

    }
}