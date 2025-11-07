// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract SimpleInteraction { // gaoul
    uint256 public totalInteractions;

    mapping(address => uint256[]) private _userCounts;

    event Interacted(address indexed user, uint256 userCount, uint256 totalInteractions);

    function interact() external {
        uint256 newCount = _userCounts[msg.sender].length + 1;
        _userCounts[msg.sender].push(newCount);

        totalInteractions += 1;

        emit Interacted(msg.sender, newCount, totalInteractions);
    }

    function getUserCount(address user) external view returns (uint256) {
        uint256 len = _userCounts[user].length;
        return len == 0 ? 0 : _userCounts[user][len - 1];
    }

}











