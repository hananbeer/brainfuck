# Brainfuck On-Chain

## Why?

Because it's turing complete.

## Examples

A program that reads 2 numbers, adds them and outputs the result.

In solidity this would be written as:

```js
function add(uint256 a, uint256 b) returns (uint256) {
  return a + b;
}
```

Look how long this is. Unacceptable!

The same program written in [brainfuck](https://en.wikipedia.org/wiki/Brainfuck) would be:

```brainfuck
,>,<[->+<]>.
```

## Usage

```js
uint8 a = 4;
uint8 b = 5;
uint256 mem_size = 2;
uint256 output_size = 1;
bytes memory input = abi.encodePacked(a, b);
bytes memory result = bf.execute(",>,<[->+<]>.", input, mem_size, output_size);
console.logBytes(result);
```

## Testing

```
$ forge script ./script/Brainfuck.s.sol

Script ran successfully.
Gas used: 56108

== Logs ==
  0x09
```
