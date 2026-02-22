class UserProfile {
  UserProfile({
    required this.userId,
    required this.defaultPriorityLevel,
    required this.dailyReviewMinutes,
    required this.notificationsEnabled,
  });

  final String userId;
  final int defaultPriorityLevel; // 1~5
  final int dailyReviewMinutes;
  final bool notificationsEnabled;

  UserProfile copyWith({
    String? userId,
    int? defaultPriorityLevel,
    int? dailyReviewMinutes,
    bool? notificationsEnabled,
  }) {
    return UserProfile(
      userId: userId ?? this.userId,
      defaultPriorityLevel: defaultPriorityLevel ?? this.defaultPriorityLevel,
      dailyReviewMinutes: dailyReviewMinutes ?? this.dailyReviewMinutes,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'default_priority_level': defaultPriorityLevel,
      'daily_review_minutes': dailyReviewMinutes,
      'notifications_enabled': notificationsEnabled,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map, String userId) {
    return UserProfile(
      userId: userId,
      defaultPriorityLevel: (map['default_priority_level'] as num?)?.toInt() ?? 3,
      dailyReviewMinutes: (map['daily_review_minutes'] as num?)?.toInt() ?? 180,
      notificationsEnabled: (map['notifications_enabled'] as bool?) ?? true,
    );
  }

  static UserProfile defaults(String userId) {
    return UserProfile(
      userId: userId,
      defaultPriorityLevel: 3,
      dailyReviewMinutes: 180,
      notificationsEnabled: true,
    );
  }
}
