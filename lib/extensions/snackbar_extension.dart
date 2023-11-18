
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_challenge/api/api_response.dart';

extension AppErrorCatching on BuildContext {

  void catchError(ApiError error) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(this).hideCurrentSnackBar();
      ScaffoldMessenger.of(this).showSnackBar(
          buildSnackBar(error.data, false)
      );
    });
  }


  SnackBar buildSnackBar(String text, bool state, {Function? action}) {
    return SnackBar(
      margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
      padding:
      const EdgeInsets.only(left: 15.0, right: 15.0, top: 10, bottom: 10),
      behavior: SnackBarBehavior.floating,
      backgroundColor: state ? Colors.green : Colors.redAccent,
      content: Row(
        children: [
          Icon(
            state ? Icons.check_circle : Icons.error,
            color: Colors.white,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(child: Text(text)),
          Visibility(
            visible: action != null,
            child: TextButton(
                onPressed: () {
                  action!();
                  action = null;
                },
                child: const Text("View")),
          )
        ],
      ),
    );
  }
}