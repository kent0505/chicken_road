class Quiz {
  Quiz({
    required this.question,
    required this.answers,
  });

  final String question;
  final List<Answer> answers;
}

class Answer {
  Answer({
    required this.title,
    required this.correct,
  });

  final String title;
  final bool correct;
}

List<Quiz> farmQuizzes = [
  Quiz(
    question: "What is the most commonly grown crop in the world?",
    answers: [
      Answer(title: "Wheat", correct: true),
      Answer(title: "Corn", correct: false),
      Answer(title: "Rice", correct: false),
      Answer(title: "Soybeans", correct: false),
    ],
  ),
  Quiz(
    question: "Which animal provides us with wool?",
    answers: [
      Answer(title: "Sheep", correct: true),
      Answer(title: "Cow", correct: false),
      Answer(title: "Goat", correct: false),
      Answer(title: "Horse", correct: false),
    ],
  ),
  Quiz(
    question: "What is a young cow called?",
    answers: [
      Answer(title: "Calf", correct: true),
      Answer(title: "Foal", correct: false),
      Answer(title: "Kid", correct: false),
      Answer(title: "Lamb", correct: false),
    ],
  ),
  Quiz(
    question:
        "Which type of farming involves growing crops and raising animals?",
    answers: [
      Answer(title: "Mixed farming", correct: true),
      Answer(title: "Aquaculture", correct: false),
      Answer(title: "Horticulture", correct: false),
      Answer(title: "Monoculture", correct: false),
    ],
  ),
  Quiz(
    question: "Which of these is a common farm machine?",
    answers: [
      Answer(title: "Tractor", correct: true),
      Answer(title: "Crane", correct: false),
      Answer(title: "Bulldozer", correct: false),
      Answer(title: "Excavator", correct: false),
    ],
  ),
  Quiz(
    question: "What do chickens lay?",
    answers: [
      Answer(title: "Eggs", correct: true),
      Answer(title: "Seeds", correct: false),
      Answer(title: "Nuts", correct: false),
      Answer(title: "Berries", correct: false),
    ],
  ),
  Quiz(
    question: "What is a male horse called?",
    answers: [
      Answer(title: "Stallion", correct: true),
      Answer(title: "Gelding", correct: false),
      Answer(title: "Mare", correct: false),
      Answer(title: "Colt", correct: false),
    ],
  ),
  Quiz(
    question: "Which of these crops is grown underground?",
    answers: [
      Answer(title: "Potato", correct: true),
      Answer(title: "Corn", correct: false),
      Answer(title: "Wheat", correct: false),
      Answer(title: "Rice", correct: false),
    ],
  ),
  Quiz(
    question: "What is the process of collecting crops called?",
    answers: [
      Answer(title: "Harvesting", correct: true),
      Answer(title: "Planting", correct: false),
      Answer(title: "Irrigation", correct: false),
      Answer(title: "Cultivation", correct: false),
    ],
  ),
  Quiz(
    question: "What is a female chicken called?",
    answers: [
      Answer(title: "Hen", correct: true),
      Answer(title: "Rooster", correct: false),
      Answer(title: "Chick", correct: false),
      Answer(title: "Duck", correct: false),
    ],
  ),
  Quiz(
    question: "Which of these animals is commonly raised for milk production?",
    answers: [
      Answer(title: "Cow", correct: true),
      Answer(title: "Pig", correct: false),
      Answer(title: "Goat", correct: false),
      Answer(title: "Horse", correct: false),
    ],
  ),
  Quiz(
    question: "What is the main food source for cows?",
    answers: [
      Answer(title: "Grass", correct: true),
      Answer(title: "Corn", correct: false),
      Answer(title: "Hay", correct: false),
      Answer(title: "Soybeans", correct: false),
    ],
  ),
  Quiz(
    question: "Which of these animals is known for producing honey?",
    answers: [
      Answer(title: "Bee", correct: true),
      Answer(title: "Ant", correct: false),
      Answer(title: "Butterfly", correct: false),
      Answer(title: "Wasp", correct: false),
    ],
  ),
  Quiz(
    question: "Which farm animal has cloven hooves?",
    answers: [
      Answer(title: "Pig", correct: true),
      Answer(title: "Horse", correct: false),
      Answer(title: "Dog", correct: false),
      Answer(title: "Cat", correct: false),
    ],
  ),
  Quiz(
    question: "What is the term for preparing the soil for planting?",
    answers: [
      Answer(title: "Tilling", correct: true),
      Answer(title: "Harvesting", correct: false),
      Answer(title: "Sowing", correct: false),
      Answer(title: "Weeding", correct: false),
    ],
  ),
  Quiz(
    question: "Which of these is an example of a dairy product?",
    answers: [
      Answer(title: "Cheese", correct: true),
      Answer(title: "Egg", correct: false),
      Answer(title: "Chicken", correct: false),
      Answer(title: "Beef", correct: false),
    ],
  ),
  Quiz(
    question: "Which farm animal is known for pulling heavy loads?",
    answers: [
      Answer(title: "Ox", correct: true),
      Answer(title: "Goat", correct: false),
      Answer(title: "Sheep", correct: false),
      Answer(title: "Rabbit", correct: false),
    ],
  ),
  Quiz(
    question: "What do pigs love to roll in?",
    answers: [
      Answer(title: "Mud", correct: true),
      Answer(title: "Grass", correct: false),
      Answer(title: "Water", correct: false),
      Answer(title: "Sand", correct: false),
    ],
  ),
  Quiz(
    question: "Which of these is an example of a grain crop?",
    answers: [
      Answer(title: "Rice", correct: true),
      Answer(title: "Potato", correct: false),
      Answer(title: "Carrot", correct: false),
      Answer(title: "Lettuce", correct: false),
    ],
  ),
  Quiz(
    question: "What is a group of sheep called?",
    answers: [
      Answer(title: "Flock", correct: true),
      Answer(title: "Pack", correct: false),
      Answer(title: "Herd", correct: false),
      Answer(title: "Gaggle", correct: false),
    ],
  ),
  Quiz(
    question: "What is the main ingredient in bread?",
    answers: [
      Answer(title: "Wheat", correct: true),
      Answer(title: "Rice", correct: false),
      Answer(title: "Oats", correct: false),
      Answer(title: "Corn", correct: false),
    ],
  ),
  Quiz(
    question: "What is the process of watering crops called?",
    answers: [
      Answer(title: "Irrigation", correct: true),
      Answer(title: "Harvesting", correct: false),
      Answer(title: "Tilling", correct: false),
      Answer(title: "Pruning", correct: false),
    ],
  ),
  Quiz(
    question: "Which animal is commonly used to guard livestock?",
    answers: [
      Answer(title: "Dog", correct: true),
      Answer(title: "Cat", correct: false),
      Answer(title: "Rabbit", correct: false),
      Answer(title: "Goose", correct: false),
    ],
  ),
  Quiz(
    question: "Which fruit grows on a vine?",
    answers: [
      Answer(title: "Grapes", correct: true),
      Answer(title: "Apples", correct: false),
      Answer(title: "Cherries", correct: false),
      Answer(title: "Bananas", correct: false),
    ],
  ),
  Quiz(
    question: "What do farmers use to milk cows efficiently?",
    answers: [
      Answer(title: "Milking machine", correct: true),
      Answer(title: "Hand pump", correct: false),
      Answer(title: "Bucket", correct: false),
      Answer(title: "Spoon", correct: false),
    ],
  ),
  Quiz(
    question: "What is a male chicken called?",
    answers: [
      Answer(title: "Rooster", correct: true),
      Answer(title: "Hen", correct: false),
      Answer(title: "Duck", correct: false),
      Answer(title: "Turkey", correct: false),
    ],
  ),
  Quiz(
    question: "Which of these is NOT a farm animal?",
    answers: [
      Answer(title: "Tiger", correct: true),
      Answer(title: "Goat", correct: false),
      Answer(title: "Horse", correct: false),
      Answer(title: "Cow", correct: false),
    ],
  ),
];
