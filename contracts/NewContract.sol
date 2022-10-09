// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

contract NewContract{
    address public communityNFTContract;

    mapping(address=>mapping(address=>bool)) public hasVotedForRecipient;
    mapping(address=>Recipient) public findRecipient;

    struct Recipient{
        address recipient;
        uint votesFor;
        uint votesAgainst;
    }

    constructor(address addr1, address addr2, address addr3, address addr4, address addr5, address _NFT) payable{
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

    }

    function voteForRecipient(address _recipient) external onlyCommunityMember{
        require( hasVotedForRecipient[msg.sender][_recipient]==false, "You have already voted this Recipient");

        hasVotedForRecipient[msg.sender][_recipient]=true;

        findRecipient[_recipient].votesFor++;

        if(findRecipient[_recipient].votesFor>2){
            //Update Stream
        }

    }

    function voteAgainstRecipient(address _recipient) external onlyCommunityMember{
        require( hasVotedForRecipient[msg.sender][_recipient]==false, "You have already voted this Recipient");

        hasVotedForRecipient[msg.sender][_recipient]=true;

        findRecipient[_recipient].votesAgainst++;

        if(findRecipient[_recipient].votesAgainst>2){
            //Update Stream
        }

    }

    function deposit() public payable{ }

    modifier onlyCommunityMember() {
        (bool success,) =communityNFTContract.call{ gas: 5000}(
        abi.encodeWithSignature("balanceOf(address)", msg.sender));
        require(success, "You do not hold the Community NFT");
        _;
    }


















}