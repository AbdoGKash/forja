import 'package:flutter/material.dart';
import 'package:forja/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/injection.dart';
import 'forja_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initGetIt();
  runApp(const ForjaApp());
}
