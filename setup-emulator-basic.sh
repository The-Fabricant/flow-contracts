flow project deploy

# Sets up state for contracts
# Mints 1 flowfest
flow transactions send ./cadence/transactions/initialize_account_mysterybox.cdc --signer emulator-account 
flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/create_fabricant_datas.cdc --signer emulator-account "name" "description" "mainImage" 
flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/mint_fabricant.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 "1" 0xf8d6e0586b0a20c7
flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/mint_fabricant.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 "2" 0xf8d6e0586b0a20c7

flow transactions send ./cadence/transactions/initialize_account_diesel.cdc --signer emulator-account 
flow transactions send ./cadence/transactions/diesel/create_diesel_data.cdc --signer emulator-account "name" "description" "mainVideo"
flow transactions send ./cadence/transactions/diesel/mint_diesel.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 1 0xf8d6e0586b0a20c7 

flow transactions send ./cadence/transactions/initialize_account_miami.cdc --signer emulator-account 
flow transactions send ./cadence/transactions/miami/create_miami_data.cdc --signer emulator-account "name" "description" "mainVideo" "season" 0xf8d6e0586b0a20c7
flow transactions send ./cadence/transactions/miami/create_miami_data.cdc --signer emulator-account "name" "description" "mainVideo" "season" 0xf8d6e0586b0a20c7
flow transactions send ./cadence/transactions/miami/mint_miami.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 1 0xf8d6e0586b0a20c7 
flow transactions send ./cadence/transactions/miami/mint_miami.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 2 0xf8d6e0586b0a20c7 

flow scripts execute ./cadence/scripts/thefabricantmysterybox_ff1/get_fabricant_collection_length.cdc --arg Address:0xf8d6e0586b0a20c7
flow scripts execute ./cadence/scripts/diesel/get_diesel_collection_length.cdc --arg Address:0xf8d6e0586b0a20c7
flow scripts execute ./cadence/scripts/miami/get_miami_collection_length.cdc --arg Address:0xf8d6e0586b0a20c7