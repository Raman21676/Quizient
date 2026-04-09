// Challenge and QuizProgress classes are defined in question.dart

class Level {
  final String id;
  final String name;
  final String description;
  final String color;
  final List<ChallengeInfo> challenges;

  Level({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
    required this.challenges,
  });
}

class ChallengeInfo {
  final String id;
  final String name;
  final String subtitle;
  final String assetPath;

  ChallengeInfo({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.assetPath,
  });
}

// LEVEL 1 - AI-ML Fundamentals
final Level level1 = Level(
  id: 'L1',
  name: 'LEVEL 1',
  description: 'AI-ML Fundamentals - 200 carefully crafted questions across 4 challenges',
  color: '#6750A4',
  challenges: [
    ChallengeInfo(
      id: 'C01',
      name: 'CHALLENGE 1',
      subtitle: 'Foundations of Generative AI Systems',
      assetPath: 'assets/questions/challenge_01.json',
    ),
    ChallengeInfo(
      id: 'C02',
      name: 'CHALLENGE 2',
      subtitle: 'Building Web APIs with Modern Python Framework',
      assetPath: 'assets/questions/challenge_02.json',
    ),
    ChallengeInfo(
      id: 'C03',
      name: 'CHALLENGE 3',
      subtitle: 'Deploying and Managing AI Models',
      assetPath: 'assets/questions/challenge_03.json',
    ),
    ChallengeInfo(
      id: 'C04',
      name: 'CHALLENGE 4',
      subtitle: 'Type Safety in AI Application Development',
      assetPath: 'assets/questions/challenge_04.json',
    ),
  ],
);

// LEVEL 4 - Deep Reinforcement Learning
final Level level4 = Level(
  id: 'L4',
  name: 'LEVEL 4',
  description: 'Deep Reinforcement Learning - Master RL from MDPs to DQN, Actor-Critic, PPO, and SAC',
  color: '#00BCD4',
  challenges: [
    ChallengeInfo(
      id: 'C16',
      name: 'CHALLENGE 16',
      subtitle: 'Introduction to Deep Reinforcement Learning',
      assetPath: 'assets/questions/challenge_16.json',
    ),
    ChallengeInfo(
      id: 'C17',
      name: 'CHALLENGE 17',
      subtitle: 'Mathematical Foundations and MDPs',
      assetPath: 'assets/questions/challenge_17.json',
    ),
  ],
);

// LEVEL 2 - Intermediate ML Concepts
final Level level2 = Level(
  id: 'L2',
  name: 'LEVEL 2',
  description: 'Intermediate ML Concepts - ML fundamentals from authoritative sources',
  color: '#81C784',
  challenges: [
    ChallengeInfo(
      id: 'C05',
      name: 'CHALLENGE 5',
      subtitle: 'The Machine Learning Landscape',
      assetPath: 'assets/questions/challenge_05.json',
    ),
    ChallengeInfo(
      id: 'C06',
      name: 'CHALLENGE 6',
      subtitle: 'End-to-End Machine Learning Project',
      assetPath: 'assets/questions/challenge_06.json',
    ),
    ChallengeInfo(
      id: 'C07',
      name: 'CHALLENGE 7',
      subtitle: 'Classification',
      assetPath: 'assets/questions/challenge_07.json',
    ),
    ChallengeInfo(
      id: 'C08',
      name: 'CHALLENGE 8',
      subtitle: 'Training Models',
      assetPath: 'assets/questions/challenge_08.json',
    ),
    ChallengeInfo(
      id: 'C09',
      name: 'CHALLENGE 9',
      subtitle: 'Support Vector Machines',
      assetPath: 'assets/questions/challenge_09.json',
    ),
    ChallengeInfo(
      id: 'C10',
      name: 'CHALLENGE 10',
      subtitle: 'Decision Trees',
      assetPath: 'assets/questions/challenge_10.json',
    ),
    ChallengeInfo(
      id: 'C11',
      name: 'CHALLENGE 11',
      subtitle: 'Ensemble Learning and Random Forests',
      assetPath: 'assets/questions/challenge_11.json',
    ),
    ChallengeInfo(
      id: 'C12',
      name: 'CHALLENGE 12',
      subtitle: 'Dimensionality Reduction',
      assetPath: 'assets/questions/challenge_12.json',
    ),
  ],
);

// LEVEL 3 - DSA for Interviews
final Level level3 = Level(
  id: 'L3',
  name: 'LEVEL 3',
  description: 'Data Structures & Algorithms - Master DSA concepts to crack technical interviews',
  color: '#FF7043',
  challenges: [
    ChallengeInfo(
      id: 'C13',
      name: 'CHALLENGE 13',
      subtitle: 'Arrays, Strings, Hashing & Basic Algorithms',
      assetPath: 'assets/questions/challenge_13.json',
    ),
    ChallengeInfo(
      id: 'C14',
      name: 'CHALLENGE 14',
      subtitle: 'Linked Lists, Stacks, Queues, Trees & Heaps',
      assetPath: 'assets/questions/challenge_14.json',
    ),
    ChallengeInfo(
      id: 'C15',
      name: 'CHALLENGE 15',
      subtitle: 'Recursion, Backtracking, DP & Graphs',
      assetPath: 'assets/questions/challenge_15.json',
    ),
  ],
);
