import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutorapp/colors.dart';
import 'package:tutorapp/students/search_teacher_profile_info.dart';
import 'package:tutorapp/teacher/teacherModel/teacher_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode focusNode = FocusNode();
  TextEditingController searchController = TextEditingController();
  String searchedString = "";
  List<TeacherModel> teachersList = [];
  @override
  void initState() {
    super.initState();
    setList();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          // leading: Center(
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: const Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
          title: const Text(
            'Search Screen',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        focusNode: focusNode,
                        controller: searchController,
                        onFieldSubmitted: (value) {
                          setState(() {
                            searchedString = value;
                          });
                          setList();
                        },
                        autofocus: false,
                        onChanged: ((value) {
                          searchedString = "";
                          if (value == "") {
                            setList();
                          }
                        }),
                        decoration: InputDecoration(
                          hintText: 'Search Subject',
                          suffixIcon: const Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: mainColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: mainColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list_outlined))
                ],
              ),
              ListView.builder(
                  itemCount: teachersList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _teacherCard(teachersList[index]);
                  })
            ],
          ),
        ),
      ),
    );
  }

  void setList() {
    teachersList = [];
    if (searchedString == "") {
      teachersList = teachers;
    } else {
      teachers.forEach((element) {
        var val =
            element.subjects.map((values) => values.toLowerCase()).toList();
        if (val.contains(searchedString.toLowerCase())) {
          teachersList.add(element);
        }
      });
    }
    setState(() {});
  }

  showAddToContact() async {
    var size = MediaQuery.of(context).size;
    return await showDialog(
        barrierDismissible: true,
        context: context,
        builder: ((context) => SimpleDialog(
              title: Row(
                children: [
                  const Expanded(child: Center(child: Text("Filter"))),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              contentPadding: const EdgeInsets.all(8),
              children: [Text("Yet to be Implemented")],
            )));
  }

  _teacherCard(TeacherModel model) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SearchTeacherProfile(model: model)));
        },
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(model.teacherPhotoUrl),
        ),
        title: Text(
          model.subjects.length >= 2
              ? model.subjects.length >= 3
                  ? "${model.subjects[0]}, ${model.subjects[1]}, ${model.subjects[2]}"
                  : "${model.subjects[0]}, ${model.subjects[1]}"
              : model.subjects[0],
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(model.teacherName),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(model.rating.toString())
          ],
        ),
      ),
    );
  }
}
