import 'dart:io';

import 'package:exercise2/controller/kuliner_controller.dart';
import 'package:exercise2/model/kuliner.dart';
import 'package:exercise2/screen/homescreen.dart';
import 'package:exercise2/screen/mapscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  File? _image;
  final _imagePicker = ImagePicker();
  String? _alamat;

  final _formKey = GlobalKey<FormState>();
  final _nama_wisataController = TextEditingController();
  final _reviewController = TextEditingController();
  final _notelpController = TextEditingController();

  final KulinerController _personController = KulinerController();

  Future<void> getImage() async {
    final XFile? pickerFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (pickerFile != null) {
          _image = File(pickerFile.path);
        } else {
          print("No image selected");
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Kontak"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 200, 210, 214),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "nama_wisata", hintText: "Masukkan nama_wisata"),
                  controller: _nama_wisataController,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Review", hintText: "Masukkan Review"),
                  controller: _reviewController,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Alamat"),
                    _alamat == null
                        ? const SizedBox(
                            width: double.infinity,
                            child: Text('Alamat kosong'))
                        : Text('$_alamat'),
                    _alamat == null
                        ? TextButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapScreen(
                                      onLocationSelected: (selectedAddress) {
                                    setState(() {
                                      _alamat = selectedAddress;
                                    });
                                  }),
                                ),
                              );
                            },
                            child: const Text('Pilih Alamat'),
                          )
                        : TextButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MapScreen(
                                      onLocationSelected: (selectedAddress) {
                                    setState(() {
                                      _alamat = selectedAddress;
                                    });
                                  }),
                                ),
                              );
                              setState(() {});
                            },
                            child: const Text('Ubah Alamat'),
                          )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "No Telepon", hintText: "Masukkan No Telepon"),
                  controller: _notelpController,
                ),
              ),
              // _image == null
              //     ? const Text("Tidak ada data yang dipilih")
              //     : Image.file(_image!),
              // ElevatedButton(
              //   onPressed: () {
              //     getImage();
              //   },
              //   child: const Text("Pilih Gambar"),
              // ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      //Proses simpan data
                      Kuliner _wisata = Kuliner(
                        nama_wisata: _nama_wisataController.text,
                        review: _reviewController.text,
                        alamat: _alamat ?? '',
                        telepon: _notelpController.text,
                      );
                      var result =
                          await _personController.addKuliner(_wisata,);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result['message']),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()),
                        (route) => false,
                      );
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}