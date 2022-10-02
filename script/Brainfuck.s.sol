// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Brainfuck.sol";

contract BrainfuckScript is Script {
    Brainfuck public bf;

    function setUp() public {
        bf = new Brainfuck();
    }

    function run() public {
        vm.broadcast();
        uint8 a = 4;
        uint8 b = 5;
        uint256 mem_size = 2;
        uint256 output_size = 1;
        bytes memory input = abi.encodePacked(a, b);
        bytes memory result = bf.execute(",>,<[->+<]>.", input, mem_size, output_size);
        console.logBytes(result);
    }
}
