# Example Fetching Chainlink Price Feeds on Neon Labs Devnet using Foundry

This directory contains all the files necessary to test Chainlink price feeds on Neon Labs Devnet.

## Prerequisites

To use this project, Rust and Foundry must be installed on the machine.

### Rust installation

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Foundry installation

```sh
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

## Cloning repository

Run command

```sh
git clone https://github.com/sukanyaparashar/chainlink-price-feeds-foundry.git
```

## Setup Neon account (using Metamask)

To create new account:

1. Setup your Metamask wallet to work with Neon devnet:

   - Connect your metamask wallet to Neon Devnet using these settings:
     - Network Name: Neon Devnet
     - New RPC URL: https://devnet.neonevm.org
     - Chain ID: 245022926
     - Currency Symbol (optional): NEON

2. Create a new account in Metamask
3. Airdrop at most 100 NEONs to just created **account #1** [from here](https://neonfaucet.org/)
4. Copy your Metamask account's private key (Account Details >> Export Private Key) and insert them into **.env**
   **NOTE!** Add **0x** prefix at the beginning

## Set up .env file

Create a .env file in the root project folder and add these lines -

```sh
RPC_URL=https://devnet.neonevm.org
PRIVATE_KEY=<YOUR_PRIVATE_KEY>
```

Then run this -

```sh
source .env
```

## Building contracts and running tests on devnet

1. Compiling contract

```sh
forge build
```

This command will compile all the contracts. After successfully running this step you should get console output similar to:

```sh
[⠰] Compiling...
[⠊] Compiling 2 files with 0.8.21
[⠒] Solc 0.8.21 finished in 585.44ms
Compiler run successful!
```

2. Running tests

```sh
forge test --rpc-url $RPC_URL -vvvvv
```

This command runs the test file ./test/MyToken.t.sol. After successfully running this step you should get console output similar to:

```sh
[⠰] Compiling...
No files changed, compilation skipped

Running 4 tests for test/ChainlinkTest.t.sol:ChainlinkTestTest
[FAIL. Reason: toUint8_outOfBounds] testNeonSol1() (gas: 15104)
Traces:
  [15104] ChainlinkTestTest::testNeonSol1()
    ├─ [12148] 0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d::latestRoundData() [staticcall]
    │   ├─ [6928] 0xb4820dC05E23d26FfE290Ce82DA94c894903C034::getLatestRound(54711267442576681404593257684989943639952621180004110670920145519824699960726 [5.471e76]) [delegatecall]
    │   │   ├─ [0] 0xff00000000000000000000000000000000000002::2b3c8322(78f57ae1195e8c497a8be054ad52adf4c8976f8436732309e22af7067724ad96000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000c0) [staticcall]
    │   │   │   └─ ← ()
    │   │   ├─ [0] 0xff00000000000000000000000000000000000002::43ca5161(78f57ae1195e8c497a8be054ad52adf4c8976f8436732309e22af7067724ad96000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000c0) [staticcall]
    │   │   │   └─ ← ()
    │   │   └─ ← "toUint8_outOfBounds"
    │   └─ ← "toUint8_outOfBounds"
    └─ ← "toUint8_outOfBounds"

[PASS] testNeonSol2() (gas: 7465)
Logs:
  Decimals:: 8

Traces:
  [7465] ChainlinkTestTest::testNeonSol2()
    ├─ [2468] 0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d::decimals() [staticcall]
    │   └─ ← 0x0000000000000000000000000000000000000000000000000000000000000008
    ├─ emit log_named_uint(key: Decimals:, val: 8)
    └─ ← ()

[PASS] testNeonSol3() (gas: 9639)
Logs:
  Description:: SOL / USD

Traces:
  [9639] ChainlinkTestTest::testNeonSol3()
    ├─ [3467] 0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d::description() [staticcall]
    │   └─ ← 0x00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000009534f4c202f205553440000000000000000000000000000000000000000000000
    ├─ emit log_named_string(key: Description:, val: SOL / USD)
    └─ ← ()

[PASS] testNeonSol4() (gas: 7433)
Logs:
  Version:: 2

Traces:
  [7433] ChainlinkTestTest::testNeonSol4()
    ├─ [2451] 0xec852B2A009f49E4eE4ffEddeDcF81a1AD1bbD6d::version() [staticcall]
    │   └─ ← 0x0000000000000000000000000000000000000000000000000000000000000002
    ├─ emit log_named_uint(key: Version:, val: 2)
    └─ ← ()

Test result: FAILED. 3 passed; 1 failed; 0 skipped; finished in 3.32s
Ran 1 test suites: 3 tests passed, 1 failed, 0 skipped (4 total tests)

Failing tests:
Encountered 1 failing test in test/ChainlinkTest.t.sol:ChainlinkTestTest
[FAIL. Reason: toUint8_outOfBounds] testNeonSol1() (gas: 15104)

Encountered a total of 1 failing tests, 3 tests succeeded
```
