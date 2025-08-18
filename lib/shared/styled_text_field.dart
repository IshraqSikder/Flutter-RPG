import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledTextfield extends StatelessWidget {
  const StyledTextfield({
    super.key,
    required this.label,
    this.icon,
    this.controller,
  });

  final String label;
  final IconData? icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.textColor,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        label: StyledText(label),
      ),
      style: GoogleFonts.kanit(
        textStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
