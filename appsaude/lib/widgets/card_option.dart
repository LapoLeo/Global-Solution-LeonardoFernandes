import 'package:flutter/material.dart';
import 'package:appsaude/screens/agendamento/agendamento_screen.dart';

class CardOption extends StatelessWidget {
  const CardOption(
      {super.key, required this.icon, required this.title, required this.page});

  final IconData icon;
  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
            transitionDuration: Duration(milliseconds: 200),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
      },
      child: Container(
          margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 20,
              ),
              Text(title),
              Expanded(
                child: Container(),
              ),
              Icon(Icons.arrow_forward)
            ],
          )),
    );
  }
}
