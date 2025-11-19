import 'package:booka/stylings.dart';
import 'package:flutter/material.dart';

class Myswitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const Myswitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: const Alignment(1, -1),
      scale: 0.8, // Adjust this value to make switch smaller or larger
      child: Switch(
        value: value,
        onChanged: onChanged,
        trackOutlineColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.transparent; // Color when switch is ON
            }
            return Colors.transparent; // Color when switch is OFF
          },),
        activeColor: Colors.white,
        activeTrackColor: Stylings.accentBlue,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}

