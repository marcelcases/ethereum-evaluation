pragma solidity ^0.5.16;

contract Referendum {
    struct Result {
        uint256 yes;
        uint256 no;
        uint256 againstAll;
        uint256 totalVotes;
    }

    struct Vote {
        bool hasVoted;
        uint256 answer;
    }

    mapping (address => Vote) votes;
    Result result;

    constructor() public {
        result = Result(0, 0, 0, 0);
    }

    event HasVoted(address voter);

    function vote(uint8 answer) private returns(bool) {
        address voter = msg.sender;
        if(votes[voter].hasVoted) {
            return false;
        }
        else {
            if(answer == 0) {
                result.yes++;
            }
            else if(answer == 1) {
                result.no++;
            }
            else if(answer == 2) {
                result.againstAll++;
            }
            result.totalVotes++;
            votes[voter].answer = answer;
            votes[voter].hasVoted = true;
            emit HasVoted(voter);
            return true;
        }
    }

    function voteYes() public returns(bool) {
        return vote(0);
    }

    function voteNo() public returns(bool) {
        return vote(1);
    }
    
    function voteAgainstAll() public returns(bool) {
        return vote(2);
    }

    function getResult() public view returns(uint256, uint256, uint256, uint256) {
        return (result.yes, result.no, result.againstAll, result.totalVotes);
    }

}