class Pic {
  final int id;
  final String title;
  final String imagePath;

  Pic({required this.id, required this.title, required this.imagePath});

  // Factory method to create a Post from a JSON object
  factory Pic.fromJson(Map<String, dynamic> json) {
    return Pic(
      id: json['id'],
      title: json['title'],
      imagePath: json['url'],
    );
  }
}

Pic defaultPic = Pic(id: 0, title: 'Default Pic', imagePath: 'assets/images/onboarding_02.jpeg');