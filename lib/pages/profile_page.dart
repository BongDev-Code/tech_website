import 'package:flutter/material.dart';

import '../models/user_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // TODO: Replace with actual user data
    final user = UserProfile(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      role: 'student',
      school: 'High School XYZ',
      grade: 'Grade 11',
      enrolledCourses: [
        CourseProgress(
          courseId: '1',
          courseTitle: 'Python Programming Fundamentals',
          progress: 0.75,
          moduleProgress: [
            ModuleProgress(
              moduleId: '1',
              moduleTitle: 'Introduction to Python',
              progress: 1.0,
              completedLessons: ['lesson1', 'lesson2'],
            ),
          ],
          assessments: [
            Assessment(
              assessmentId: '1',
              title: 'Python Basics Quiz',
              score: 85,
              date: DateTime.now(),
              status: 'completed',
              maxScore: 100,
            ),
          ],
          status: 'in_progress',
          startDate: DateTime.now().subtract(const Duration(days: 30)),
        ),
      ],
      certifications: ['Python Basics'],
      skills: ['Python', 'Problem Solving'],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Navigate to edit profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                _buildAnimatedProfileSection(context, user),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAnimatedSection(
                        context,
                        'Education',
                        [
                          _buildAnimatedEducationCard(context, user),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildAnimatedSection(
                        context,
                        'Skills',
                        [
                          _buildAnimatedSkillsCard(context, user),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildAnimatedSection(
                        context,
                        'Certifications',
                        [
                          _buildAnimatedCertificationsCard(context, user),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildAnimatedSection(
                        context,
                        'Current Courses',
                        [
                          ...user.enrolledCourses.map((course) =>
                              _buildAnimatedCourseCard(context, course)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedProfileSection(BuildContext context, UserProfile user) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (value * 0.2),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.15),
              Theme.of(context).colorScheme.secondary.withOpacity(0.15),
              Theme.of(context).colorScheme.tertiary.withOpacity(0.15),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, -4),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildAnimatedProfilePicture(context, user),
            const SizedBox(height: 12),
            _buildAnimatedText(
              user.name,
              Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                shadows: [
                  Shadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _buildAnimatedEmailContainer(context, user),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedProfilePicture(BuildContext context, UserProfile user) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.5 + (value * 0.5),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 6),
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
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
    );
  }

  Widget _buildAnimatedText(String text, TextStyle? style) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Text(text, style: style),
    );
  }

  Widget _buildAnimatedEmailContainer(BuildContext context, UserProfile user) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (value * 0.2),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, -4),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Text(
          user.email,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                height: 1.3,
                fontWeight: FontWeight.w500,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildAnimatedSection(
      BuildContext context, String title, List<Widget> children) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildAnimatedEducationCard(BuildContext context, UserProfile user) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (value * 0.1),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            _buildInfoRow('School', user.school),
            const Divider(height: 24),
            _buildInfoRow('Grade', user.grade),
            if (user.university != null) ...[
              const Divider(height: 24),
              _buildInfoRow('University', user.university!),
            ],
            if (user.degree != null) ...[
              const Divider(height: 24),
              _buildInfoRow('Degree', user.degree!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedSkillsCard(BuildContext context, UserProfile user) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (value * 0.1),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: user.skills
              .map((skill) => _buildAnimatedSkillChip(context, skill))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildAnimatedSkillChip(BuildContext context, String skill) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 200),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.scale(
            scale: 0.9 + (value * 0.1),
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getSkillIcon(skill),
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                skill,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedCertificationsCard(
      BuildContext context, UserProfile user) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (value * 0.1),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: user.certifications
              .map((cert) => _buildAnimatedCertificationChip(context, cert))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildAnimatedCertificationChip(BuildContext context, String cert) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 200),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.scale(
            scale: 0.9 + (value * 0.1),
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.verified,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                cert,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedCourseCard(BuildContext context, CourseProgress course) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 800),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.scale(
            scale: 0.9 + (value * 0.1),
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.1),
                Theme.of(context).colorScheme.secondary.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      _getCourseIcon(course.courseTitle),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        course.courseTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildAnimatedProgressBar(context, course.progress),
                const SizedBox(height: 8),
                Text(
                  '${(course.progress * 100).toInt()}% Complete',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                if (course.assessments.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Recent Assessments',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...course.assessments.map((assessment) =>
                      _buildAnimatedAssessmentCard(context, assessment)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedProgressBar(BuildContext context, double progress) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween(begin: 0.0, end: progress),
      builder: (context, value, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value,
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            color: Theme.of(context).colorScheme.primary,
            minHeight: 8,
          ),
        );
      },
    );
  }

  Widget _buildAnimatedAssessmentCard(
      BuildContext context, Assessment assessment) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (value * 0.1),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              assessment.status == 'completed'
                  ? Icons.check_circle
                  : Icons.pending,
              color: assessment.status == 'completed'
                  ? Colors.green
                  : Colors.orange,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    assessment.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    'Score: ${assessment.score}/${assessment.maxScore}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: assessment.status == 'completed'
                    ? Colors.green.withOpacity(0.1)
                    : Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                assessment.status,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: assessment.status == 'completed'
                          ? Colors.green
                          : Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  IconData _getSkillIcon(String skill) {
    switch (skill.toLowerCase()) {
      case 'python':
        return Icons.code;
      case 'problem solving':
        return Icons.psychology;
      case 'flutter':
        return Icons.phone_android;
      case 'dart':
        return Icons.developer_mode;
      case 'mobile development':
        return Icons.smartphone;
      case 'ui/ux design':
        return Icons.design_services;
      default:
        return Icons.star;
    }
  }

  IconData _getCourseIcon(String courseTitle) {
    switch (courseTitle.toLowerCase()) {
      case 'python':
        return Icons.code;
      case 'arduino':
        return Icons.memory;
      case 'web development':
        return Icons.web;
      case 'robotics':
        return Icons.smart_toy;
      case 'digital marketing':
        return Icons.campaign;
      case 'career development':
        return Icons.work;
      case 'engineering':
        return Icons.engineering;
      default:
        return Icons.school;
    }
  }
}
