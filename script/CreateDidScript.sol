// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {DidRegistry} from "../src/DidRegistry.sol";

contract CreateDidScript is Script {

    function run() external {
        vm.startBroadcast();

        DidRegistry registry = DidRegistry(0xe8eE25eaabb18cEB79d5225E50fA117bAaD56dA7); // input your smart contract address
        registry.createDID("https://ipfs.io/ipfs/bafkreigxnhhmoeyg5vjfcrlr4yluostuxuivpehn77i5uzt4uc4e5zdp2i");

        vm.stopBroadcast();
    }
}
