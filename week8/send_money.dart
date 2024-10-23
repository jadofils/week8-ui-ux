import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'app_theme.dart';

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  String recipientName = '';
  double amount = 0.0;
  String paymentMethod = 'Cash';
  bool isFavorite = false;
  bool _showSuccessMessage = false;

  final List<String> paymentMethods = ['Cash', 'Credit Card', 'PayPal'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Recipient Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a recipient name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    recipientName = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  final number = double.tryParse(value);
                  if (number == null || number <= 0) {
                    return 'Please enter a positive number';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    amount = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Payment Method'),
                value: paymentMethod,
                items: paymentMethods.map((String method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value!;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Mark as favorite'),
                  Switch(
                    value: isFavorite,
                    onChanged: (value) {
                      setState(() {
                        isFavorite = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              CustomButton(
                text: 'Send Money',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the transaction
                    setState(() {
                      _showSuccessMessage = true;
                    });
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        _showSuccessMessage = false;
                      });
                    });
                  }
                },
              ),
              AnimatedOpacity(
                opacity: _showSuccessMessage ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Text(
                  'Transaction Successful!',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
