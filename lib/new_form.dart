import 'package:diplopm_2/strings.dart';
import 'package:flutter/material.dart';

class NewForm extends StatefulWidget {
  const NewForm({Key? key}) : super(key: key);

  @override
  _NewFormState createState() => _NewFormState();
}

class _NewFormState extends State<NewForm> {
  final _formKey = GlobalKey<FormState>();
  String? nameOrg='';
  String? numOrg='';
  String? initialDelivery='';
  String? deliveryAddress='';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(nameApp),
      ),
      body: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: backgroundWhite,
              ),
              width: 600,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            const Text('Имя организации'),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    nameOrg=value;
                                  });
                                },
                              ),
                            ),
                            const Text('Контактный номер'),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    numOrg=value;
                                  });
                                },
                              ),
                            ),
                            const Text('Место сбора'),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    initialDelivery=value;
                                  });
                                },
                              ),
                            ),
                            const Text('Место доставки'),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    deliveryAddress=value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 200,
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ElevatedButton(
                                onPressed: () {
                                    print(nameOrg);
                                    print(numOrg);
                                    print(deliveryAddress);
                                    print(initialDelivery);
                                    Navigator.pop(context);
                                },
                                child: const Text(
                                  'Отправить',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
