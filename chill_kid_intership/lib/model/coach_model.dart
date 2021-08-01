class CoachModel {
  final String imageUrl;
  final String name;
  final int age;
  final String description;

  CoachModel ({
    this.imageUrl,
    this.name,
    this.age,
    this.description,
  });
}

final List<CoachModel > coachs = [

  CoachModel (
    imageUrl: 'assets/coach/coach0.jpg',
    name: 'Alex Alex',
    age: 30,
    description: "Alex Alex est un coach de musculation ",
  ),
  CoachModel (
    imageUrl: 'assets/coach/coach1.jpg',
    name: 'Sam Sam',
    age: 30,
    description: "Sam Sam est un coach de natation",
  ),
  CoachModel (
    imageUrl: 'assets/coach/coach2.jpg',
    name: 'Nancy Nancy',
    age: 26,
    description:
    " Nancy Nancy est un coach d'Aerobic",
  ),
  CoachModel (
    imageUrl: 'assets/coach/coach3.jpg',
    name: 'Melissa Melissa',
    age: 42,
    description: "Melissa Melisaa est un coach de Fitness",
  ),
  CoachModel (
    imageUrl: 'assets/coach/coach4.jpg',
    name: 'Jack Jack',
    age: 28,
    description:
    "Jack Jack est un coach de Boxing ",
  ),


];