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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Calculadora de IMC"),
            centerTitle: true,
            backgroundColor: Colors.green,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.refresh, color: Colors.white),
                  onPressed: () => {})
            ]),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.person_outline, size: 170, color: Colors.green),
              TextField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Peso em Kg",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25)),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura",
                      labelStyle: TextStyle(
                        color: Colors.green,
                      )),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25)),
              Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: RaisedButton(
                    onPressed: () => {},
                    child: Text("Calcular",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                    color: Colors.green,
                    elevation: 10,
                    padding: EdgeInsets.all(15),
                  )),
              Text("Informe seu peso e sua altura",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 20))
            ],
          ),
        ));
  }
}
