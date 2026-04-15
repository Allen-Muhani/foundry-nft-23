// SPDX_License-Identifier: MIT

pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFT.sol";

contract BasicNFTTest is Test {
    BasicNFT basicNFT;
    DeployBasicNFT deployBasicNFT;
    address public USER = makeAddr("user");

    string public constant PUG =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployBasicNFT = new DeployBasicNFT();
        basicNFT = deployBasicNFT.deployBasicNFT();
    }

    function testNameIsCorrect() public {
        assertEq(basicNFT.name(), "Dogie");
    }

    function testCanMintAdHaveABalance() public {
        vm.prank(USER);
        basicNFT.mintNFT(PUG);
        assertEq(basicNFT.balanceOf(USER), 1);
        assertEq(basicNFT.tokenURI(0), PUG);
    }
}
