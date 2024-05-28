import 'package:flutter/material.dart';

void main() {
  runApp(const PaymentForm());
}

class PaymentForm extends StatelessWidget {
  const PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Payment Form'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/BACKGROUND.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const PaymentFormWidget(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: BottomAppBar(
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.spa),
                          onPressed: () {
                            // Handle home button press
                          },
                          tooltip: 'Kids',
                        ),
                        const Text(
                          'Kids',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {
                            // Handle alerts button press
                          },
                          tooltip: 'Alerts',
                        ),
                        const Text(
                          'Alerts',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.speed_rounded),
                          onPressed: () {
                            // Handle monitor button press
                          },
                          tooltip: 'Monitor',
                        ),
                        const Text(
                          'Monitor',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            // Handle settings button press
                          },
                          tooltip: 'Settings',
                        ),
                        const Text(
                          'Settings',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentFormWidget extends StatefulWidget {
  const PaymentFormWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentFormWidgetState createState() => _PaymentFormWidgetState();
}

class _PaymentFormWidgetState extends State<PaymentFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  String _selectedCurrency = 'XAF';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'NUMBER',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Please enter your phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
              ),
              const Text(
                'Amount',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: TextFormField(
                        controller: _amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Please input your amount here',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an amount';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedCurrency,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCurrency = newValue!;
                        });
                      },
                      items: <String>['XAF', 'XOF', 'USD', 'EUR', 'GBP']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Payment processed successfully'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  minimumSize: const Size(double.infinity, 0),
                  backgroundColor: const Color.fromARGB(255, 0, 255, 8),
                ),
                child: const Text(
                  'Pay Fees',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
