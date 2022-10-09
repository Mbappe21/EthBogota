// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

import {ISuperfluid} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";
import "./ContributionPool.sol";

contract ContributionPoolFactory {

    address private sfHost = 0x22ff293e14F1EC3A09B137e9e06084AFd63adDF9;

    function deploy(address addr1, address addr2, address addr3, address addr4, address addr5, address _NFT, ISuperfluid host) public returns (address) {
        ContributionPool contributionPool = new ContributionPool(addr1, addr2, addr3, addr4, addr5, _NFT, ISuperfluid(sfHost));
        return address(contributionPool);
    }
}