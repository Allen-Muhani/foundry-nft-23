// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { BasicNFT } from "../src/BasicNFT.sol";
import {Script} from "forge-std/Script.sol";

contract DeployBasicNFT is Script {
    function deployBasicNFT() public returns (BasicNFT) {
        vm.startBroadcast();
        BasicNFT basicNFT = new BasicNFT();
        vm.stopBroadcast();
        return basicNFT;
    }
}