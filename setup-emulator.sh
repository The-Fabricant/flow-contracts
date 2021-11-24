#THEFABRICANTMYSTERYBOX_FF1
flow project deploy

# Sets up state for contracts
# Mints an item to account's collection
#flow transactions send ./cadence/transactions/initialize_account_diesel.cdc --signer emulator-account 
#flow transactions send ./cadence/transactions/diesel/create_diesel_data.cdc --signer emulator-account "name" "description" "mainVideo" 
#flow transactions send ./cadence/transactions/diesel/batch_mint_diesel.cdc --signer emulator-account --gas-limit 9999 --arg Address:0xf8d6e0586b0a20c7 --arg UInt32:1 --arg Address:0xf8d6e0586b0a20c7 --arg UInt64:150

flow transactions send ./cadence/transactions/initialize_account_miami.cdc --signer emulator-account 
flow transactions send ./cadence/transactions/miami/create_miami_data.cdc --signer emulator-account "name" "description" "mainVideo" "season" 0xf8d6e0586b0a20c7
flow transactions send ./cadence/transactions/miami/batch_mint_miami.cdc --signer emulator-account --gas-limit 9999 --arg Address:0xf8d6e0586b0a20c7 --arg UInt32:1 --arg Address:0xf8d6e0586b0a20c7 --arg UInt64:150
