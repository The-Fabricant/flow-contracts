#THEFABRICANTMYSTERYBOX_FF1
flow project deploy

flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/create_fabricant_datas.cdc --signer emulator-account
#flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/mint_fabricant.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 "1" 0xf8d6e0586b0a20c7
#flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/mint_fabricant.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 "2" 0xf8d6e0586b0a20c7
#flow transactions send ./cadence/transactions/flowfestaccess/give_access.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7
