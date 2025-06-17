# User Authentication & CRUD with Firebase in Flutter

This repository provides a comprehensive Flutter application featuring user authentication and CRUD (Create, Read, Update, Delete) operations using Firebase. The project demonstrates how to seamlessly integrate Firebase Authentication and Cloud Firestore to manage user sessions and data.

---

## README 1: Minimal Quickstart

### Features

- User Registration & Login (Firebase Auth)
- CRUD operations on Firestore
- Clean & Responsive UI

### Setup

1. Clone:
   ```bash
   git clone https://github.com/Santhoji07/User-Authentication-Firebase-Flutter.git
   cd User-Authentication-Firebase-Flutter
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Configure Firebase:
   - Add `google-services.json` (Android) or `GoogleService-Info.plist` (iOS).
   - Enable Email/Password Auth and Firestore in Firebase Console.

4. Run:
   ```bash
   flutter run
   ```

---

## README 2: Comprehensive Guide

### Project Structure

```
lib/
├── main.dart
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   ├── home_screen.dart
│   └── crud_screen.dart
├── services/
│   ├── auth_service.dart
│   └── firestore_service.dart
└── widgets/
    └── custom_widgets.dart
```

### CRUD Operations

- **Create**: Add documents to Firestore
- **Read**: List and view documents
- **Update**: Edit existing documents
- **Delete**: Remove documents

### Authentication

- Sign Up / Sign In with email and password
- Sign Out and session management

---

## README 3: Example Usage

### Creating a Record

```dart
await FirestoreService().createRecord({'title': 'Example', 'description': 'CRUD with Firebase!'});
```

### Reading Records

```dart
StreamBuilder<QuerySnapshot>(
  stream: FirestoreService().readRecords(),
  builder: (context, snapshot) { ... }
)
```

### Updating a Record

```dart
await FirestoreService().updateRecord(docId, {'title': 'Updated'});
```

### Deleting a Record

```dart
await FirestoreService().deleteRecord(docId);
```

---

## README 4: Contributing & Support

### How to Contribute

- Fork and clone the repo
- Create a new branch for your feature/fix
- Submit a pull request

### Issues

Please use the [GitHub Issues](https://github.com/Santhoji07/User-Authentication-Firebase-Flutter/issues) to report bugs or suggest features.

---

## README 5: Credits 

### Built With

- [Flutter](https://flutter.dev/)
- [Firebase Auth](https://firebase.google.com/docs/auth)
- [Cloud Firestore](https://firebase.google.com/docs/firestore)

_Made by Santhoji07_
