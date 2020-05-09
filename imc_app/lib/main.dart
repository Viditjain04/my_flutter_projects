import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _infoText = 'Informe os dados acima';

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetTextField() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      _infoText = 'Informe os dados acima';
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _infoText = 'Abaixo do peso (${imc.toStringAsPrecision(4)})';
      } else if (imc <= 18.6 && imc < 24.9) {
        _infoText = 'Peso ideal (${imc.toStringAsPrecision(4)})';
      } else if (imc <= 24.9 && imc < 29.9) {
        _infoText = 'Acima do peso (${imc.toStringAsPrecision(4)})';
      } else if (imc <= 29.9 && imc < 34.9) {
        _infoText = 'Obecidade Grau I (${imc.toStringAsPrecision(4)})';
      } else if (imc <= 34.9 && imc < 39.9) {
        _infoText = 'Obecidade Grau II (${imc.toStringAsPrecision(4)})';
      } else if (imc >= 40) {
        _infoText = 'Obecidade Grau III (${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade400,
        title: Text(
          'Calculadora de IMC',
          style: TextStyle(
            color: Colors.lightBlue.shade900,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            alignment: Alignment.center,
            color: Colors.lightBlue.shade900,
            splashColor: Color(0xe1f5feff).withOpacity(.8),
            hoverColor: Color(0xe1f5feff).withOpacity(.9),
            highlightColor: Color(0xe1f5feff).withOpacity(.2),
            tooltip: 'Atualizar',
            icon: Icon(Icons.refresh),
            iconSize: 32.0,
            padding: EdgeInsets.all(5.0),
            onPressed: _resetTextField,
          ),
          IconButton(
            color: Colors.lightBlue.shade900,
            splashColor: Color(0xe1f5feff).withOpacity(.8),
            hoverColor: Color(0xe1f5feff).withOpacity(.9),
            highlightColor: Color(0xe1f5feff).withOpacity(.2),
            tooltip: 'Informações',
            icon: Icon(Icons.info_outline),
            iconSize: 32.0,
            padding: EdgeInsets.all(5.0),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                color: Colors.lightBlue.shade400,
                size: 180.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFormField(
                  controller: weightController,
                  showCursor: false,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Coloque o seu peso aqui',
                    labelText: 'Peso(Kg)',
                    hintStyle: TextStyle(
                      color: Colors.lightBlue.shade800,
                      fontSize: 15.0,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.lightBlue.shade200,
                      fontSize: 30.0,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.lightBlue.shade200,
                    fontSize: 22.0,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Insira o peso';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: TextFormField(
                  controller: heightController,
                  showCursor: false,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Coloque o sua altura aqui',
                    labelText: 'Altura(m)',
                    hintStyle: TextStyle(
                      color: Colors.lightBlue.shade800,
                      fontSize: 15.0,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.lightBlue.shade200,
                      fontSize: 30.0,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.lightBlue.shade200,
                    fontSize: 22.0,
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Insira a altura';
                    }
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12.0),
                alignment: Alignment.center,
                child: RaisedButton(
                  splashColor: Color(0xe1f5feff).withOpacity(.8),
                  hoverColor: Color(0xe1f5feff).withOpacity(.9),
                  highlightColor: Color(0xe1f5feff).withOpacity(.2),
                  textColor: Colors.black.withOpacity(.65),
                  color: Colors.lightBlue.shade200,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _calculate();
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Text(
                    'Calcular',
                    style: TextStyle(
                      color: Colors.lightBlue.shade900.withOpacity(.6),
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: 15.0,
                  left: 18.0,
                  right: 18.0,
                ),
                child: Text(
                  _infoText,
                  style: TextStyle(
                    color: Colors.lightBlue.shade900.withOpacity(.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 21.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
