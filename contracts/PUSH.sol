interface IPUSHCommInterface {
    function sendNotification(address _channel, address _recipient, bytes calldata _identity) external;
}


IPUSHCommInterface(0x2b9bE9259a4F5Ba6344c1b1c07911539642a2D33).sendNotification(
    0xd513baa0152D8630e5989eCf4FD411dAC6061B84,
    _recipient,
    bytes(
        string(
            abi.encodePacked(
                "0", 
                "+", 
                "3", 
                "+", 
                "New Vote", 
                "+", 
                "A community Member voted for you! " 
            )
        )
    )
);

IPUSHCommInterface(0x2b9bE9259a4F5Ba6344c1b1c07911539642a2D33).sendNotification(
    0xd513baa0152D8630e5989eCf4FD411dAC6061B84,
    _recipient,
    bytes(
        string(
            abi.encodePacked(
                "0", 
                "+", 
                "3", 
                "+", 
                "New Vote", 
                "+", 
                "A community Member voted against you :( ! " 
            )
        )
    )
);