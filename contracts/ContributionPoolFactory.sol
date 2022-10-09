// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

import {ISuperfluid} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";
import "./ContributionPool.sol";

contract ContributionPoolFactory {

    address private sfHost = 0x22ff293e14F1EC3A09B137e9e06084AFd63adDF9;

    address public pool;

    function deploy(address addr1, address addr2, address addr3, address addr4, address addr5, address _NFT) public payable {
        ContributionPool contributionPool = new ContributionPool{value: msg.value}(addr1, addr2, addr3, addr4, addr5, _NFT, ISuperfluid(sfHost));
        pool = address(contributionPool);
    }

    function getPoolAddress() public view returns (address) {
        return pool;
    }
}