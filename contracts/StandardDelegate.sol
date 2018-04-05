pragma solidity ^0.4.18;

import "./modularERC20/ModularBurnableToken.sol";
import "./DelegateBurnable.sol";
import "./modularERC20/ModularStandardToken.sol";

contract StandardDelegate is DelegateBurnable, ModularStandardToken, ModularBurnableToken {
    address public delegatedFrom;

    event DelegatedFromSet(address addr);

    modifier onlySender(address source) {
        require(msg.sender == source);
        _;
    }

    function setDelegatedFrom(address addr) onlyOwner public {
        delegatedFrom = addr;
        emit DelegatedFromSet(addr);
    }

    // each function delegateX is simply forwarded to function X
    function delegateTotalSupply() onlySender(delegatedFrom) public view returns (uint256) {
        return totalSupply();
    }

    function delegateBalanceOf(address who) onlySender(delegatedFrom) public view returns (uint256) {
        return balanceOf(who);
    }

    function delegateTransferAllArgs(address origSender, address to, uint256 value) onlySender(delegatedFrom) public {
        transferAllArgs(origSender, to, value);
    }

    function delegateAllowance(address owner, address spender) onlySender(delegatedFrom) public view returns (uint256) {
        return allowance(owner, spender);
    }

    function delegateTransferFromAllArgs(address from, address to, uint256 value, address origSender) onlySender(delegatedFrom) public {
        transferFromAllArgs(from, to, value, origSender);
    }

    function delegateApproveAllArgs(address spender, uint256 value, address origSender) onlySender(delegatedFrom) public {
        approveAllArgs(spender, value, origSender);
    }

    function delegateIncreaseApprovalAllArgs(address spender, uint256 addedValue, address origSender) onlySender(delegatedFrom) public {
        increaseApprovalAllArgs(spender, addedValue, origSender);
    }

    function delegateDecreaseApprovalAllArgs(address spender, uint256 subtractedValue, address origSender) onlySender(delegatedFrom) public {
        decreaseApprovalAllArgs(spender, subtractedValue, origSender);
    }

    function delegateBurnAllArgs(address origSender, uint256 value) onlySender(delegatedFrom) public {
        burnAllArgs(origSender, value);
    }
}
