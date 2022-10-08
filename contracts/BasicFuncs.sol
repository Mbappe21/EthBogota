// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

contract BasicFuncs{

    address owner;
    address recipient2;
    address recipient3;
    address recipient4;
    uint256 challengeId;

    mapping(uint=>mapping(address=>bool)) hasChallenged;
    mapping(uint=>Challenge) findChallenge;

    event NewChallenge(uint256 challengeId, address recipient);

    struct Challenge{
        uint256 challengeId;
        address recipient;
        uint256 nOfChallengers;
        uint256 time;
    }

    constructor(address addr2, address addr3, address addr4){
        owner=msg.sender;
        recipient2=addr2;
        recipient3=addr3;
        recipient4=addr4;
    }

    function createNewChallenge(address recipient) public onlyRecipients{
        challengeId++;
        Challenge memory _challenge;
       _challenge=Challenge(challengeId, recipient, 1, block.timestamp+ 3 /* Equivalent of 3 days*/);
       hasChallenged[challengeId][msg.sender]=true;

       emit NewChallenge(challengeId, recipient);
    }

    function challengeRecipient(uint _challengeId) external onlyRecipients{
        require(hasChallenged[_challengeId][msg.sender]==false, "Sorry you already challenged");
        require(findChallenge[_challengeId].time>block.timestamp, "Sorry the Request has expired");

        hasChallenged[_challengeId][msg.sender]=true;
       
        findChallenge[_challengeId].nOfChallengers++;

        if(findChallenge[_challengeId].nOfChallengers>2){
            //Update Stream
        }

    }

    function deposit() public payable{ }

    modifier onlyRecipients() {
        require(msg.sender==owner ||msg.sender==recipient2||msg.sender==recipient3||msg.sender==recipient4);
        _;
    }
















}