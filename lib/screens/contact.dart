import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _email, _message;

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      print('Name: $_name, Email: $_email, Message: $_message');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _submitForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Name',
                  hintText: 'Alex Hum',
                  filled: true,
                  fillColor: Color.fromARGB(255, 238, 238, 238),
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Required';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) => _name = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'example@icloud.com',
                  filled: true,
                  fillColor: Color.fromARGB(255, 238, 238, 238),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Required';
                  } else if (!value!.contains('@')) {
                    return 'Invalid email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) => _email = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.message),
                  labelText: 'Message',
                  hintText: 'Message...',
                  filled: true,
                  fillColor: Color.fromARGB(255, 238, 238, 238),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Required';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) => _message = value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
