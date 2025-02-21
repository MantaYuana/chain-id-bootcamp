// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {DidRegistry} from "../src/DidRegistry.sol";

contract CreateDidScript is Script {

    function run() external {
        vm.startBroadcast();

        DidRegistry registry = DidRegistry(0xf3Ec3a705d1125D073E117bb2619e7C7c39f5E1e); // input your smart contract address
        registry.createDID(DidRegistry.DidType.Verifier, "test metadata");

        vm.stopBroadcast();
    }
}
