import 'package:flutter/material.dart';
import 'package:responsi1/model/ikan.dart';
import 'package:responsi1/ui/ikan_form.dart';
import 'package:responsi1/ui/ikan_detail.dart';

class IkanPage extends StatefulWidget {
  const IkanPage({Key? key}) : super(key: key);

  @override
  _IkanPageState createState() => _IkanPageState();
}

class _IkanPageState extends State<IkanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List Ikan'),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  child: const Icon(Icons.add, size: 26.0),
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => IkanForm()));
                  },
                ))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.logout),
                onTap: () async {},
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            ItemIkan(
                ikan: Ikan(
                    id: 121,
                    nama: 'Mul',
                    jenis: 'sapu-sapu',
                    warna: 'pinky',
                    habitat: 'ciniru'
                ))],
        ));
  }
}

class ItemIkan extends StatelessWidget {
  final Ikan ikan;

  const ItemIkan({Key? key, required this.ikan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    IkanDetail(
                      ikan: ikan,
                    )));
      },
      child: Card(
        child: ListTile(
          title: Text(ikan.nama!),
          subtitle: Text(ikan.jenis.toString()),
        ),
      ),
    );
  }
}