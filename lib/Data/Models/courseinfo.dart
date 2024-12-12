/// Represents a course with its details.
///
/// This class contains all relevant information about a course.
///
/// **Variables:**
/// - [courseId]: An integer representing the unique identifier of the course.
/// - [courseName]: A String representing the name of the course.
/// - [batchNo]: A String representing the batch number of the course.
/// - [courseFee]: A String representing the fee for the course.
/// - [classes]: A String indicating the number of classes in the course.
/// - [duration]: A String specifying the duration of the course.
/// - [classStart]: A String indicating the start date of the class.
/// - [shift]: A String representing the shift of the course.
/// - [regDeadline]: A String indicating the registration deadline for the course.
///
/// **Actions:**
/// - [fromJson]: A factory constructor that creates a Course instance from a JSON map.
/// - [toJson]: A method that converts the Course instance to a JSON map.
class Course {
  final dynamic courseId;
  final dynamic courseName;
  final dynamic batchNo;
  final dynamic courseFee;
  final dynamic classes;
  final dynamic duration;
  final dynamic classStart;
  final dynamic shift;
  final dynamic regDeadline;

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
