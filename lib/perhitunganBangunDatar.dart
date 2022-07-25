import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class perhitunganBangunDatar extends StatefulWidget {
  const perhitunganBangunDatar({Key? key}) : super(key: key);

  @override
  State<perhitunganBangunDatar> createState() => _perhitunganBangunDatarState();
}

class _perhitunganBangunDatarState extends State<perhitunganBangunDatar> {
  TextEditingController ctrPanjang = new TextEditingController();
  TextEditingController ctrLebar = new TextEditingController();
  TextEditingController ctrHasil = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perhitungan Bangun Datar')),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          SizedBox(height: 20),
          Text(
            "Luas Persegi Panjang",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          SizedBox(
            height: 40,
          ),
          TextField(
            controller: ctrPanjang,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Panjang',
              hintText: 'Masukkan Panjang',
            ),
          ),
          Container(
            height: 20,
          ),
          TextField(
            controller: ctrLebar,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Lebar',
              hintText: 'Masukkan Lebar',
            ),
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (ctrPanjang.text.isNotEmpty && ctrLebar.text.isNotEmpty) {
                  ctrHasil.text =
                      (int.parse(ctrPanjang.text) * int.parse(ctrLebar.text))
                          .toString();
                } else {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Pastikkan semua input box angka terisi",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ).show();
                  return;
                }
              });
            },
            child: Text("Submit"),
            style: ElevatedButton.styleFrom(fixedSize: const Size(300, 20)),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Hasil: ${ctrHasil.text}",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ]),
      ),
    );
  }
}
