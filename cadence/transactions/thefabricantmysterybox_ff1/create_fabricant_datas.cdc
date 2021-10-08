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
        let mainImage1: String = "https://leela.mypinata.cloud/ipfs/QmSuQtHY4Rn2beo63M6jnpv6kDGvs48gnVEiBtcfDLYZxz/TheFabricant_Pluriform_DowntoEarth.png"
        let mainImage2: String = "https://leela.mypinata.cloud/ipfs/QmSuQtHY4Rn2beo63M6jnpv6kDGvs48gnVEiBtcfDLYZxz/TheFabricant_Pluriform_SlumpySnow.png"
        // Create a fabricantData with specified variables
        self.adminRef.createFabricantData(mainImage: mainImage1)
        self.adminRef.createFabricantData(mainImage: mainImage2)
    }

}