import 'package:flutter/material.dart';
import 'package:responsi1/model/ikan.dart';

class IkanForm extends StatefulWidget {
  Ikan? ikan;

  IkanForm({Key? key, this.ikan}) : super(key: key);

  @override
  _IkanFormState createState() => _IkanFormState();
}

class _IkanFormState extends State<IkanForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH IKAN";
  String tombolSubmit = "SIMPAN";

  final _namaTextboxController = TextEditingController();
  final _jenisTextboxController = TextEditingController();
  final _warnaTextboxController = TextEditingController();
  final _habitatTextboxController = TextEditingController();


  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.ikan != null) {
      setState(() {
        judul = "UBAH PRODUK";
        tombolSubmit = "UBAH";
        _namaTextboxController.text = widget.ikan!.nama!;
        _jenisTextboxController.text = widget.ikan!.jenis!;
        _warnaTextboxController.text = widget.ikan!.warna!;
        _habitatTextboxController.text = widget.ikan!.habitat!;
      });
    } else {
      judul = "TAMBAH IKAN";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _namaTextField(),
                _jenisTextField(),
                _warnaTextField(),
                _habitatTextField(),
                _buttonSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Membuat Textbox Nama Ikan
  Widget _namaTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Ikan"),
      keyboardType: TextInputType.text,
      controller: _namaTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nama ikan harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Jenis Ikan
  Widget _jenisTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Jenis Ikan"),
      keyboardType: TextInputType.text,
      controller: _jenisTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Jenis Ikan harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Warna Ikan
  Widget _warnaTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Warna Ikan"),
      keyboardType: TextInputType.text,
      controller: _warnaTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Warna Ikan harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Habitat Ikan
  Widget _habitatTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Habitat Ikan"),
      keyboardType: TextInputType.text,
      controller: _habitatTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Habitat Ikan harus diisi";
        }
        return null;
      },
    );
  }

  //Membuat Tombol Simpan/Ubah
  Widget _buttonSubmit() {
    return OutlinedButton(
        child: Text(tombolSubmit),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
        });
  }
}