import 'package:flutter/material.dart';
import 'package:localization_start_kit/Models/ScopeModelWrapper.dart';
import 'package:scoped_model/scoped_model.dart';
import '../utils/app_Localization.dart';
import 'package:flutter/services.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptTerms': false
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.red, width: 8.0),
              gapPadding: 10.0),
          labelText: DemoLocalizations.of(context).title['userName'],
          labelStyle: const TextStyle(color: Color(0xFF2D0A22), fontSize: 24.0),
          prefixText: '966+  ',
          suffixText: '',
          suffixStyle: const TextStyle(
            color: Colors.black,
          ),
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onSaved: (String value) {
        _formData['email'] = value;
      },
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return DemoLocalizations.of(context).title['userNameValidation'];
        }
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: new OutlineInputBorder(
              borderSide:
                  new BorderSide(color: Theme.of(context).primaryColor)),
          labelText: DemoLocalizations.of(context).title['password'],
          labelStyle: const TextStyle(color: Colors.black, fontSize: 24.0),
          prefixIcon: null,
          suffixIcon: const Icon(
            Icons.visibility,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white),
      obscureText: true,
      onSaved: (String value) {
        _formData['password'] = value;
      },
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return DemoLocalizations.of(context).title['passwordValidation'];
        }
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor:
          Theme.of(context).primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth =
        deviceWidth > 550.0 ? 500.0 : MediaQuery.of(context).size.width * 0.80;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Center(
            child: ScopedModelDescendant<AppModel>(
                builder: (context, child, model) => MaterialButton(
                      onPressed: () {
                        model.changeDirection();
                      },
                      height: 60.0,
                      color: const Color.fromRGBO(119, 31, 17, 1.0),
                      child: new Text(
                        DemoLocalizations.of(context).title['language'],
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ))),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Center(
          child: Form(
            key: _formKey,
            child: Container(
              transform: Matrix4.translationValues(0.0, -40.0, 0.0),
              padding: EdgeInsets.only(top: 0),
              child: Center(
                  child: SingleChildScrollView(
                child: Container(
                  width: targetWidth,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      _buildEmailTextField(),
                      SizedBox(height: 30.0),
                      _buildPasswordTextField(),
                      SizedBox(
                        height: 30.0,
                      ),
                      ButtonTheme(
                        minWidth: targetWidth,
                        height: 60.0,
                        child: RaisedButton(
                          child: Text(
                            DemoLocalizations.of(context).title['login'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300),
                          ),
                          onPressed: _submitForm,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
