import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'main.dart';
import 'upload.dart';

class SecondScreen extends StatefulWidget {
  final String url;

  SecondScreen({
    required this.url,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState(url: url);
}

class _SecondScreenState extends State<SecondScreen> {
  String url;

  _SecondScreenState({
    required this.url,
  });

  GoogleSignIn _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;
  TextEditingController title = TextEditingController();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  var options = [
    'PDF',
    'Image',
    'Video',
  ];
  bool value = false;
  var _currentItemSelected = "PDF";

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('folders')
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: 39,
          height: 30,
          child: CircleAvatar(
            foregroundImage: NetworkImage(url),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _googleSignIn.signOut().then((value) {
                setState(() {});
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                );
              }).catchError((e) {});
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
        title: Row(
          children: [Text(user.displayName.toString())],
        ),
      ),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                padding: EdgeInsets.all(16.0),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UploadScreen(
                            url: url,
                            did: document.id,
                            type: data['type'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.folder,
                          color: Colors.amber,
                          size: 50,
                        ),
                        title: Text(data['name']),
                        subtitle: Text(data['type']),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () async {
                await showInformationDialog(context);
              },
              child: Icon(
                Icons.add,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        bool isChecked = false;
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: title,
                    validator: (value) {
                      // Add your validation logic here if needed
                    },
                    decoration: InputDecoration(hintText: "Please Enter Text"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton<String>(
                    dropdownColor: Colors.amber,
                    isDense: true,
                    isExpanded: false,
                    iconEnabledColor: Colors.blue,
                    items: options.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValueSelected) {
                      setState(() {
                        _currentItemSelected = newValueSelected!;
                        print(_currentItemSelected);
                      });
                    },
                    value: _currentItemSelected,
                  ),
                ],
              ),
            ),
            title: Text('Add a New Folder'),
            actions: <Widget>[
              InkWell(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                child: Text(
                  'Create',
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  if (title.text.isNotEmpty) {
                    User? user = _auth.currentUser;
                    ref.doc(user!.uid).collection('folders').add({
                      'name': title.text,
                      'type': _currentItemSelected,
                    });
                    title.clear();
                    Navigator.of(context).pop();
                  }
                },
              ),
              SizedBox(
                width: 20,
              ),
            ],
          );
        });
      },
    );
  }
}
