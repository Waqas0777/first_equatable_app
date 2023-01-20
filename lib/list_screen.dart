import 'package:first_equatable_app/model_person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late FocusNode myFocusNode;
  ModelPerson? postModel;
  List<ModelPerson> modelPersonList = [];
  TextEditingController ageController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Screen"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                focusNode: myFocusNode,
                controller: idController,
                onChanged: (val) {},
                decoration: InputDecoration(
                  labelText: "Enter id",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: usernameController,
                onChanged: (val) {},
                decoration: InputDecoration(
                  labelText: "Enter Username",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: genderController,
                onChanged: (val) {},
                decoration: InputDecoration(
                  labelText: "Enter Gender",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: ageController,
                onChanged: (val) {},
                decoration: InputDecoration(
                  labelText: "Enter Age",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CupertinoButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    postModel = ModelPerson(
                        int.parse(idController.text.toString().trim()),
                        usernameController.text.trim(),
                        genderController.text.trim(),
                        int.parse(ageController.text.trim()));
                    if (modelPersonList.contains(postModel)) {
                      return showErrorMessage();
                    } else {
                      modelPersonList.add(postModel!);
                    }
                    //clearing text-field
                    idController.clear();
                    usernameController.clear();
                    genderController.clear();
                    ageController.clear();
                  });
                  myFocusNode.requestFocus();
                  FocusScope.of(context).requestFocus(FocusNode());
                  // addData(idController.text, usernameController.text,
                  //     genderController.text, ageController.text);
                },
                child: const Text("Add"),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: modelPersonList.length,
                    itemBuilder: (BuildContext context, index) {
                      var listData = modelPersonList[index];

                      return modelPersonList.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text("No Data Added yet"),
                            )
                          : Card(
                              elevation: 5,
                              shadowColor: const Color(0xffe4ece8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                leading: Text("Id : ${listData.id}"),
                                title: Text("User Name : ${listData.username}"),
                                subtitle: Text("Gender : ${listData.gender} "),
                                trailing: Text("Age : ${listData.age}"),
                              ),
                            );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showErrorMessage() {
    Fluttertoast.showToast(
        msg: "Record is Already in List",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
