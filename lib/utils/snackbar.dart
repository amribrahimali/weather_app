import 'package:flutter/material.dart';

void showFailedSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 14,
              backgroundColor: Color(0xffFF6D6D),
              child: Icon(
                Icons.close,
                size: 14,
                color: Color(0xff262A33),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.white,
                      height: 1.3,
                      fontSize: 12,
                    ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xff262A33),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
}
