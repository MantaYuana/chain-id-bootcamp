// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {DidRegistry} from "../src/DidRegistry.sol";

contract ModifyDidScript is Script {

    function run() external {
        vm.startBroadcast();

        DidRegistry registry = DidRegistry(0xf3Ec3a705d1125D073E117bb2619e7C7c39f5E1e);
        registry.modifyDid(0, "new metadata modify");

        vm.stopBroadcast();
    }
}