## `StkTruToken`



Staking contract for TrueFi
TRU is staked and stored in the contract
stkTRU is minted when staking
Holders of stkTRU accrue rewards over time
Rewards are paid in TRU and tfUSD
stkTRU can be used to vote in governance
stkTRU can be used to rate and approve loans

### `joiningNotPaused()`



pool can only be joined when it's unpaused

### `onlyLiquidator()`



Only Liquidator contract can perform TRU liquidations

### `onlyWhitelistedPayers()`



Only whitelisted payers can pay fees

### `distribute()`

Get TRU from distributor



### `update(address account)`

Update all rewards when an account changes state




### `updateRewards(address account, contract IERC20 token)`

Update rewards for a specific token when an account changes state





### `initialize(contract IERC20 _tru, contract IERC20 _tfusd, contract IERC20 _feeToken, contract ITrueDistributor _distributor, address _liquidator)` (public)



Initialize contract and set default values


### `setFeeToken(contract IERC20 _feeToken)` (external)



Set tfUSDC address


### `setLiquidator(address _liquidator)` (external)



Set liquidator address


### `setPayerWhitelistingStatus(address payer, bool status)` (external)



Owner can use this function to add new addresses to payers whitelist
Only whitelisted payers can call payFee method


### `setCooldownTime(uint256 newCooldownTime)` (external)



Owner can use this function to set cooldown time
Cooldown time defines how long a staker waits to unstake TRU


### `setPauseStatus(bool status)` (external)



Allow pausing of deposits in case of emergency


### `setUnstakePeriodDuration(uint256 newUnstakePeriodDuration)` (external)



Owner can set unstake period duration
Unstake period defines how long after cooldown a user has to withdraw stake


### `stake(uint256 amount)` (external)



Stake TRU for stkTRU
Updates rewards when staking


### `unstake(uint256 amount)` (external)



Unstake stkTRU for TRU
Can only unstake when cooldown complete and within unstake period
Claims rewards when unstaking


### `cooldown()` (public)



Initiate cooldown period

### `withdraw(uint256 amount)` (external)



Withdraw TRU from the contract for liquidation


### `unlockTime(address account) → uint256` (public)



View function to get unlock time for an account


### `payFee(uint256 amount, uint256 endTime)` (external)



Give tfUSD as origination fee to stake.this
50% are given immediately and 50% after `endTime` passes

### `claim()` (external)



Claim all rewards

### `claimRewards(contract IERC20 token)` (external)



Claim rewards for specific token
Allows account to claim specific token to save gas


### `claimRestake(uint256 extraStakeAmount)` (external)



Claim TRU rewards, transfer in extraStakeAmount, and
stake both the rewards and the new amount.
Allows account to save more gas by avoiding out-and-back transfers of rewards

### `claimable(address account, contract IERC20 token) → uint256` (external)



View to estimate the claimable reward for an account


### `unstakable(address staker) → uint256` (public)



max amount of stkTRU than can be unstaked after current cooldown period is over

### `getPriorVotes(address account, uint256 blockNumber) → uint96` (public)



Prior votes votes are calculated as priorVotes * stakedSupply / totalSupply
This dilutes voting power when TRU is liquidated


### `getCurrentVotes(address account) → uint96` (public)



Current votes are calculated as votes * stakedSupply / totalSupply
This dilutes voting power when TRU is liquidated


### `decimals() → uint8` (public)





### `rounding() → uint8` (public)





### `name() → string` (public)





### `symbol() → string` (public)





### `_transfer(address sender, address recipient, uint256 amount)` (internal)





### `min(uint256 a, uint256 b) → uint256` (internal)





### `_claim(contract IERC20 token)` (internal)



Internal claim function
Claim rewards for a specific ERC20 token


### `_claimWithoutTransfer(contract IERC20 token) → uint256` (internal)



Internal claim function that returns the transfer value
Claim rewards for a specific ERC20 token to return in a uint256


### `_stakeWithoutTransfer(uint256 amount)` (internal)



Internal stake of TRU for stkTRU from a uint256
Caller is responsible for ensuring amount is transferred from a valid source


### `rewardBalance(contract IERC20 token) → uint256` (internal)



Get reward balance of this contract for a token


### `distributeScheduledRewards()` (internal)



Check if any scheduled rewards should be distributed

### `updateTotalRewards(contract IERC20 token)` (internal)



Update rewards state for `token`

### `updateClaimableRewards(contract IERC20 token, address user)` (internal)



Update claimable rewards for a token and account


### `findPositionForTimestamp(uint256 timestamp) → uint32 i` (internal)



Find next distribution index given a timestamp


### `insertAt(uint32 index, uint32 value)` (internal)



internal function to insert distribution index in a sorted list



### `Stake(address staker, uint256 amount)`





### `Unstake(address staker, uint256 burntAmount)`





### `Claim(address who, contract IERC20 token, uint256 amountClaimed)`





### `Withdraw(uint256 amount)`





### `Cooldown(address who, uint256 endTime)`





### `CooldownTimeChanged(uint256 newUnstakePeriodDuration)`





### `UnstakePeriodDurationChanged(uint256 newUnstakePeriodDuration)`





### `FeePayerWhitelistingStatusChanged(address payer, bool status)`





### `PauseStatusChanged(bool pauseStatus)`





### `FeeTokenChanged(contract IERC20 token)`





### `LiquidatorChanged(address liquidator)`





