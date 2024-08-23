import 'package:api_consumer_class/controllers/via_cep_controller.dart';
import 'package:api_consumer_class/models/address_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cepTextEditingController = TextEditingController();
  AddressModel? lastCep;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Consultar CEP'),
              TextFormField(controller: cepTextEditingController),
              FilledButton(
                onPressed: () async {
                  final endereco = await ViaCepController().buscarCEP(
                    cepTextEditingController.text,
                  );
                  setState(() {
                    lastCep = endereco;
                  });
                },
                child: const Text('Consultar'),
              ),
              Text('cep: ${lastCep?.cep}'),
              Text('logradouro: ${lastCep?.logradouro}'),
              Text('complemento: ${lastCep?.complemento}'),
              Text('bairro: ${lastCep?.bairro}'),
              Text('localidade: ${lastCep?.localidade}'),
              Text('uf: ${lastCep?.uf}'),
            ],
          ),
        ),
      ),
    );
  }
}
