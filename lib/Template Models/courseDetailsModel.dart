class Coordinator {
  final String name;
  final String? photo;

  Coordinator({
    required this.name,
    required this.photo,
  });

  factory Coordinator.fromJson(Map<String, dynamic> json) {
    return Coordinator(
      name: json['name'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
    };
  }
}

class Instructor {
  final String name;
  final String? photo;

  Instructor({
    required this.name,
    required this.photo,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      name: json['name'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
    };
  }
}

class CourseDetail {
  final int id;
  final String name;
  final String overview;
  final String requirements;
  final String project;
  final String tools;
  final String outline;
  final String duration;
  final String hours;
  final String fee;
  final String shift;
  final String classes;
  final String type;
  final String center;
  final String batch;
  final String regdeadline;
  final String classstart;
  final String batchend;
  final String status;
  final Coordinator coordinator;
  final List<Instructor> instructors;

  CourseDetail({
    required this.id,
    required this.name,
    required this.overview,
    required this.requirements,
    required this.project,
    required this.tools,
    required this.outline,
    required this.duration,
    required this.hours,
    required this.fee,
    required this.shift,
    required this.classes,
    required this.type,
    required this.center,
    required this.batch,
    required this.regdeadline,
    required this.classstart,
    required this.batchend,
    required this.status,
    required this.coordinator,
    required this.instructors,
  });

  factory CourseDetail.fromJson(Map<String, dynamic> json) {
    var instructorsFromJson = json['instructors'] as List;
    List<Instructor> instructorsList =
        instructorsFromJson.map((i) => Instructor.fromJson(i)).toList();

    return CourseDetail(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      requirements: json['requirements'],
      project: json['project'],
      tools: json['tools'],
      outline: json['outline'],
      duration: json['duration'],
      hours: json['hours'],
      fee: json['fee'],
      shift: json['shift'],
      classes: json['classes'],
      type: json['type'],
      center: json['center'],
      batch: json['batch_number'],
      regdeadline: json['reg_deadline'],
      classstart: json['class_start'],
      batchend: json['batch_end'],
      status: json['status'],
      coordinator: Coordinator.fromJson(json['cordinator']),
      instructors: instructorsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'overview': overview,
      'requirements': requirements,
      'project': project,
      'tools': tools,
      'outline': outline,
      'duration': duration,
      'hours': hours,
      'fee': fee,
      'shift': shift,
      'classes': classes,
      'type': type,
      'center': center,
      'batch_number': batch,
      'reg_deadline': regdeadline,
      'class_start': classstart,
      'batch_end': batchend,
      'status': status,
      'cordinator': coordinator.toJson(),
      'instructors': instructors.map((i) => i.toJson()).toList(),
    };
  }
}
