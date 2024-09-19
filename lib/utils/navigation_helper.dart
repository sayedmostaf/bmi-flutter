import 'package:flutter/material.dart';

void navigateToPage(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

void navigateToPageAndRemoveUntil(
    BuildContext context, Widget page, bool route) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => page),
    (r) => route,
  );
}
