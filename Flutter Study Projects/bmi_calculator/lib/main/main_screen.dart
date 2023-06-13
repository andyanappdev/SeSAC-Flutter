import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>(); // Form의 상태를 담아두는 key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end, //
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Height',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  // 유효성 검사
                  if (value == null || value.isEmpty) {
                    return 'Plz type your Height';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Weight',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  // 유효성 검사
                  if (value == null || value.isEmpty) {
                    return 'Plz type your Weight';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {}
                },
                child: Text('Result'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
