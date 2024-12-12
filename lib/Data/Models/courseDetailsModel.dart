/// Represents a coordinator for a course.
///
/// This class holds the details of a course coordinator.
///
/// **Variables:**
/// - [name]: A String representing the name of the coordinator.
/// - [photo]: A nullable String representing the photo URL of the coordinator.
///
/// **Actions:**
/// - [fromJson]: A factory constructor that creates a Coordinator instance from a JSON map.
/// - [toJson]: A method that converts the Coordinator instance to a JSON map.
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

/// Represents an instructor for a course.
///
/// This class holds the details of a course instructor.
///
/// **Variables:**
/// - [name]: A String representing the name of the instructor.
/// - [photo]: A nullable String representing the photo URL of the instructor.
///
/// **Actions:**
/// - [fromJson]: A factory constructor that creates an Instructor instance from a JSON map.
/// - [toJson]: A method that converts the Instructor instance to a JSON map.
class Instructor {
  final String name;
  final String? photo;

  Instructor({
    required this.name,
    required this.photo,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      name: json['name'].toString(),
      photo: json['photo'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
    };
  }
}

/// Represents the details of a course.
///
/// This class contains all the relevant information about a course.
///
/// **Variables:**
/// - [id]: An integer representing the unique identifier of the course.
/// - [name]: A String representing the name of the course.
/// - [overview]: A String providing an overview of the course.
/// - [requirements]: A String listing the requirements for the course.
/// - [project]: A String describing the course project.
/// - [tools]: A String listing the tools used in the course.
/// - [outline]: A String representing the course outline.
/// - [duration]: A String indicating the duration of the course.
/// - [hours]: A String specifying the number of hours for the course.
/// - [fee]: A String representing the course fee.
/// - [shift]: A String indicating the shift of the course.
/// - [classes]: A String specifying the number of classes in the course.
/// - [type]: A String indicating the type of the course.
/// - [center]: A String representing the center where the course is held.
/// - [batch]: A String representing the batch number for the course.
/// - [regdeadline]: A String specifying the registration deadline for the course.
/// - [classstart]: A String indicating the start date of the class.
/// - [batchend]: A String indicating the end date of the batch.
/// - [status]: A String representing the current status of the course.
/// - [coordinator]: A Coordinator instance representing the coordinator of the course.
/// - [instructors]: A List of Instructor instances representing the instructors for the course.
///
/// **Actions:**
/// - [fromJson]: A factory constructor that creates a CourseDetail instance from a JSON map.
/// - [toJson]: A method that converts the CourseDetail instance to a JSON map.
class CourseDetails {
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

  CourseDetails({
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

  factory CourseDetails.fromJson(Map<String, dynamic> json) {
    var instructorsFromJson = json['instructors'] as List;
    List<Instructor> instructorsList =
        instructorsFromJson.map((i) => Instructor.fromJson(i)).toList();

    return CourseDetails(
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
