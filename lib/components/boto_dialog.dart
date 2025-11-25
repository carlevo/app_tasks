import 'package:flutter/material.dart';

class BotoDialog extends StatelessWidget {
  final String text;
  final Color colorBoto;
  final Icon iconBtn;
  final Function()? accioBoto;

  const BotoDialog({
    super.key,
    required this.text,
    required this.colorBoto,
    required this.iconBtn,
    this.accioBoto,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: accioBoto,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: colorBoto,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          children: [Icon(iconBtn.icon), SizedBox(width: 8), Text(text)],
        ),
      ),
    );
  }
}
