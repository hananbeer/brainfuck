// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Brainfuck {
    function execute(bytes calldata code, bytes calldata input, uint256 mem_size, uint256 output_size) public returns (bytes memory) {
        uint256 dp = 0; // data pointer
        uint256 ip = 0; // input pointer
        uint256 op = 0; // output pointer
        uint256 pc = 0; // program counter
        uint256 jc = 0; // jump counter
        bytes memory mem = new bytes(mem_size);
        bytes memory output = new bytes(output_size);
        while (pc < code.length) {
            bytes1 opcode = code[pc];
            if (opcode == '<') {
                dp--;
            } else if (opcode == '>') {
                dp++;
            } else if (opcode == '-') {
                mem[dp] = bytes1(uint8(mem[dp]) - 1);
            } else if (opcode == '+') {
                mem[dp] = bytes1(uint8(mem[dp]) + 1);
            } else if (opcode == '.') {
                output[op++] = mem[dp];
            } else if (opcode == ',') {
                mem[dp] = input[ip++];
            } else if (opcode == '[') {
                if (mem[dp] == 0) {
                    jc = 1;
                    while (jc > 0) {
                        pc++;
                        if (code[pc] == '[')
                            jc++;
                        else if (code[pc] == ']')
                            jc--;
                    }
                }
            } else if (opcode == ']') {
                if (mem[dp] != 0) {
                    jc = 1;
                    while (jc > 0) {
                        pc--;
                        if (code[pc] == '[')
                            jc--;
                        else if (code[pc] == ']')
                            jc++;
                    }
                }
            } else {
                // TODO: what do?
            }
            
            pc++;
        }

        return output;
    }
}
