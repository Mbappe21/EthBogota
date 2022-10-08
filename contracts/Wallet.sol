// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@account-abstraction/contracts/core/BaseWallet.sol";

// SenderCreator.sol call the createSender function
// What is initCode? The init code contains 20 bytes of factory address, followed by calldata

contract Wallet is BaseWallet {

    address public _entryPoint = 0x602aB3881Ff3Fa8dA60a8F44Cf633e91bA1FdB69;

    /**
     * return the wallet nonce.
     * subclass should return a nonce value that is used both by _validateAndUpdateNonce, and by the external provider (to read the current nonce)
     */
    function nonce() public view override returns (uint256) {

    }

    /**
     * return the entryPoint used by this wallet.
     * subclass should return the current entryPoint used by this wallet.
     */
    function entryPoint() public view override returns (IEntryPoint) {

    }

    /**
     * validate the signature is valid for this message.
     * @param userOp validate the userOp.signature field
     * @param requestId convenient field: the hash of the request, to check the signature against
     *          (also hashes the entrypoint and chain-id)
     * @param aggregator the current aggregator. can be ignored by wallets that don't use aggregators
     */
    function _validateSignature(UserOperation calldata userOp, bytes32 requestId, address aggregator) internal override view {

    }

    /**
     * validate the current nonce matches the UserOperation nonce.
     * then it should update the wallet's state to prevent replay of this UserOperation.
     * called only if initCode is empty (since "nonce" field is used as "salt" on wallet creation)
     * @param userOp the op to validate.
     */
    function _validateAndUpdateNonce(UserOperation calldata userOp) internal override {

    }

    /**
     * update the current entrypoint.
     * subclass should override and update current entrypoint
     */
    function _updateEntryPoint(address) internal override {
        
    }
}
