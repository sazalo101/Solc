// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface for the USDC token (ERC20)
interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract FlickChallenge {
 
    address public usdcAddress;
    
   
    struct Challenge {
        uint256 rewardPool; 
        address creator; 
        uint256 endTime; 
        string challengeType; 
        bool isActive; 
        mapping(address => uint256) participants; 
        address winner; 

    
    mapping(uint256 => Challenge) public challenges;

    
    event ChallengeCreated(uint256 challengeId, address creator, uint256 rewardPool, uint256 endTime);
    
   
    event Participated(uint256 challengeId, address participant, uint256 score);
    
    
    event ChallengeEnded(uint256 challengeId, address winner, uint256 reward);

   
    constructor(address _usdcAddress) {
        usdcAddress = _usdcAddress;
    }

  
    function createChallenge(uint256 _rewardPool, uint256 _duration, string memory _challengeType) external {
        require(_rewardPool > 0, "Reward pool must be greater than 0");
        require(bytes(_challengeType).length > 0, "Challenge type is required");

        
        IERC20(usdcAddress).transferFrom(msg.sender, address(this), _rewardPool);

        
        uint256 challengeId = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, _challengeType)));
        
        
        challenges[challengeId] = Challenge({
            rewardPool: _rewardPool,
            creator: msg.sender,
            endTime: block.timestamp + _duration,
            challengeType: _challengeType,
            isActive: true,
            winner: address(0)
        });

        
        emit ChallengeCreated(challengeId, msg.sender, _rewardPool, block.timestamp + _duration);
    }

    function participate(uint256 _challengeId, uint256 _score) external {
        Challenge storage challenge = challenges[_challengeId];
        require(challenge.isActive, "Challenge is not active");
        require(block.timestamp < challenge.endTime, "Challenge has ended");

        challenge.participants[msg.sender] = _score;

      
        emit Participated(_challengeId, msg.sender, _score);
    }

    function endChallenge(uint256 _challengeId) external {
        Challenge storage challenge = challenges[_challengeId];
        require(challenge.isActive, "Challenge is not active");
        require(block.timestamp >= challenge.endTime, "Challenge is still ongoing");
        require(msg.sender == challenge.creator, "Only creator can end the challenge");

        
        address topParticipant;
        uint256 highestScore = 0;
        
        for (uint256 i = 0; i < 10; i++) { 
            address participant = address(i); 
            if (challenge.participants[participant] > highestScore) {
                highestScore = challenge.participants[participant];
                topParticipant = participant;
            }
        }

     
        challenge.winner = topParticipant;
        challenge.isActive = false; 

   
        IERC20(usdcAddress).transfer(topParticipant, challenge.rewardPool);

        
        emit ChallengeEnded(_challengeId, topParticipant, challenge.rewardPool);
    }

    function getChallengeDetails(uint256 _challengeId) external view returns (address creator, uint256 rewardPool, uint256 endTime, string memory challengeType, bool isActive, address winner) {
        Challenge storage challenge = challenges[_challengeId];
        return (challenge.creator, challenge.rewardPool, challenge.endTime, challenge.challengeType, challenge.isActive, challenge.winner);
    }
}
