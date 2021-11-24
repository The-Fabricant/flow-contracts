import MiamiNFT from "../../contracts/MiamiNFT.cdc"

transaction(miamiDataID: UInt32) {

    let adminRef: &MiamiNFT.Admin

    prepare(acct: AuthAccount) {

        self.adminRef = acct.borrow<&MiamiNFT.Admin>(from: MiamiNFT.AdminStoragePath)
            ?? panic("No admin resource in storage")

    }

    execute {

        self.adminRef.retireMiamiData(miamiDataID: miamiDataID)

    }
}