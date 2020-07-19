import "package:flutter/material.dart";

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String textInfo = "Digite o seu peso e altura";

  void _resetField() {
    weightController.clear();
    heightController.clear();
    FocusScope.of(context).unfocus();
    _formKey = GlobalKey<FormState>();

    setState(() {
      textInfo = "Digite o seu peso e altura";
    });
  }

  void _calcBMI() {
    setState(() {
      FocusScope.of(context).unfocus();
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double bmi = weight / (height * height);

      if (weight.toString() == "" || height.toString() == "") {
        textInfo = "Preencha todos campos";
      }

      if (bmi <= 18.5) {
        textInfo = "Abaixo do peso (${bmi.toStringAsPrecision(3)})";
      } else if (bmi <= 24.9) {
        textInfo = "Peso normal (${bmi.toStringAsPrecision(3)})";
      } else if (bmi <= 29.9) {
        textInfo = "Levemente acima do peso (${bmi.toStringAsPrecision(3)})";
      } else if (bmi <= 34.9) {
        textInfo = "Obesidade grau I (${bmi.toStringAsPrecision(3)})";
      } else if (bmi <= 39.9) {
        textInfo = "Obesidade grau II (${bmi.toStringAsPrecision(3)})";
      } else {
        textInfo = "Obesidade grau III (${bmi.toStringAsPrecision(3)})";
      }
    });

    // else if(bmi < )
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green[800],
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.white),
              onPressed: _resetField,
            )
          ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 150,
              color: Colors.green[900],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                  decoration: InputDecoration(
                      labelText: "Peso (Kg)",
                      labelStyle: TextStyle(color: Colors.green, fontSize: 20)),
                  textAlign: TextAlign.center,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Digite o seu peso!";
                    }
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  style: TextStyle(color: Colors.green, fontSize: 25),
                  decoration: InputDecoration(
                      labelText: "Altura em (cm)",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Digite sua altura!";
                    }
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: RaisedButton(
                onPressed: () => {
                  if (_formKey.currentState.validate()) {_calcBMI}
                },
                color: Colors.green[600],
                padding: EdgeInsets.all(10),
                child: Text("Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
            ),
            Text(
              "$textInfo",
              style: TextStyle(color: Colors.green[600], fontSize: 20),
              textAlign: TextAlign.center,
            )
          ]),
        ),
      ),
    );
  }
}
