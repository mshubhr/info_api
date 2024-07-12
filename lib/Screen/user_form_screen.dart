import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class UserFormScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  UserFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16.0),
                const Text(
                  'Personal Information',
                ),
                const SizedBox(height: 16.0),
                FormBuilderTextField(
                  name: 'name',
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.required(
                      errorText: 'Please enter your name'),
                ),
                const SizedBox(height: 16.0),
                FormBuilderTextField(
                  name: 'email',
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Please enter your email'),
                    FormBuilderValidators.email(
                        errorText: 'Please enter a valid email'),
                  ]),
                ),
                const SizedBox(height: 16.0),
                FormBuilderTextField(
                  name: 'phone',
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.required(
                      errorText: 'Please enter your phone number'),
                ),
                const SizedBox(height: 16.0),
                FormBuilderDropdown(
                  name: 'gender',
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  validator: FormBuilderValidators.required(
                      errorText: 'Please select your gender'),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Address',
                ),
                const SizedBox(height: 16.0),
                FormBuilderTextField(
                  name: 'country',
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.required(
                      errorText: 'Please enter your country'),
                ),
                const SizedBox(height: 16.0),
                FormBuilderTextField(
                  name: 'state',
                  decoration: const InputDecoration(
                    labelText: 'State',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.required(
                      errorText: 'Please enter your state'),
                ),
                const SizedBox(height: 16.0),
                FormBuilderTextField(
                  name: 'city',
                  decoration: const InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.required(
                      errorText: 'Please enter your city'),
                ),
                const SizedBox(height: 32.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.saveAndValidate() ?? false) {
                        final formData = _formKey.currentState?.value;
                        if (kDebugMode) {
                          print(formData);
                        }
                      } else {
                        if (kDebugMode) {
                          print('Validation failed');
                        }
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
