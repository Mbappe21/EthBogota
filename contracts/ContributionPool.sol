// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {ISuperfluid, ISuperToken, ISuperApp} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";
import {ISuperfluidToken} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluidToken.sol";
import {IConstantFlowAgreementV1} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/agreements/IConstantFlowAgreementV1.sol";
import {CFAv1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/CFAv1Library.sol";


contract ContributionPool {
    address public communityNFTContract;

    mapping(address=>mapping(address=>bool)) public hasVotedForRecipient;
    mapping(address=>Recipient) public findRecipient;

    struct Recipient{
        address recipient;
        uint votesFor;
        uint votesAgainst;
    }

    CFAv1Library.InitData public cfaV1;

    constructor(address addr1, address addr2, address addr3, address addr4, address addr5, address _NFT, ISuperfluid host) payable{
        Recipient memory _recipient;

        _recipient=Recipient(addr1, 0, 0);
        findRecipient[addr1]=_recipient;
        _recipient=Recipient(addr2, 0, 0);
        findRecipient[addr2]=_recipient;
        _recipient=Recipient(addr3, 0, 0);
        findRecipient[addr3]=_recipient;
        _recipient=Recipient(addr4, 0, 0);
        findRecipient[addr4]=_recipient;
        _recipient=Recipient(addr5, 0, 0);
        findRecipient[addr5]=_recipient;


        communityNFTContract=_NFT;

        cfaV1 = CFAv1Library.InitData(
            host,
            IConstantFlowAgreementV1(
                address(
                    host.getAgreementClass(
                        keccak256("org.superfluid-finance.agreements.ConstantFlowAgreement.v1")
                    )
                )
            )
        );

        // approving
        address underlyingTokenAddress = 0x88271d333C72e51516B67f5567c728E702b3eeE8;
        address superTokenAddress = 0xF2d68898557cCb2Cf4C10c3Ef2B034b2a69DAD00;
        uint256 amountToWrap = IERC20(underlyingTokenAddress).balanceOf(address(this));

        IERC20(underlyingTokenAddress).approve(superTokenAddress, amountToWrap);

        // wrapping
        ISuperToken(superTokenAddress).upgrade(amountToWrap);
    }

    function voteForRecipient(address _recipient) external {
        require( hasVotedForRecipient[msg.sender][_recipient]==false, "You have already voted this Recipient");

        hasVotedForRecipient[msg.sender][_recipient]=true;

        findRecipient[_recipient].votesFor++;

        if(findRecipient[_recipient].votesFor>2){
        }

    }

    function voteAgainstRecipient(address _recipient) external {
        require( hasVotedForRecipient[msg.sender][_recipient]==false, "You have already voted this Recipient");

        hasVotedForRecipient[msg.sender][_recipient]=true;

        findRecipient[_recipient].votesAgainst++;

        if(findRecipient[_recipient].votesAgainst>2){
        }
    }

    function wrap() external {
        // approving
        address underlyingTokenAddress = 0x88271d333C72e51516B67f5567c728E702b3eeE8;
        address superTokenAddress = 0xF2d68898557cCb2Cf4C10c3Ef2B034b2a69DAD00;
        uint256 amountToWrap = IERC20(underlyingTokenAddress).balanceOf(address(this));

        IERC20(underlyingTokenAddress).approve(superTokenAddress, amountToWrap);

        // wrapping
        ISuperToken(superTokenAddress).upgrade(amountToWrap);
    }

    // function createFlowIntoContract(ISuperfluidToken token, int96 flowRate) external {
    //     // if (!accountList[msg.sender] && msg.sender != owner) revert Unauthorized();
    //     cfaV1.createFlowByOperator(msg.sender, address(this), token, flowRate);
    // }

    // function updateFlowIntoContract(ISuperfluidToken token, int96 flowRate) internal {
    //     cfaV1.updateFlowByOperator(msg.sender, address(this), token, flowRate);
    // }

    function deposit() public payable{ }

    // modifier onlyCommunityMember() {
    //     (bool success,) =communityNFTContract.call{ gas: 5000}(
    //     abi.encodeWithSignature("balanceOf(address)", msg.sender));
    //     require(success, "You do not hold the Community NFT");
    //     _;
    // }
}