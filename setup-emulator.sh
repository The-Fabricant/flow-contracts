#FULL SEQUENCE OF TRANSACTIONS WHEN CONTRACTS ARE DEPLOYED

#deploy contracts
flow project deploy

flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/create_fabricant_datas.cdc --signer emulator-account

# # mint ff nft
# flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/mint_fabricant.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 1 0xf8d6e0586b0a20c7
# flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/mint_fabricant.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 2 0xf8d6e0586b0a20c7

flow transactions send ./cadence/transactions/diesel/create_diesel_data.cdc --signer emulator-account "THE PROTOTYPE" "Diesel's PROTOTYPE is a first, an original, an archetype. Its unique and distinctive design is part of an ever-evolving series of concepts. It pushes the limits of athletic footwear design, breaking aesthetic and technical conventions with every component and every angle. For the launch of the new Diesel's hero sneaker designed by Glenn Martens, The Fabricant crafted a unique video NFT where vintage Diesel imagery is juxtaposed with the new, forward-facing design of the shoe. The result is a powerful coming together of past, present, and future." "https://leela.mypinata.cloud/ipfs/QmRExiftX6q5VMRt1MsM4ecKTG5nYVq6a7EnPTGLg4zfP6" 

# # mint diesel
# flow transactions send ./cadence/transactions/diesel/mint_diesel.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 1 0xf8d6e0586b0a20c7

flow transactions send ./cadence/transactions/miami/create_miami_data.cdc --signer emulator-account "Transparency Hat" "Fighting for transparency in this newly emerging market, this hat will bring you visibility and invisibility at the same time." "https://leela.mypinata.cloud/ipfs/QmZddtZhgpoGcDX8PjtQgS8La7xHxDKWorWRtSK8JP4MUQ/TFS1_MIAMINFT_TRANSPARENCYHAT.mp4" "1" 0xf8d6e0586b0a20c7
flow transactions send ./cadence/transactions/miami/create_miami_data.cdc --signer emulator-account "Ape Shades" "Inspired by the famous BAYC, you can now look as bored as them." "https://leela.mypinata.cloud/ipfs/QmZddtZhgpoGcDX8PjtQgS8La7xHxDKWorWRtSK8JP4MUQ/TFS1_MIAMINFT_APESHADES_SHARECARD.mp4" "1" 0xf8d6e0586b0a20c7

# # mint miami
# flow transactions send ./cadence/transactions/miami/mint_miami.cdc --signer emulator-account --gas-limit 9999 0xf8d6e0586b0a20c7 1 0xf8d6e0586b0a20c7