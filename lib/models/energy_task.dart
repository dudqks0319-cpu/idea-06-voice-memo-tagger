class EnergyTask {
  EnergyTask({
    required this.id,
    required this.title,
    required this.priorityLevel,
    required this.memoLengthSec,
    required this.status,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final int priorityLevel; // 1~5
  final int memoLengthSec;
  final String status; // pending | done
  final String notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get done => status == 'done';

  EnergyTask copyWith({
    String? id,
    String? title,
    int? priorityLevel,
    int? memoLengthSec,
    String? status,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EnergyTask(
      id: id ?? this.id,
      title: title ?? this.title,
      priorityLevel: priorityLevel ?? this.priorityLevel,
      memoLengthSec: memoLengthSec ?? this.memoLengthSec,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toInsertMap(String userId) {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'priority_level': priorityLevel,
      'memo_length_sec': memoLengthSec,
      'status': status,
      'notes': notes,
      'updated_at': DateTime.now().toIso8601String(),
    };
  }

  factory EnergyTask.fromMap(Map<String, dynamic> map) {
    return EnergyTask(
      id: map['id'] as String,
      title: (map['title'] ?? '') as String,
      priorityLevel: (map['priority_level'] as num?)?.toInt() ?? 3,
      memoLengthSec: (map['memo_length_sec'] as num?)?.toInt() ?? 30,
      status: (map['status'] ?? 'pending') as String,
      notes: (map['notes'] ?? '') as String,
      createdAt: DateTime.tryParse((map['created_at'] ?? '') as String) ?? DateTime.now(),
      updatedAt: DateTime.tryParse((map['updated_at'] ?? '') as String) ?? DateTime.now(),
    );
  }
}
