/// Represents an option for a center.
///
/// This class holds the details of a center option.
///
/// **Variables:**
/// - [id]: An integer representing the unique identifier of the center option.
/// - [name]: A String representing the name of the center option.
///
/// **Actions:**
/// - [fromJson]: A factory constructor that creates a CenterOption instance from a JSON map.
class CenterOption {
  final int id;
  final String name;

  CenterOption({
    required this.id,
    required this.name,
  });

  factory CenterOption.fromJson(Map<String, dynamic> json) {
    return CenterOption(
      id: json['id'],
      name: json['name'],
    );
  }
}

/// Represents the type of a course.
///
/// This class contains the details of a course type.
///
/// **Variables:**
/// - [id]: An integer representing the unique identifier of the course type.
/// - [name]: A String representing the name of the course type.
///
/// **Actions:**
/// - [fromJson]: A factory constructor that creates a CourseType instance from a JSON map.
class CourseType {
  final int id;
  final String name;

  CourseType({
    required this.id,
    required this.name,
  });

  factory CourseType.fromJson(Map<String, dynamic> json) {
    return CourseType(
      id: json['id'],
      name: json['name'],
    );
  }
}

/// Represents a course.
///
/// This class holds the details of a course.
///
/// **Variables:**
/// - [id]: An integer representing the unique identifier of the course.
/// - [name]: A String representing the name of the course.
/// - [fee]: A String representing the fee for the course.
///
/// **Actions:**
/// - [fromJson]: A factory constructor that creates a Course instance from a JSON map.
class Course {
  final int id;
  final String name;
  final String fee;

  Course({
    required this.id,
    required this.name,
    required this.fee,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      fee: json['fee'],
    );
  }
}

/// Represents a batch number for a course.
///
/// This class contains the details of a batch number.
///
/// **Variables:**
/// - [id]: An integer representing the unique identifier of the batch.
/// - [number]: A String representing the batch number.
/// - [name]: A String representing the name associated with the batch.
///
/// **Actions:**
/// - [fromJson]: A factory constructor that creates a BatchNo instance from a JSON map.
class BatchNo {
  final int id;
  final int number;
  final String name;

  BatchNo({
    required this.id,
    required this.number,
    required this.name,
  });

  factory BatchNo.fromJson(Map<String, dynamic> json) {
    return BatchNo(
      id: json['id'],
      number: json['number'],
      name: json['name'],
    );
  }
}

/// Represents the fee for a course.
///
/// This class holds the details of a course fee.
///
/// **Variables:**
/// - [id]: An integer representing the unique identifier of the course fee.
/// - [amount]: A double representing the amount of the course fee.
///
/// **Actions:**
/// - [fromJson]: A factory constructor that creates a CourseFee instance from a JSON map.
class CourseFee {
  final int id;
  final double amount;

  CourseFee({
    required this.id,
    required this.amount,
  });

  factory CourseFee.fromJson(Map<String, dynamic> json) {
    return CourseFee(
      id: json['id'],
      amount: json['amount'].toDouble(),
    );
  }
}
