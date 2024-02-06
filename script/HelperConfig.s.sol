//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "../lib/forge-std/src";


contract HelperConfig {

    struct NetworkConfig {
        address priceFeed;
    }
    
    function getSepoliaEthConfig() {
        NetworkConfig sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
    }


}
