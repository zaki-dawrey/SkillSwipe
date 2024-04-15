import 'package:flutter/material.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'utils.g.dart';

extension BuildContextExt on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAlert(
    String message,
  ) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(milliseconds: 2000),
        ),
      );

  Future<T?> showBottomSheet<T>({
    required Widget child,
  }) =>
      showModalBottomSheet<T>(
        context: this,
        builder: (_) => child,
      );
}

// @riverpod
// String imageUrl(
//   ImageUrlRef ref, {
//   required String department,
//   required String year,
//   required String filename,
// }) {
//   final storageUrl = ref.read(noticeRepositoryProvider).storageUrl;
//   return '$storageUrl/object/public/noticebucket/$year/$department/$filename';
// }