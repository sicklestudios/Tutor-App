import 'package:tutorapp/models/address_model.dart';

class TeacherModel {
  String teacherName;
  String teacherPhotoUrl;
  String bio;
  List<String> subjects;
  double rating;
  bool homeTutionAvailable;
  String contactNumber;
  AddressModel address;
  String qualification;
  double yearsExperience;

  TeacherModel({
    required this.teacherName,
    required this.teacherPhotoUrl,
    required this.bio,
    required this.subjects,
    required this.rating,
    required this.homeTutionAvailable,
    required this.contactNumber,
    required this.address,
    required this.qualification,
    required this.yearsExperience,
  });
  Map<String, dynamic> toMap() {
    return {
      'teacherName': teacherName,
      'teacherPhotoUrl': teacherPhotoUrl,
      'bio': bio,
      'subjects': subjects,
      'rating': rating,
      'homeTutionAvailable': homeTutionAvailable,
      'contactNumber': contactNumber,
      'address': address,
      'qualification': qualification,
      'yearsExperience': yearsExperience,
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      teacherName: map['teacherName'],
      teacherPhotoUrl: map['teacherPhotoUrl'],
      bio: map['bio'],
      subjects: map['subjects'],
      rating: map['rating'],
      homeTutionAvailable: map['homeTutionAvailable'],
      contactNumber: map['contactNumber'],
      address: map['address'],
      qualification: map['qualification'],
      yearsExperience: map['yearsExperience'],
    );
  }
}

List<TeacherModel> teachers = [
  TeacherModel(
      teacherName: "Zain",
      teacherPhotoUrl:
          "https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=170667a&w=0&k=20&c=MRMqc79PuLmQfxJ99fTfGqHL07EDHqHLWg0Tb4rPXQc=",
      bio:
          "Hey there I am a teacher with a very good experience in my subjects as well as I can teach very well and I am good at it. I have also teached at the University of Tusmania",
      subjects: ["English"],
      rating: 2.5,
      homeTutionAvailable: false,
      contactNumber: "0123456789",
      address:
          AddressModel(street: "Street 9", city: "Taxila", area: "Naseerabad"),
      qualification: "Masters in Computer",
      yearsExperience: 3),
  TeacherModel(
      teacherName: "Muhammad Ali Arif",
      teacherPhotoUrl:
          "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",
      bio:
          "Hey there I am a teacher with a very good experience in my subjects as well as I can teach very well and I am good at it. I have also teached at the University of Tusmania",
      subjects: ["Maths", "English", "Computer"],
      rating: 4.5,
      homeTutionAvailable: true,
      contactNumber: "0123456789",
      address:
          AddressModel(street: "Street 9", city: "Taxila", area: "Naseerabad"),
      qualification: "Masters in Computer",
      yearsExperience: 3.2),
  TeacherModel(
      teacherName: "Asim",
      teacherPhotoUrl:
          "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
      bio:
          "Hey there I am a teacher with a very good experience in my subjects as well as I can teach very well and I am good at it. I have also teached at the University of Tusmania",
      subjects: ["Computer", "Physics"],
      rating: 2.5,
      homeTutionAvailable: false,
      contactNumber: "0123456789",
      address:
          AddressModel(street: "Street 9", city: "Taxila", area: "Naseerabad"),
      qualification: "Masters in Computer",
      yearsExperience: 3),
  TeacherModel(
      teacherName: "Sheikh",
      teacherPhotoUrl:
          "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg",
      bio:
          "Hey there I am a teacher with a very good experience in my subjects as well as I can teach very well and I am good at it. I have also teached at the University of Tusmania",
      subjects: ["English"],
      rating: 3.5,
      homeTutionAvailable: false,
      contactNumber: "0123456789",
      address:
          AddressModel(street: "Street 9", city: "Taxila", area: "Naseerabad"),
      qualification: "Masters in Computer",
      yearsExperience: 3),
];
