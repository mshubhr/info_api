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
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(labelText: 'Name'),
                validator: FormBuilderValidators.required(), // No context here
              ),
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(labelText: 'Email'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(), // No context here
                  FormBuilderValidators.email(), // No context here
                ]),
              ),
              FormBuilderTextField(
                name: 'phone',
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: FormBuilderValidators.required(), // No context here
              ),
              FormBuilderDropdown(
                name: 'gender',
                decoration: const InputDecoration(labelText: 'Gender'),
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                validator: FormBuilderValidators.required(), // No context here
              ),
              FormBuilderTextField(
                name: 'country',
                decoration: const InputDecoration(labelText: 'Country'),
                validator: FormBuilderValidators.required(), // No context here
              ),
              FormBuilderTextField(
                name: 'state',
                decoration: const InputDecoration(labelText: 'State'),
                validator: FormBuilderValidators.required(), // No context here
              ),
              FormBuilderTextField(
                name: 'city',
                decoration: const InputDecoration(labelText: 'City'),
                validator: FormBuilderValidators.required(), // No context here
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
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
            ],
          ),
        ),
      ),
    );
  }
}
