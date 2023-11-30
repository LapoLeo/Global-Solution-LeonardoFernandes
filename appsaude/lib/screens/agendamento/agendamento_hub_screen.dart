import 'package:flutter/material.dart';
import 'package:appsaude/screens/agendamento/about.dart';
import 'package:appsaude/screens/agendamento/agendamento_screen.dart';
import 'package:appsaude/screens/agendamento/consultas_anteriores.dart';
import 'package:appsaude/widgets/card_option.dart';
// import 'package:intl/intl.dart';

class AgendamentoHubScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Agendamentos'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardOption(
                  icon: Icons.document_scanner,
                  title: 'Agendar consulta',
                  page: AgendamentoExamePage()),
              CardOption(
                  icon: Icons.book,
                  title: 'Consultas anteriores',
                  page: ConsultasFeitasScreen()),
              CardOption(
                  icon: Icons.help,
                  title: 'Orientações sobre agendamento',
                  page: AboutAgendamentoScreen())
            ],
          ),
        ));
  }
}
