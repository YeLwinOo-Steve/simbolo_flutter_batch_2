import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final passwordController = TextEditingController();
  String category = 'Category1';

  String _selectedRadio = '';
  bool _isChecked = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Text('Data: ${controller.text}',style: TextStyle(fontSize: 30),),

                TextFormField(
                  controller: controller,
                  autovalidateMode: AutovalidateMode.disabled,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Unfilled field';
                    } else if (value.length < 6) {
                      return 'Text must be at least 6 characters long!';
                    }
                    return null;
                  },

                  maxLines: null,
                  // enabled: false,

                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    isDense: true,
                  ),

                  onChanged: (String str) {
                    print(str);
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                    isDense: true,
                  ),
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Unfilled Password!';
                    }
                  },
                ),

                const SizedBox(height: 16),

                // DropdownButtonFormField<String>(
                //   value: category,
                //   elevation: 16,
                //   icon: const Icon(Icons.arrow_drop_down),
                //   isDense: true,
                //   decoration: InputDecoration(
                //     labelText: 'Country',
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(30),
                //       borderSide: const BorderSide(color: Colors.green),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(30),
                //       borderSide: const BorderSide(color: Colors.blue),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(30),
                //       borderSide: const BorderSide(color: Colors.yellow),
                //     ),
                //     errorBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(30),
                //       borderSide: const BorderSide(color: Colors.red),
                //     ),
                //   ),
                //   validator: (String? value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Unfilled Country';
                //     }
                //   },
                //   onChanged: (String? newValue) {
                //     if (newValue != null) {
                //       setState(() {
                //         category = newValue;
                //       });
                //     }
                //   },
                //   items: const [
                //     DropdownMenuItem(
                //       value: 'Myanmar',
                //       child: Text('Myanmar'),
                //     ),
                //     DropdownMenuItem(
                //       value: 'Thailand',
                //       child: Text('Thailand'),
                //     ),
                //     DropdownMenuItem(
                //       value: 'Japan',
                //       child: Text('Japan'),
                //     ),
                //   ],
                // ),

                Radio(
                  value: 'Choice 1',
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value.toString(); // Choice 1
                    });
                  },
                ),
                Radio(
                  value: 'Choice 2',
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: Text('Choice 3'),
                  value: 'Option 3',
                  groupValue: _selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      _selectedRadio = value.toString();
                    });
                  },
                ),

                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),

                CheckboxListTile(
                  title: Text('Option 1'),
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),

                FilledButton.tonal(
                  child: const Text('Save'),
                  onPressed: () {
                    var formValid = formKey.currentState?.validate() ?? false;
                    var message = 'Form isn\'t valid';
                    if (formValid) {
                      message = 'Form is valid: ${controller.text}';

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
