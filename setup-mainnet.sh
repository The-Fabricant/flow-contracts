#FULL SEQUENCE OF TRANSACTIONS WHEN CONTRACTS ARE DEPLOYED

flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/create_fabricant_datas.cdc --network mainnet --signer mainnet-account

# # mint ff nft
# flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/mint_fabricant.cdc --network mainnet --signer mainnet-account --gas-limit 9999 0x2a37a78609bba037 1 0x2a37a78609bba037
# flow transactions send ./cadence/transactions/thefabricantmysterybox_ff1/mint_fabricant.cdc --network mainnet --signer mainnet-account --gas-limit 9999 0x2a37a78609bba037 2 0x2a37a78609bba037

flow transactions send ./cadence/transactions/diesel/create_diesel_data.cdc --network mainnet --signer mainnet-account "THE PROTOTYPE" "Diesel's PROTOTYPE is a first, an original, an archetype. Its unique and distinctive design is part of an ever-evolving series of concepts. It pushes the limits of athletic footwear design, breaking aesthetic and technical conventions with every component and every angle. For the launch of the new Diesel's hero sneaker designed by Glenn Martens, The Fabricant crafted a unique video NFT where vintage Diesel imagery is juxtaposed with the new, forward-facing design of the shoe. The result is a powerful coming together of past, present, and future." "https://leela.mypinata.cloud/ipfs/QmRExiftX6q5VMRt1MsM4ecKTG5nYVq6a7EnPTGLg4zfP6" 

# # mint diesel
# flow transactions send ./cadence/transactions/diesel/mint_diesel.cdc --network mainnet --signer mainnet-account --gas-limit 9999 0x2a37a78609bba037 1 0x2a37a78609bba037

flow transactions send ./cadence/transactions/miami/create_miami_data.cdc --network mainnet --signer mainnet-account "Transparency Hat" "Fighting for transparency in this newly emerging market, this hat will bring you visibility and invisibility at the same time." "https://leela.mypinata.cloud/ipfs/QmZddtZhgpoGcDX8PjtQgS8La7xHxDKWorWRtSK8JP4MUQ/TFS1_MIAMINFT_TRANSPARENCYHAT.mp4" "1" 0xf7094fee352c06b4
flow transactions send ./cadence/transactions/miami/create_miami_data.cdc --network mainnet --signer mainnet-account "Ape Shades" "Inspired by the famous BAYC, you can now look as bored as them." "https://leela.mypinata.cloud/ipfs/QmZddtZhgpoGcDX8PjtQgS8La7xHxDKWorWRtSK8JP4MUQ/TFS1_MIAMINFT_APESHADES_SHARECARD.mp4" "1" 0xf7094fee352c06b4

# # mint miami
# flow transactions send ./cadence/transactions/miami/mint_miami.cdc --network mainnet --signer mainnet-account --gas-limit 9999 0x2a37a78609bba037 1 0x2a37a78609bba037

