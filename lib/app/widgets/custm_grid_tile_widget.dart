import 'package:flutter/material.dart';

class CustomGridTileWidget extends StatelessWidget {
  CustomGridTileWidget(
      {super.key, required this.header, this.icon, required this.onTap});
  VoidCallback onTap;
  String header;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 2, color: Theme.of(context).primaryColor),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFB6C6D4),
                spreadRadius: -8,
                blurRadius: 21.0,
                offset: Offset(10, 10),
              ),
              BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.5),
                blurRadius: 6,
                offset: Offset(-3, -4),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    size: 60,
                  )
                : const SizedBox.shrink(),
            Text(
              header,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
