// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script, console2} from "forge-std/Script.sol";
import {EnsAuctions} from "../src/EnsAuctions.sol";
import {Mock721} from "../test/lib/Mock721.sol";

contract DeployAnvilScript is Script {

    EnsAuctions ensAuctions;
    Mock721 mockENS;

    function run() public {
        vm.startBroadcast();

        address user = vm.envAddress("ADDRESS_USER_1");

        mockENS = new Mock721();
        mockENS.mint(user, 20);

        ensAuctions = new EnsAuctions(address(this), address(mockENS));

        // uint256[] memory tokenIds = new uint256[](1);
        // tokenIds[0] = 0;
        // ensAuctions.startAuction(tokenIds, 100, 500);

        console2.log("MockENS contract: ", address(mockENS));
        console2.log("EnsAuctions contract: ", address(ensAuctions));

        vm.stopBroadcast();
    }
}
