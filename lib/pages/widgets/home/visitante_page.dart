import 'package:flutter/material.dart';

class VisitantePage extends StatefulWidget {
  const VisitantePage({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  State<VisitantePage> createState() => _VisitantePageState();
}

class _VisitantePageState extends State<VisitantePage> {
  late TextEditingController novoVisitanteController;
  late TextEditingController idadeVisitanteController;
  late TextEditingController emailVisitanteController;

  @override
  void initState() {
    super.initState();
    novoVisitanteController = TextEditingController();
    idadeVisitanteController = TextEditingController();
    emailVisitanteController = TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          height: 1500,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                Container(
                  height: 380,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                     bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
