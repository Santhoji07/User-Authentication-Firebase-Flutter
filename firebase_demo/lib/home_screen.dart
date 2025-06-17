/*import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  String _appBarTitle = 'Home';

  final CollectionReference users = FirebaseFirestore.instance.collection("users");
  final String documentID = "demo-user";

  // Create
  Future<void> createData() async {
    await users.doc(documentID).set({"name": _textController.text});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Created: ${_textController.text}')),
    );
  }

  // Read
  Future<void> readData() async {
    final doc = await users.doc(documentID).get();
    if (doc.exists && doc.data() != null) {
      String name = (doc.data() as Map<String, dynamic>)['name'] ?? '';
      setState(() {
        _appBarTitle = name;
        _textController.text = name;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Read: $name')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No data found')),
      );
    }
  }

  // Update
  Future<void> updateData() async {
    await users.doc(documentID).update({"name": _textController.text});
    setState(() {
      _appBarTitle = _textController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Updated: ${_textController.text}')),
    );
  }

  // Delete
  Future<void> deleteData() async {
    await users.doc(documentID).delete();
    setState(() {
      _appBarTitle = 'Home';
      _textController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text',
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: createData,
                  child: const Text('Create'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: updateData,
                  child: const Text('Update'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: readData,
                  child: const Text('Read'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: deleteData,
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}*/

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  String _appBarTitle = 'CRUD Operations';

  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  final String documentID = "demo-user";

  Future<void> createData() async {
    await users.doc(documentID).set({"name": _textController.text});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Created: ${_textController.text}')),
    );
  }

  Future<void> readData() async {
    final doc = await users.doc(documentID).get();
    if (doc.exists && doc.data() != null) {
      String name = (doc.data() as Map<String, dynamic>)['name'] ?? '';
      setState(() {
        _appBarTitle = name;
        _textController.text = name;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Read: $name')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No data found')),
      );
    }
  }

  Future<void> updateData() async {
    await users.doc(documentID).update({"name": _textController.text});
    setState(() {
      _appBarTitle = _textController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Updated: ${_textController.text}')),
    );
  }

  Future<void> deleteData() async {
    await users.doc(documentID).delete();
    setState(() {
      _appBarTitle = 'Home';
      _textController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Deleted')),
    );
  }

  Widget buildCrudButton({
    required String label,
    required Color color,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
          color: color,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 70,
              height: 70,
              child: Icon(icon, color: Colors.white, size: 38),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(_appBarTitle),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 208, 234, 38),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text Field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    labelText: 'Enter text',
                  ),
                ),
              ),
              // Buttons Row (see image1 for style reference)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCrudButton(
                    label: 'Create',
                    color: Colors.teal[400]!,
                    icon: Icons.add,
                    onTap: createData,
                  ),
                  const SizedBox(width: 24),
                  buildCrudButton(
                    label: 'Read',
                    color: Colors.purple[200]!,
                    icon: Icons.remove_red_eye,
                    onTap: readData,
                  ),
                  const SizedBox(width: 24),
                  buildCrudButton(
                    label: 'Update',
                    color: Colors.green[400]!,
                    icon: Icons.edit,
                    onTap: updateData,
                  ),
                  const SizedBox(width: 24),
                  buildCrudButton(
                    label: 'Delete',
                    color: Colors.red[300]!,
                    icon: Icons.delete,
                    onTap: deleteData,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Reference: ![image1](image1)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}