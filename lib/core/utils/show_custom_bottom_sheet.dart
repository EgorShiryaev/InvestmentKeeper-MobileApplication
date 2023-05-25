import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomBottomSheet(
  BuildContext context, {
  required Widget bottomSheet,
}) {
  final surfaceColor = Theme.of(context).colorScheme.surface;
  Get.bottomSheet(bottomSheet, backgroundColor: surfaceColor);
}
