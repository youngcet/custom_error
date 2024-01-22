import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:custom_error/custom_error_manager.dart';
import 'package:custom_error/custom_error.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Error Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Custom Error Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController = TextEditingController();
  String _inputText = '';
  List<String> names = ['Yung', 'Cet', 'Cedric'];

  void _validate() {
    CustomError error = CustomError();
    String inputName = _textController.text;

    if (!names.contains(inputName)) {
      error.setError(-1, 'Name not found.');
    }

    setState(() {
      _inputText = (error.hasAnError())
          ? 'Error: ${error.getError()} - Code: ${error.getErrorCode()}'
          : _textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: 'Enter text'),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _validate,
                    child: Text('Validate'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      CustomError customError = CustomError();
                      customError.addError(100, 'This is error 100');
                      customError.addError(101, 'This is error 101');
                      customError.addError(102, 'This is error 102');
                      setState(() {
                        _inputText = '${customError.getAllErrors()}';
                      });
                    },
                    child: Text('Show Multiple Errors'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      CustomError customError = CustomError();
                      customError.setError(-1, 'Showing Error Dialog');

                      // add dialog buttons
                      final actions = <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        )
                      ];

                      CustomErrorManager.showDialogIfError(
                          context,
                          customError,
                          'Error Dialog',
                          null, // when null is set, customError.getError() is used
                          actions);
                    },
                    child: Text('Show Error Dialog'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      CustomError customError = CustomError();
                      customError.setError(-1, 'Showing Error SnackBar');
                      CustomErrorManager.showSnackBarIfError(
                          context, customError,
                          behavior: SnackBarBehavior.fixed);
                    },
                    child: Text('Show Error SnackBar'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      CustomErrorManager customErrorManager =
                          CustomErrorManager();
                      // logging a warning message
                      customErrorManager.log(w: 'Warning Message');

                      // logging an error message
                      customErrorManager.log(e: 'Error Message');

                      // logging an info message
                      customErrorManager.log(i: 'Info Message');

                      // logging a debug message
                      customErrorManager.log(d: 'Debug Message');

                      // logging a fatal message
                      customErrorManager.log(f: 'Fatal Message');

                      // logging a trace message
                      customErrorManager.log(t: 'Trace Message');

                      setState(() {
                        _inputText = 'check console for output';
                      });
                    },
                    child: Text('Log Error'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      // SENDING ERRORS TO A SERVER
                      // final data = {}; // data to post
                      // CustomErrorManager customErrorManager = CustomErrorManager();
                      // await customErrorManager.sendToServer(
                      //   url: 'url', // endpoint
                      //   methodType: 'post', // method type (Only POST && GET supported)
                      //   headers: <String, String>{    // headers
                      //     'Content-Type': 'application/json',
                      //   },
                      //   body: jsonEncode(data) // encode the data
                      // );
                      
                      // EMAILING THE ERROR USING CustomManager
                      CustomErrorManager customErrorManager =
                          CustomErrorManager();
                      await customErrorManager.emailLog(
                          message: 'An error has occured',
                          recipient:
                              'cmaenetja@gmail.com', // you can add multiple recipients by , separating (e.g. recipient1,recipient2)
                          appTitle: 'Custom Error Demo');

                      setState(() {
                        _inputText = 'check console for output';
                      });
                    },
                    child: Text('Email Log'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Response: $_inputText'),
              ),
            ],
          ),
        ));
  }
}
