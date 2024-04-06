import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.label,
    required this.bgColor,
    required this.textColor,
    required this.infoLabel,
  });
  final String label;
  final String infoLabel;
  final Color bgColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 250,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 100,
                  color: textColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                infoLabel,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                  letterSpacing: 10,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
