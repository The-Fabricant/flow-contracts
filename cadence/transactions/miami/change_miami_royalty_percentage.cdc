import MiamiNFT from "../../contracts/MiamiNFT.cdc"

transaction(newRoyaltyPercentage: UFix64) {

    let adminRef: &MiamiNFT.Admin

    prepare(acct: AuthAccount) {

        self.adminRef = acct.borrow<&MiamiNFT.Admin>(from: MiamiNFT.AdminStoragePath)
            ?? panic("No admin resource in storage")

    }

    execute {

        self.adminRef.changeRoyaltyPercentage(newRoyaltyPercentage: newRoyaltyPercentage)

    }
}