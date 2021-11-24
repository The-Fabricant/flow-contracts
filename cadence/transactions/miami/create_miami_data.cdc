import MiamiNFT from "../../contracts/MiamiNFT.cdc"
transaction(name: String, description: String, mainVideo: String, season: String, creator: Address) {

    let adminRef: &MiamiNFT.Admin
    let currMiamiDataID: UInt32

    prepare(acct: AuthAccount) {

        self.currMiamiDataID = MiamiNFT.nextMiamiDataID;
        self.adminRef = acct.borrow<&MiamiNFT.Admin>(from: MiamiNFT.AdminStoragePath)
            ?? panic("No admin resource in storage")
    }

    execute {
        // Create a dieselData with specified variables
        self.adminRef.createMiamiData(name: name, description: description, mainVideo: mainVideo, season: season, creator: creator)
    }

}