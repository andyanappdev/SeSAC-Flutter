import 'package:bmi_calculator/result/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Form의 상태를 담아두는 key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextFormField에 입력된 값을 가져올 controller
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  // App이 종료될때 호출 (App 종료 시점)
  @override
  void dispose() {
    // save(); // 앱이 종료될때 사용자 데이터를 저장 (데이터 저장 함수 콜)
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  // 데이터 저장 함수 (비동기)
  Future save() async {
    // Write data
    // Obtain shared preferences
    final prefs = await SharedPreferences.getInstance();
    // Save an double value to 'decimal' key.
    await prefs.setDouble('height', double.parse(_heightController.text));
    await prefs.setDouble('weight', double.parse(_weightController.text));
  }

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
                controller: _heightController,
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
              const SizedBox(height: 8),
              TextFormField(
                controller: _weightController,
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
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == false) {
                    return;
                  }
                  // 앱이 종료될때 사용자 데이터를 저장을 시도하는 것보다
                  // 확실하게 저장을 완료 할수 있도록 버튼이 눌리면서 다음 화면으로 넘어갈때 데이터 저장을 콜
                  save();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              height: double.parse(_heightController.text),
                              weight: double.parse(_weightController.text),
                            )),
                  );
                },
                child: const Text('Result'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
