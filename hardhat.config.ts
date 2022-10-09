import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import * as dotenv from "dotenv";
dotenv.config();

const config: HardhatUserConfig = {
    solidity: "0.8.17",
    networks: {
        goerli: {
            url: process.env.GOERLI_URL,
            accounts: [process.env.GOERLI_PRIVATE_KEY || ""],
        },
    },
};

export default config;
