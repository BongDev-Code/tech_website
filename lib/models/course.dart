class Course {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String category; // e.g., 'Coding', 'Robotics', 'Engineering'
  final int duration; // in weeks
  final List<String> prerequisites;
  final List<String> skills;
  final String level; // 'Beginner', 'Intermediate', 'Advanced'
  final double price;
  final bool isCertified; // Whether it offers certification

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.duration,
    required this.prerequisites,
    required this.skills,
    required this.level,
    required this.price,
    required this.isCertified,
  });
}
