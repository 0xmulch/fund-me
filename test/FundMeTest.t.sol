//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {

    FundMe fundMe;

    function setUp() external {
        fundMe = new FundMe();
    }

    function testMinimumDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
        //5e18 ==> 5 * 10 ** 18
    }

    function testOwnerIsMessageSender() public {
        assertEq(fundMe.i_owner(), address(this));
        //we don't use msg.sender on the right, because message.sender is our account
        //and the deployer of FundMe was the Test Contract, not actually msg.sender (me)
    }

}