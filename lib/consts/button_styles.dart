
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonStyle {
  static ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: AppColor.primary, // Background color
  );

  static ButtonStyle secondary =
      ElevatedButton.styleFrom(backgroundColor: AppColor.secondary);

  static ButtonStyle green =
      ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent);

    static ButtonStyle red =
      ElevatedButton.styleFrom(backgroundColor: Colors.redAccent);

  static ButtonStyle whiteOutline = ElevatedButton.styleFrom(
      elevation: 3,
      backgroundColor: AppColor.white,
      foregroundColor: AppColor.primary // Background color
      );
}