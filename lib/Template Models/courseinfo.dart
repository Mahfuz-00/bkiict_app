class Course {
  late String name;
  late int batchno;
  late int coursefee;
  late int classes;
  late String duration;
  late String startdate;
  late String classshift;
  late String registrationbefore;
  bool isExpanded;

  Course({
    required this.name,
    required this.batchno,
    required this.coursefee,
    required this.classes,
    required this.duration,
    required this.startdate,
    required this.classshift,
    required this.registrationbefore,
    this.isExpanded = false,
  });
}