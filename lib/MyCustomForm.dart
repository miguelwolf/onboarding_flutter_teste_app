import 'package:flutter/material.dart';
import 'core/localization/localization_utils.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  String? _validateEmptyField(String? value) {
    if (value == null || value.isEmpty) {
      return LocalizationUtil.appLocalization.mainCampoObrigatorio;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey, // Conecta a chave ao formulário
      child: Column(
        children: [
          Text(
            LocalizationUtil.appLocalization.mainDescription,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: _validateEmptyField, // Usando o método
                  decoration: InputDecoration(
                    labelText: LocalizationUtil.appLocalization.mainLabelNome,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  validator: _validateEmptyField, // Usando o mesmo método
                  decoration: InputDecoration(
                    labelText:
                        LocalizationUtil.appLocalization.mainLabelSobrenome,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: 12),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: LocalizationUtil.appLocalization.mainLabelEmail,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.zero),
                ),
              ),
              validator: _validateEmptyField,
            ),
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // 5. O momento em que a mágica acontece:
                // O Form chama o validator de todos os campos filhos!
                if (_formKey.currentState!.validate()) {
                  // Tudo certo, pode prosseguir
                }
              },
              child: Text(LocalizationUtil.appLocalization.mainAcaoEntrar),
            ),
          ),
        ],
      ),
    );
  }
}
