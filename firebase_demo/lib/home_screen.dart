import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController = TextEditingController();
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");
  final String documentID = "demo-user";

  String _appBarTitle = "User";

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
      _appBarTitle = "Create User";
      _textController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 25,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Icon Avatar
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF4E50), Color(0xFFF9D423)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.person_add, color: Colors.white, size: 36),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _appBarTitle,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Join us today",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 28),
                  // Full Name Field
                  TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline),
                      hintText: "Enter your full name",
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Action Buttons
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF857A6), Color(0xFFFF5858)],
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: ElevatedButton(
                      onPressed: createData,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 5,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          "Create User",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.remove_red_eye, size: 18),
                        label: const Text("Read User"),
                        onPressed: readData,
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.edit, size: 18),
                        label: const Text("Update User"),
                        onPressed: updateData,
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.delete, size: 18),
                        label: const Text("Delete User"),
                        onPressed: deleteData,
                        style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
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
