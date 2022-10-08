import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as dotenv from "dotenv";
dotenv.config();

const config: HardhatUserConfig = {
    solidity: "0.8.17",
    networks: {
        arbitrum_goerli: {
            url: process.env.ARBITRUM_GOERLI_URL,
            accounts: [process.env.ARBITRUM_GOERLI_PRIVATE_KEY || ""],
        },
    },
};

export default config;
