import 'package:flutter/material.dart';

import '../models/course.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  String _selectedCategory = 'All';
  String _selectedLevel = 'All';
  final TextEditingController _searchController = TextEditingController();

  final List<String> _categories = [
    'All',
    'Coding',
    'Robotics',
    'Engineering',
    'Digital Skills',
    'Career Development',
  ];

  final List<String> _levels = [
    'All',
    'Beginner',
    'Intermediate',
    'Advanced',
  ];

  // TODO: Replace with actual data from backend
  final List<Course> _courses = [
    Course(
      id: '1',
      title: 'Python Programming Fundamentals',
      description:
          'Learn the basics of Python programming language and start your coding journey.',
      imageUrl: '',
      category: 'Coding',
      duration: 8,
      prerequisites: ['Basic computer skills'],
      skills: ['Python', 'Programming', 'Problem Solving'],
      level: 'Beginner',
      price: 0.0,
      isCertified: true,
    ),
    Course(
      id: '2',
      title: 'Arduino Robotics',
      description: 'Build and program robots using Arduino microcontrollers.',
      imageUrl: '',
      category: 'Robotics',
      duration: 12,
      prerequisites: ['Basic electronics knowledge'],
      skills: ['Arduino', 'Electronics', 'Robotics'],
      level: 'Intermediate',
      price: 0.0,
      isCertified: true,
    ),
    Course(
      id: '3',
      title: 'Web Development Bootcamp',
      description: 'Master HTML, CSS, and JavaScript to build modern websites.',
      imageUrl: '',
      category: 'Coding',
      duration: 16,
      prerequisites: ['Basic computer skills'],
      skills: ['HTML', 'CSS', 'JavaScript', 'Web Development'],
      level: 'Beginner',
      price: 0.0,
      isCertified: true,
    ),
    Course(
      id: '4',
      title: 'Advanced Robotics with LEGO',
      description: 'Create complex robotic systems using LEGO Mindstorms.',
      imageUrl: '',
      category: 'Robotics',
      duration: 10,
      prerequisites: ['Basic robotics knowledge'],
      skills: ['LEGO Mindstorms', 'Robotics', 'Programming'],
      level: 'Advanced',
      price: 0.0,
      isCertified: true,
    ),
    Course(
      id: '5',
      title: 'Digital Marketing Essentials',
      description:
          'Learn the fundamentals of digital marketing and social media.',
      imageUrl: '',
      category: 'Digital Skills',
      duration: 6,
      prerequisites: ['Basic computer skills'],
      skills: ['Digital Marketing', 'Social Media', 'Content Creation'],
      level: 'Beginner',
      price: 0.0,
      isCertified: true,
    ),
    Course(
      id: '6',
      title: 'Career Development Workshop',
      description: 'Develop essential skills for your tech career journey.',
      imageUrl: '',
      category: 'Career Development',
      duration: 4,
      prerequisites: ['None'],
      skills: ['Resume Writing', 'Interview Skills', 'Career Planning'],
      level: 'All Levels',
      price: 0.0,
      isCertified: true,
    ),
    Course(
      id: '7',
      title: 'Engineering Design & Innovation',
      description:
          'Learn engineering principles, design thinking, and practical problem-solving skills for real-world challenges.',
      imageUrl: '',
      category: 'Engineering',
      duration: 14,
      prerequisites: ['Basic mathematics', 'Physics knowledge'],
      skills: ['Engineering Design', 'Problem Solving', 'CAD', 'Prototyping'],
      level: 'Intermediate',
      price: 0.0,
      isCertified: true,
    ),
    Course(
      id: '8',
      title: 'Mobile App Development with Flutter',
      description:
          'Create beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
      imageUrl: '',
      category: 'Coding',
      duration: 12,
      prerequisites: ['Basic programming knowledge', 'Understanding of OOP'],
      skills: ['Flutter', 'Dart', 'Mobile Development', 'UI/UX Design'],
      level: 'Intermediate',
      price: 0.0,
      isCertified: true,
    ),
  ];

  List<Course> get _filteredCourses {
    return _courses.where((course) {
      final matchesCategory =
          _selectedCategory == 'All' || course.category == _selectedCategory;
      final matchesLevel =
          _selectedLevel == 'All' || course.level == _selectedLevel;
      final matchesSearch = _searchController.text.isEmpty ||
          course.title
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()) ||
          course.description
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
      return matchesCategory && matchesLevel && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Courses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CourseSearchDelegate(_courses),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Profile Section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.primary.withOpacity(0.15),
                  colorScheme.secondary.withOpacity(0.15),
                  colorScheme.tertiary.withOpacity(0.15),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: colorScheme.secondary.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, -4),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.primary,
                        colorScheme.secondary,
                        colorScheme.tertiary,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.4),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: colorScheme.secondary.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, -6),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Welcome Back!',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                    shadows: [
                      Shadow(
                        color: colorScheme.primary.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: colorScheme.secondary.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, -4),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Text(
                    'Ready to continue your learning journey?',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Explore our courses below',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search courses...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip(
                          'Category', _selectedCategory, _categories),
                      const SizedBox(width: 8),
                      _buildFilterChip('Level', _selectedLevel, _levels),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredCourses.length,
              itemBuilder: (context, index) {
                final course = _filteredCourses[index];
                return _buildCourseCard(course);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String selected, List<String> options) {
    return Wrap(
      spacing: 8,
      children: options.map((option) {
        final isSelected = selected == option;
        return FilterChip(
          label: Text(option),
          selected: isSelected,
          onSelected: (value) {
            setState(() {
              if (label == 'Category') {
                _selectedCategory = option;
              } else {
                _selectedLevel = option;
              }
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildCourseCard(Course course) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.title,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            course.category,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (course.isCertified)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.verified,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  course.description,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildInfoChip(Icons.schedule, '${course.duration} weeks'),
                    _buildInfoChip(Icons.school, course.level),
                    _buildInfoChip(Icons.category, course.category),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        course.price == 0 ? 'Free' : '\$${course.price}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ).copyWith(
                          elevation: WidgetStateProperty.resolveWith<double>(
                            (Set<WidgetState> states) {
                              if (states.contains(WidgetState.hovered)) {
                                return 6;
                              }
                              return 2;
                            },
                          ),
                        ),
                        onPressed: () {
                          // TODO: Navigate to course details
                        },
                        child: const Text('Learn More'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class CourseSearchDelegate extends SearchDelegate<Course?> {
  final List<Course> courses;

  CourseSearchDelegate(this.courses);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final results = courses.where((course) {
      return course.title.toLowerCase().contains(query.toLowerCase()) ||
          course.description.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final course = results[index];
        return ListTile(
          title: Text(course.title),
          subtitle: Text(course.description),
          onTap: () {
            close(context, course);
          },
        );
      },
    );
  }
}
