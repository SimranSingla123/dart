//@dart=2.1
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Form "),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
                initialValue: {
                  'date': DateTime.now(),
                  'accept_terms': false,
                },

                child: Column(
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'name',
                      decoration: InputDecoration(labelText: "Full Name"),
                    ),
                    FormBuilderDateTimePicker(
                      name: "date",
                      inputType: InputType.date,
                      //validators: [FormBuilderValidators.required()],
                      format: DateFormat("dd-MM-yyyy"),
                      decoration: InputDecoration(labelText: "Date of Birth"),
                    ),
                    FormBuilderDropdown(
                      name: "gender",
                      decoration: InputDecoration(labelText: "Gender"),
                      // initialValue: 'Male',
                      //
                     // validators: [FormBuilderValidators.required()],
                      items: ['Male', 'Female', 'Other']
                          .map((gender) => DropdownMenuItem(
                          value: gender, child: Text("$gender")))
                          .toList(),
                    ),
                    FormBuilderTextField(
                      name: "age",
                      decoration: InputDecoration(labelText: "Age"),
                      keyboardType: TextInputType.number,
                      // validators: [
                      //   FormBuilderValidators.numeric(),
                      //   FormBuilderValidators.max(70),
                      // ],
                    ),
                    FormBuilderTextField(
                      name: 'number',
                      keyboardType: TextInputType.number,
                      //validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(labelText: "Mobile Number"),
                    ),
                    FormBuilderTextField(
                      name: 'address',
                      //validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(labelText: "Address"),
                    ),

                    FormBuilderCheckboxGroup(
                      decoration:
                      InputDecoration(labelText: "Languages you know"),
                      name: "languages",
                      initialValue: ["English"],
                      options: [
                        FormBuilderFieldOption(value: "English"),
                        FormBuilderFieldOption(value: "Hindi"),
                        FormBuilderFieldOption(value: "Other")
                      ],
                    ),
                    FormBuilderRadioGroup(name: "name",
                        decoration: InputDecoration(labelText: "Are you "
                            "graduated?",labelStyle: TextStyle(fontStyle:
                        FontStyle.italic)),
                        options: [FormBuilderFieldOption(value: "Yes"),
                          FormBuilderFieldOption(value: "No")]),
                    FormBuilderCheckbox(
                      name: 'accept_terms',
                      title: Text(
                          "I have read and agree to the terms and conditions"),

                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    child: Text("Submit"),

                    onPressed: () {
                      _fbKey.currentState?.save();
                      if (_fbKey.currentState?.validate() == true) {
                        print(_fbKey.currentState?.value);
                      }
                    },
                  ),
                  MaterialButton(
                    child: Text("Reset"),
                    onPressed: () {
                      _fbKey.currentState?.reset();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
