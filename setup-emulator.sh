#THEFABRICANTMYSTERYBOX_FF1
flow project deploy

# Sets up state for contracts
# Mints an item to account's collection
flow transactions send ./cadence/transactions/initialize_account_miami.cdc --signer emulator-account 
flow transactions send ./cadence/transactions/diesel/create_diesel_data.cdc --signer emulator-account "THE PROTOTYPE" "Diesel's PROTOTYPE is a first, an original, an archetype. Its unique and distinctive design is part of an ever-evolving series of concepts. It pushes the limits of athletic footwear design, breaking aesthetic and technical conventions with every component and every angle. For the launch of the new Diesel's hero sneaker designed by Glenn Martens, The Fabricant crafted a unique video NFT where vintage Diesel imagery is juxtaposed with the new, forward-facing design of the shoe. The result is a powerful coming together of past, present, and future." "https://leela.mypinata.cloud/ipfs/QmRExiftX6q5VMRt1MsM4ecKTG5nYVq6a7EnPTGLg4zfP6"
flow transactions send ./cadence/transactions/diesel/batch_mint_diesel.cdc --signer emulator-account --gas-limit 9999 --arg Address:0xf8d6e0586b0a20c7 --arg UInt32:1 --arg Address:0xf8d6e0586b0a20c7 --arg UInt64:10

# flow transactions send ./cadence/transactions/initialize_account_miami.cdc --signer emulator-account 
# flow transactions send ./cadence/transactions/miami/create_miami_data.cdc --signer emulator-account "name" "description" "mainVideo" "season" 0xf8d6e0586b0a20c7
# flow transactions send ./cadence/transactions/miami/batch_mint_miami.cdc --signer emulator-account --gas-limit 9999 --arg Address:0xf8d6e0586b0a20c7 --arg UInt32:1 --arg Address:0xf8d6e0586b0a20c7 --arg UInt64:150
