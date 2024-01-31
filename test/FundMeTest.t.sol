//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {

    FundMe fundMe;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
        //5e18 ==> 5 * 10 ** 18
    }

    function testOwnerIsMessageSender() public {
        assertEq(fundMe.i_owner(), msg.sender);
        //we don't use msg.sender on the right, because message.sender is our account
        //and the deployer of FundMe was the Test Contract, not actually msg.sender (me)
    }

    function testPriceFeedVersionIsAccurate() public {
        uint256 v = fundMe.getVersion();
        assertEq(v, 4);
    }

}