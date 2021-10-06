import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"
transaction() {

    let adminRef: &TheFabricantMysteryBox_FF1.Admin
    let currFabricantDataID: UInt32

    prepare(acct: AuthAccount) {

        self.currFabricantDataID = TheFabricantMysteryBox_FF1.nextFabricantDataID;
        self.adminRef = acct.borrow<&TheFabricantMysteryBox_FF1.Admin>(from: TheFabricantMysteryBox_FF1.AdminStoragePath)
            ?? panic("No admin resource in storage")
    }

    execute {
        let mainImage1: String = "hi"
        let mainImage2: String = "hi2"
        // Create a fabricantData with specified variables
        self.adminRef.createFabricantData(mainImage: mainImage1)
        self.adminRef.createFabricantData(mainImage: mainImage2)
    }

}