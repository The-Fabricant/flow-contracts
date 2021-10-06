import TheFabricantMysteryBox_FF1 from "../../contracts/TheFabricantMysteryBox_FF1.cdc"

transaction(fabricantDataID: UInt32) {

    let adminRef: &TheFabricantMysteryBox_FF1.Admin

    prepare(acct: AuthAccount) {

        self.adminRef = acct.borrow<&TheFabricantMysteryBox_FF1.Admin>(from: TheFabricantMysteryBox_FF1.AdminStoragePath)
            ?? panic("No admin resource in storage")

    }

    execute {

        self.adminRef.retireFabricantData(fabricantDataID: fabricantDataID)

    }
}