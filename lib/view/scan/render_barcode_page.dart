import 'package:barcode_widget/barcode_widget.dart';
import 'package:find_me/view/widgets/appbarwideget.dart';
import 'package:flutter/material.dart';

class BarCodeCreate extends StatefulWidget {
  const BarCodeCreate({Key? key})
      : super(key: key); // Key should be Key?, and corrected typo

  @override
  State<BarCodeCreate> createState() => _BarCodeCreateState();
}

class _BarCodeCreateState extends State<BarCodeCreate> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1E1),
      appBar: const AppBarWidget(title: "Generate BarCode"),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 6,
                  shadowColor: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: controller.text,
                      backgroundColor: Colors.white,
                      height: 200,
                      width: 200,
                      drawText: true,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: buildTextField(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
        cursorColor: const Color(0xFFDF9A4F),
        style:
            const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: "Enter the data",
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.done,
              size: 30,
              color: Color.fromARGB(255, 97, 84, 72),
            ),
            splashRadius: 10,
            onPressed: () {
              setState(() {});
            },
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.fromLTRB(50, 5, 1, 10),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xFFDF9A4F), width: 2),
              gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFFDF9A4F), width: 2),
              gapPadding: 10),
        ),
      );
}
