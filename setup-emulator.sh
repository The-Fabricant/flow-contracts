#setup state for 3 unique nfts
flow project deploy

# Sets up state for contracts
# Create flowfest data and mint
flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/create_fabricant_datas.cdc --signer emulator-account
flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/mint_fabricant.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 "1" 0xf8d6e0586b0a20c7
flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/mint_fabricant.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 "2" 0xf8d6e0586b0a20c7

# Create diesel data and batch mint
flow transactions send ./cadence/transactions/initialize_account_miami.cdc --signer emulator-account 
flow transactions send ./cadence/transactions/diesel/create_diesel_data.cdc --signer emulator-account "THE PROTOTYPE" "Diesel's PROTOTYPE is a first, an original, an archetype. Its unique and distinctive design is part of an ever-evolving series of concepts. It pushes the limits of athletic footwear design, breaking aesthetic and technical conventions with every component and every angle. For the launch of the new Diesel's hero sneaker designed by Glenn Martens, The Fabricant crafted a unique video NFT where vintage Diesel imagery is juxtaposed with the new, forward-facing design of the shoe. The result is a powerful coming together of past, present, and future." "https://leela.mypinata.cloud/ipfs/QmRExiftX6q5VMRt1MsM4ecKTG5nYVq6a7EnPTGLg4zfP6"
flow transactions send ./cadence/transactions/diesel/batch_mint_diesel.cdc --signer emulator-account --gas-limit 9999 --arg Address:0xf8d6e0586b0a20c7 --arg UInt32:1 --arg Address:0xf8d6e0586b0a20c7 --arg UInt64:10

# Create miami data and batch mint
flow transactions send ./cadence/transactions/initialize_account_miami.cdc --signer emulator-account 
flow transactions send ./cadence/transactions/miami/create_miami_data.cdc --signer emulator-account flow transactions send ./cadence/transactions/miami/create_miami_data.cdc --network testnet --signer testnet-account "Transparency Hat" "Fighting for transparency in this newly emerging market, this hat will bring you visibility and invisibility at the same time." "https://leela.mypinata.cloud/ipfs/QmRExiftX6q5VMRt1MsM4ecKTG5nYVq6a7EnPTGLg4zfP6" "1" 0x716db717f9240d8a
