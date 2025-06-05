class UserProfile {
  final String id;
  final String name;
  final String email;
  final String role; // 'student', 'graduate', 'teacher'
  final String school; // For students
  final String grade; // For students
  final String? university; // For graduates
  final String? degree; // For graduates
  final String? graduationYear; // For graduates
  final List<CourseProgress> enrolledCourses;
  final List<String> certifications;
  final String? profileImageUrl;
  final String? bio;
  final List<String> skills;
  final String? resumeUrl;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.school,
    required this.grade,
    this.university,
    this.degree,
    this.graduationYear,
    required this.enrolledCourses,
    required this.certifications,
    this.profileImageUrl,
    this.bio,
    required this.skills,
    this.resumeUrl,
  });
}

class CourseProgress {
  final String courseId;
  final String courseTitle;
  final double progress; // 0.0 to 1.0
  final List<ModuleProgress> moduleProgress;
  final List<Assessment> assessments;
  final String status; // 'not_started', 'in_progress', 'completed'
  final DateTime? startDate;
  final DateTime? completionDate;
  final String? certificateUrl;

  CourseProgress({
    required this.courseId,
    required this.courseTitle,
    required this.progress,
    required this.moduleProgress,
    required this.assessments,
    required this.status,
    this.startDate,
    this.completionDate,
    this.certificateUrl,
  });
}

class ModuleProgress {
  final String moduleId;
  final String moduleTitle;
  final double progress;
  final List<String> completedLessons;
  final DateTime? lastAccessed;

  ModuleProgress({
    required this.moduleId,
    required this.moduleTitle,
    required this.progress,
    required this.completedLessons,
    this.lastAccessed,
  });
}

class Assessment {
  final String assessmentId;
  final String title;
  final double score;
  final DateTime date;
  final String status; // 'pending', 'completed', 'failed'
  final int maxScore;
  final String? feedback;

  Assessment({
    required this.assessmentId,
    required this.title,
    required this.score,
    required this.date,
    required this.status,
    required this.maxScore,
    this.feedback,
  });
}
