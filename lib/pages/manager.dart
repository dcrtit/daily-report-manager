import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:report_manager/config.dart';
import 'package:report_manager/services/api_service.dart';
import 'package:report_manager/models/report_response_model.dart';
import 'package:report_manager/services/shared_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({Key? key}) : super(key: key);

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  List<Message> reports = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/logo_short.png',
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          'Report Manager',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                SharedService.logout(context);
              },
              icon: const Icon(Icons.logout, color: Colors.deepPurple),
          ),
        ],
      ),
      body: reportWidget(),
    );
  }

  Widget reportWidget() {
    return FutureBuilder(
      future: APIService.reports(),
      builder: (BuildContext context, AsyncSnapshot<String> model) {
        if (model.hasData) {
          return Center(child: Text(model.data!));
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  // Future<void> initReportData(BuildContext context) async {
  //   setState(() {
  //     isAPICallProcess = true;
  //   });
  //
  //   APIService.reports().then((value) {
  //     setState(() {
  //       isAPICallProcess = false;
  //     });
  //
  //     if (value != '') {
  //       setState(() {
  //         reports = jsonDecode(value);
  //       });
  //     } else {
  //       FormHelper.showSimpleAlertDialog(
  //         context,
  //         Config.appName,
  //         'Error: Data fetching is failed. Check debugger...',
  //         'Blyat',
  //         () => null,
  //       );
  //     }
  //   });
  // }
}
