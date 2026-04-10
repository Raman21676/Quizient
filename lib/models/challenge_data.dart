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
  description: 'AI-ML Fundamentals: AI History, ML Basics, Supervised vs Unsupervised Learning, Neural Networks & Deep Learning',
  color: '#6750A4',
  challenges: [
    ChallengeInfo(
      id: 'C01',
      name: 'CHALLENGE 1',
      subtitle: 'AI Fundamentals & History',
      assetPath: 'assets/questions/challenge_01.json',
    ),
    ChallengeInfo(
      id: 'C02',
      name: 'CHALLENGE 2',
      subtitle: 'Machine Learning Basics',
      assetPath: 'assets/questions/challenge_02.json',
    ),
    ChallengeInfo(
      id: 'C03',
      name: 'CHALLENGE 3',
      subtitle: 'Supervised vs Unsupervised Learning',
      assetPath: 'assets/questions/challenge_03.json',
    ),
    ChallengeInfo(
      id: 'C04',
      name: 'CHALLENGE 4',
      subtitle: 'Neural Networks & Deep Learning',
      assetPath: 'assets/questions/challenge_04.json',
    ),
  ],
);

// LEVEL 4 - Intermediate ML (Hands-On ML Book)
final Level level4 = Level(
  id: 'L4',
  name: 'LEVEL 4',
  description: 'Intermediate ML: End-to-End ML Projects, Classification, Training Models, SVMs, Decision Trees, Ensembles & Dimensionality Reduction',
  color: '#00BCD4',
  challenges: [
    ChallengeInfo(
      id: 'C16',
      name: 'CHALLENGE 16',
      subtitle: 'The Machine Learning Landscape',
      assetPath: 'assets/questions/challenge_16.json',
    ),
    ChallengeInfo(
      id: 'C17',
      name: 'CHALLENGE 17',
      subtitle: 'End-to-End Machine Learning Project',
      assetPath: 'assets/questions/challenge_17.json',
    ),
    ChallengeInfo(
      id: 'C18',
      name: 'CHALLENGE 18',
      subtitle: 'Classification Algorithms',
      assetPath: 'assets/questions/challenge_18.json',
    ),
    ChallengeInfo(
      id: 'C19',
      name: 'CHALLENGE 19',
      subtitle: 'Training Models & Optimization',
      assetPath: 'assets/questions/challenge_19.json',
    ),
    ChallengeInfo(
      id: 'C20',
      name: 'CHALLENGE 20',
      subtitle: 'Support Vector Machines (SVM)',
      assetPath: 'assets/questions/challenge_20.json',
    ),
    ChallengeInfo(
      id: 'C21',
      name: 'CHALLENGE 21',
      subtitle: 'Decision Trees',
      assetPath: 'assets/questions/challenge_21.json',
    ),
    ChallengeInfo(
      id: 'C22',
      name: 'CHALLENGE 22',
      subtitle: 'Ensemble Learning & Random Forests',
      assetPath: 'assets/questions/challenge_22.json',
    ),
    ChallengeInfo(
      id: 'C23',
      name: 'CHALLENGE 23',
      subtitle: 'Dimensionality Reduction Techniques',
      assetPath: 'assets/questions/challenge_23.json',
    ),
    ChallengeInfo(
      id: 'C24',
      name: 'CHALLENGE 24',
      subtitle: 'Unsupervised Learning Techniques',
      assetPath: 'assets/questions/challenge_24.json',
    ),
    ChallengeInfo(
      id: 'C25',
      name: 'CHALLENGE 25',
      subtitle: 'Advanced ML Topics',
      assetPath: 'assets/questions/challenge_25.json',
    ),
    ChallengeInfo(
      id: 'C26',
      name: 'CHALLENGE 26',
      subtitle: 'Neural Networks with Keras',
      assetPath: 'assets/questions/challenge_26.json',
    ),
    ChallengeInfo(
      id: 'C27',
      name: 'CHALLENGE 27',
      subtitle: 'Training Deep Neural Networks',
      assetPath: 'assets/questions/challenge_27.json',
    ),
  ],
);

// LEVEL 2 - Reinforcement Learning
final Level level2 = Level(
  id: 'L2',
  name: 'LEVEL 2',
  description: 'Reinforcement Learning: From Basics to Advanced RL, MDPs, Value-Based and Policy-Based Methods',
  color: '#81C784',
  challenges: [
    ChallengeInfo(
      id: 'C05',
      name: 'CHALLENGE 5',
      subtitle: 'Reinforcement Learning Fundamentals',
      assetPath: 'assets/questions/challenge_05.json',
    ),
    ChallengeInfo(
      id: 'C06',
      name: 'CHALLENGE 6',
      subtitle: 'Markov Decision Processes (MDPs)',
      assetPath: 'assets/questions/challenge_06.json',
    ),
    ChallengeInfo(
      id: 'C07',
      name: 'CHALLENGE 7',
      subtitle: 'Dynamic Programming in RL',
      assetPath: 'assets/questions/challenge_07.json',
    ),
    ChallengeInfo(
      id: 'C08',
      name: 'CHALLENGE 8',
      subtitle: 'Monte Carlo Methods',
      assetPath: 'assets/questions/challenge_08.json',
    ),
    ChallengeInfo(
      id: 'C09',
      name: 'CHALLENGE 9',
      subtitle: 'Temporal-Difference Learning',
      assetPath: 'assets/questions/challenge_09.json',
    ),
    ChallengeInfo(
      id: 'C10',
      name: 'CHALLENGE 10',
      subtitle: 'Value-Based Methods: Q-Learning & SARSA',
      assetPath: 'assets/questions/challenge_10.json',
    ),
    ChallengeInfo(
      id: 'C11',
      name: 'CHALLENGE 11',
      subtitle: 'Policy-Based Methods & Policy Gradients',
      assetPath: 'assets/questions/challenge_11.json',
    ),
    ChallengeInfo(
      id: 'C12',
      name: 'CHALLENGE 12',
      subtitle: 'Actor-Critic Methods: A2C & A3C',
      assetPath: 'assets/questions/challenge_12.json',
    ),
  ],
);

// LEVEL 5 - Large Language Models
final Level level5 = Level(
  id: 'L5',
  name: 'LEVEL 5',
  description: 'Large Language Models: Embeddings, Transformers, BERT, GPT, RAG, Fine-Tuning & PEFT',
  color: '#E91E63',
  challenges: [
    ChallengeInfo(
      id: 'C28',
      name: 'CHALLENGE 28',
      subtitle: 'Introduction to Large Language Models',
      assetPath: 'assets/questions/challenge_28.json',
    ),
    ChallengeInfo(
      id: 'C29',
      name: 'CHALLENGE 29',
      subtitle: 'Tokens and Embeddings',
      assetPath: 'assets/questions/challenge_29.json',
    ),
    ChallengeInfo(
      id: 'C30',
      name: 'CHALLENGE 30',
      subtitle: 'Inside Transformers: Attention Mechanisms',
      assetPath: 'assets/questions/challenge_30.json',
    ),
    ChallengeInfo(
      id: 'C31',
      name: 'CHALLENGE 31',
      subtitle: 'Text Classification with LLMs',
      assetPath: 'assets/questions/challenge_31.json',
    ),
    ChallengeInfo(
      id: 'C32',
      name: 'CHALLENGE 32',
      subtitle: 'Text Clustering & Topic Modeling',
      assetPath: 'assets/questions/challenge_32.json',
    ),
    ChallengeInfo(
      id: 'C33',
      name: 'CHALLENGE 33',
      subtitle: 'Prompt Engineering Techniques',
      assetPath: 'assets/questions/challenge_33.json',
    ),
    ChallengeInfo(
      id: 'C34',
      name: 'CHALLENGE 34',
      subtitle: 'Advanced Text Generation & LangChain',
      assetPath: 'assets/questions/challenge_34.json',
    ),
    ChallengeInfo(
      id: 'C35',
      name: 'CHALLENGE 35',
      subtitle: 'Semantic Search & RAG',
      assetPath: 'assets/questions/challenge_35.json',
    ),
    ChallengeInfo(
      id: 'C36',
      name: 'CHALLENGE 36',
      subtitle: 'Multimodal Large Language Models',
      assetPath: 'assets/questions/challenge_36.json',
    ),
    ChallengeInfo(
      id: 'C37',
      name: 'CHALLENGE 37',
      subtitle: 'Creating Text Embedding Models',
      assetPath: 'assets/questions/challenge_37.json',
    ),
    ChallengeInfo(
      id: 'C38',
      name: 'CHALLENGE 38',
      subtitle: 'Fine-Tuning BERT for Classification',
      assetPath: 'assets/questions/challenge_38.json',
    ),
    ChallengeInfo(
      id: 'C39',
      name: 'CHALLENGE 39',
      subtitle: 'Fine-Tuning Generative LLMs with LoRA & RLHF',
      assetPath: 'assets/questions/challenge_39.json',
    ),
  ],
);

// LEVEL 6 - DevOps
final Level level6 = Level(
  id: 'L6',
  name: 'LEVEL 6',
  description: 'DevOps: Fundamentals, Linux, CI/CD, Docker, Kubernetes, Cloud & Monitoring',
  color: '#FF9800',
  challenges: [
    ChallengeInfo(
      id: 'C40',
      name: 'CHALLENGE 40',
      subtitle: 'DevOps Fundamentals & Linux Basics',
      assetPath: 'assets/questions/challenge_40.json',
    ),
    ChallengeInfo(
      id: 'C41',
      name: 'CHALLENGE 41',
      subtitle: 'Linux Administration & Shell Scripting',
      assetPath: 'assets/questions/challenge_41.json',
    ),
    ChallengeInfo(
      id: 'C42',
      name: 'CHALLENGE 42',
      subtitle: 'Networking, SSH & Databases',
      assetPath: 'assets/questions/challenge_42.json',
    ),
    ChallengeInfo(
      id: 'C43',
      name: 'CHALLENGE 43',
      subtitle: 'Git & Version Control',
      assetPath: 'assets/questions/challenge_43.json',
    ),
  ],
);

// LEVEL 3 - Deep Reinforcement Learning
final Level level3 = Level(
  id: 'L3',
  name: 'LEVEL 3',
  description: 'Deep RL: DQN, Policy Gradients, Actor-Critic, PPO, SAC & Advanced RL Techniques',
  color: '#FF7043',
  challenges: [
    ChallengeInfo(
      id: 'C13',
      name: 'CHALLENGE 13',
      subtitle: 'Introduction to Deep Reinforcement Learning',
      assetPath: 'assets/questions/challenge_13.json',
    ),
    ChallengeInfo(
      id: 'C14',
      name: 'CHALLENGE 14',
      subtitle: 'Deep Q-Networks (DQN) & Value-Based Methods',
      assetPath: 'assets/questions/challenge_14.json',
    ),
    ChallengeInfo(
      id: 'C15',
      name: 'CHALLENGE 15',
      subtitle: 'Policy Gradients & Actor-Critic Methods',
      assetPath: 'assets/questions/challenge_15.json',
    ),
  ],
);
