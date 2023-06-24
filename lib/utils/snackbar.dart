import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 10, left: 6, right: 6),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 214, 167, 244),
      duration: const Duration(
        seconds: 3,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const Icon(Icons.check_circle_outline)
        ],
      ),
      elevation: 6,
    ),
  );
}
