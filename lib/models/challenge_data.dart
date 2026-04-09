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
  ],
);
