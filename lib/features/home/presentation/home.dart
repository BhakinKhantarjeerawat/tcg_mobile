
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tcg_mobile/features/authen/data/auth_repository.dart';
import 'package:my_tcg_mobile/features/authen/presentation/sign_in_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
    bool isButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(loginResultProvider);
final userData = ref.watch(fetchUserDataProvider(id: userId));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: userData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Text(e.toString()),
        data: (data) => SingleChildScrollView(
          child: Column(
            children: [
              Text(data.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
