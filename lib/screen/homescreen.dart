import 'package:exercise2/screen/detailscreen.dart';
import 'package:exercise2/widget/footer_widget.dart';
import 'package:exercise2/widget/form_widget.dart';
import 'package:exercise2/widget/header_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var nama = TextEditingController();
    var alamat = TextEditingController();
    var notelp = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                HeaderWidget(),
                FormWidget(
                    formKey: formKey,
                    etNama: nama,
                    etAlamat: alamat,
                    etNotelp: notelp),
                FooterWidget(
                  onPressedNext: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                             
                            ),
                          ),
                          (route) => false);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Data diproses")));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}