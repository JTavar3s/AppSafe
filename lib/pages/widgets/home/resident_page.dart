import 'package:flutter/material.dart';

class ResidentPage extends StatefulWidget {
  const ResidentPage({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  State<ResidentPage> createState() => _ResidentPageState();
}

class _ResidentPageState extends State<ResidentPage> {
  late TextEditingController blocController;
  late TextEditingController apartmentController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    blocController = TextEditingController();
    apartmentController = TextEditingController();
    addressController = TextEditingController();
  }

  @override
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Container(
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 70,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Olá, ${widget.name}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
                SafeFaceTextFormField(
                  title: 'Bloco',
                  controller: blocController,
                ),
                SafeFaceTextFormField(
                  title: 'Apartamento',
                  controller: apartmentController,
                ),
                SafeFaceTextFormField(
                  title: 'Endereço',
                  controller: addressController,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  child: Text(
                    'SALVAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SafeFaceTextFormField extends StatelessWidget {
  const SafeFaceTextFormField({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          Container(
            width: 230,
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue),
              borderRadius: BorderRadius.circular(7),
            ),
            child: TextFormField(
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
