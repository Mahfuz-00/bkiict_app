class Course {
  final int courseId;
  final String courseName;
  final String batchNo;
  final String courseFee;
  final String classes;
  final String duration; // in hours
  final String classStart;
  final String shift;
  final String regDeadline;

  Course({
    required this.courseId,
    required this.courseName,
    required this.batchNo,
    required this.courseFee,
    required this.classes,
    required this.duration,
    required this.classStart,
    required this.shift,
    required this.regDeadline,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseId: json['course_id'],
      courseName: json['course_name'],
      batchNo: json['batch_no'],
      courseFee: json['course_fee'],
      classes: json['classes'],
      duration: json['duration'],
      classStart: json['class_start'],
      shift: json['shift'],
      regDeadline: json['reg_deadline'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'course_name': courseName,
      'batch_no': batchNo,
      'course_fee': courseFee,
      'classes': classes,
      'duration': duration,
      'class_start': classStart,
      'shift': shift,
      'reg_deadline': regDeadline,
    };
  }
}
