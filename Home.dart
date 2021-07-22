import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerEtanol = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = "";

  void _calcular() {
    var precoEtanol = double.tryParse(_controllerEtanol.text);
    var precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoEtanol == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número(s) inválido(s). Digite números maiores que 0 e (.)";
      });
    } else {
      if ((precoEtanol / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "A melhor opção é: GASOLINA";
        });
      } else {
        setState(() {
          _textoResultado = "A melhor opção é: ETANOL";
        });
      }

      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerEtanol.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Etanol X Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("image/logo.png"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecer",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço Etanol, ex: 4.28"),
              style: TextStyle(fontSize: 22),
              controller: _controllerEtanol,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(labelText: "Preço Gasolina, ex: 5.88"),
              style: TextStyle(fontSize: 22),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Calcular", style: TextStyle(fontSize: 20)),
                  padding: EdgeInsets.all(15),
                  onPressed: _calcular),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _textoResultado,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
          //Image.asset("image/logo.png");
        ),
      )),
    );
  }
}
