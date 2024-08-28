import 'package:api_consumer_class/controllers/via_cep_controller.dart';
import 'package:api_consumer_class/models/address_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cepTextEditingController = TextEditingController();
  AddressModel? _lastCep;
  bool _isLoading = false;
  String? _lastError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Página Inicial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Consultar CEP'),
                TextFormField(
                  controller: _cepTextEditingController,
                  maxLength: 8,
                  keyboardType: TextInputType.number,
                  autofillHints: const [AutofillHints.postalCode],
                  decoration: const InputDecoration(
                    labelText: 'CEP',
                    hintText: 'Digite o CEP',
                  ),
                ),
                FilledButton(
                  onPressed: () async {
                    setState(() {
                      _lastCep = null;
                      _isLoading = true;
                      _lastError = null;
                    });
                    try {
                      final endereco = await ViaCepController().buscarCEP(
                        _cepTextEditingController.text,
                      );
                      setState(() {
                        _lastCep = endereco;
                      });
                    } catch (e) {
                      setState(() {
                        _lastError = e.toString();
                      });
                    } finally {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  },
                  child: const Text('Consultar'),
                ),
                Visibility(
                  visible: _isLoading,
                  child: const CircularProgressIndicator(),
                ),
                Visibility(
                  visible: _lastCep != null,
                  child: Column(
                    children: [
                      Text('cep: ${_lastCep?.cep}'),
                      Text('logradouro: ${_lastCep?.logradouro}'),
                      Text('complemento: ${_lastCep?.complemento}'),
                      Text('bairro: ${_lastCep?.bairro}'),
                      Text('localidade: ${_lastCep?.localidade}'),
                      Text('uf: ${_lastCep?.uf}'),
                    ],
                  ),
                ),
                Visibility(
                  visible: _lastError != null,
                  child: Text(_lastError.toString()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
