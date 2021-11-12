import DieselNFT from "../../contracts/DieselNFT.cdc"
transaction(name: String, description: String, mainVideo: String) {

    let adminRef: &DieselNFT.Admin
    let currDieselDataID: UInt32

    prepare(acct: AuthAccount) {

        self.currDieselDataID = DieselNFT.nextDieselDataID;
        self.adminRef = acct.borrow<&DieselNFT.Admin>(from: DieselNFT.AdminStoragePath)
            ?? panic("No admin resource in storage")
    }

    execute {
        // Create a dieselData with specified variables
        self.adminRef.createDieselData(name: name, description: description, mainVideo: mainVideo)
    }

}