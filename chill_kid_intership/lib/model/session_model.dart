class SessionModel {
  final String imageUrl;
  final String name;
  final String category;
  final int price;
  final String description;

  SessionModel ({
    this.imageUrl,
    this.name,
    this.category,
    this.price,
    this.description,
  });
}

final List<SessionModel > sessions = [
  SessionModel (
    imageUrl: 'assets/images/pic0.png',
    name: 'Aerobic',
    category: 'Session',
    price: 25,
    description: "L'aérobic est une gymnastique dansante qui stimule l'activité cardiovasculaire et oxygène le corps par des mouvements rapides exécutés sur une musique à rythme soutenu. ",
  ),
  SessionModel (
    imageUrl: 'assets/images/pic1.png',
    name: 'Musculation',
    category: 'Session',
    price: 30,
    description: "La musculation est un ensemble d'exercices physiques visant le développement des muscles squelettiques, afin d'acquérir plus de force, d'endurance, de puissance, d'explosivité ou de volume musculaire. ",
  ),
  SessionModel (
    imageUrl: 'assets/images/pic2.png',
    name: 'Gymnastique',
    category: 'Session',
    price: 42,
    description: "La gymnastique est un terme générique qui regroupe aujourd'hui des formes très diverses de disciplines sportives, pratiquées pour le loisir ou la compétition.",
  ),
  SessionModel (
    imageUrl: 'assets/images/pic3.png',
    name: 'Cardio',
    category: 'Session',
    price: 42,
    description:
    " Le cardio-training (l'entraînement du cœur) rassemble des activités de fitness sollicitant le muscle cardiaque afin de l'entraîner à l'effort et ainsi de renforcer les systèmes cardio-vasculaire et cardio-respiratoire.",
  ),
  SessionModel (
    imageUrl: 'assets/images/pic4.png',
    name: 'Yoga',
    category: 'Session',
    price: 42,
    description: "C'est une discipline ou pratique commune à plusieurs époques et courants, visant, par la méditation, l'ascèse et les exercices corporels, à réaliser l'unification de l'être humain dans ses aspects physique, psychique et spirituel4.",
  ),
  SessionModel (
    imageUrl: 'assets/images/pic5.png',
    name: 'Natation',
    category: 'Session',
    price: 42,
    description:
    "La natation sportive consiste à parcourir dans une piscine, le plus rapidement possible et dans un style codifié par la Fédération internationale de natation (FINA), une distance donnée, sans l'aide d'aucun accessoire.",
  ),
  SessionModel (
    imageUrl: 'assets/images/pic6.png',
    name: 'Boxing',
    category: 'Session',
    price: 42,
    description: "La boxe notamment la « boxe anglaise » règlementée de manière moderne est un sport de combat pratiqué depuis le XVIIIᵉ siècle à un contre un, qui recourt à des frappes de percussion à l'aide de gants matelassés. ",
  ),

];
