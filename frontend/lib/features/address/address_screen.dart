import 'package:ea_software/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/EA.png',
                height: 45,
                width: 45,
                color: Colors.black,
              ),
            ),
            const Text(
              '',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(

      ),
    );
  }
}