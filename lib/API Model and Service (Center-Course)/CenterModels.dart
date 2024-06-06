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

class BatchNo {
  final int id;
  final String number;
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
