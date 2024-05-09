
import 'package:exercise2/controller/kuliner_controller.dart';
import 'package:exercise2/model/kuliner.dart';
import 'package:exercise2/screen/formscreen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final KulinerController _controller = KulinerController();

  @override
  void initState() {
    super.initState();
    _controller.getKuliner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Wisata Kuliner'),
      ),
      body: FutureBuilder<List<Kuliner>>(
        future: _controller.getKuliner(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Kuliner wisata = snapshot.data![index];
                return ListTile(
                  title: Text(wisata.nama_wisata),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
