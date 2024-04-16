import 'package:flutter/material.dart';
import 'package:skillswap/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Logout',
    content: 'Are you sure you want to logout?',
    optionsBuilder: () => {
      'Cancel': false,
      'Logout': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
