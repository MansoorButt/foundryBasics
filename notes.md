# Foundry notes

### Important functions to keep a track of
`vm.prank` : use this to masquerade an Address and act as a msg.sender

`vm.warp`: set block.timestamp to future timestamp
`vm.roll`: set block.number
`skip`: increment current timestamp
`rewind`: decrement current timestamp

### command to run a Fork along a test
`forge test --fork-url $FORK_URL --match-path test/Whale.t.sol -vvv` 

