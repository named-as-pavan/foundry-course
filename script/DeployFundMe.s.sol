// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script, console2 as console} from "../lib/forge-std/src/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";


contract DeployFundMe is Script {
    function run() external returns (FundMe) {

        HelperConfig helperConfig = new HelperConfig();

       address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }


}