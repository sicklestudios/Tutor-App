import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tutorapp/colors.dart';
import 'package:tutorapp/teacher/teacherModel/teacher_model.dart';

class SearchTeacherProfile extends StatefulWidget {
  final TeacherModel model;
  const SearchTeacherProfile({required this.model, super.key});

  @override
  State<SearchTeacherProfile> createState() => _SearchTeacherProfileState();
}

class _SearchTeacherProfileState extends State<SearchTeacherProfile> {
  late TeacherModel model;
  @override
  void initState() {
    super.initState();
    model = widget.model;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          'Teacher Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      CachedNetworkImageProvider(model.teacherPhotoUrl),
                ),
                const SizedBox(
                  width: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          model.teacherName,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: model.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        glow: false,
                        ignoreGestures: true,
                        itemSize: 30,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          // size: 20,
                        ),
                        onRatingUpdate: (rating) {
                          log(rating.toString());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: SizedBox(
                width: size.width,
                height: size.height / 1.38,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: const [
                              Text("Bio: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width / 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(model.bio,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: const [
                              Text("Information: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width / 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text("Home tution Available: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    (model.homeTutionAvailable
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.green,
                                            size: 30,
                                          )
                                        : const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                            size: 30,
                                          )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("Contact: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text(model.contactNumber,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("Location: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Expanded(
                                      child: Text(
                                          "${model.address.street}, ${model.address.city}, ${model.address.area}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: const [
                              Text("About: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width / 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text("Qualification: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Expanded(
                                      child: Text(model.qualification,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400)),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text("Experience: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Text("${model.yearsExperience} years",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
