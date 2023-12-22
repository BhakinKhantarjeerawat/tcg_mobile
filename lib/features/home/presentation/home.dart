import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_tcg_mobile/consts/app_sizes.dart';
import 'package:my_tcg_mobile/features/authen/data/auth_repository.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
    bool isButtonPressed = false;
  @override
  Widget build(BuildContext context) {
        final object = ref.watch(fetchHomeProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: object.isLoading ? Colors.red : Colors.green,
      ),
      body: object.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Text(e.toString()),
        data: (object) => SingleChildScrollView(
          child: Column(
            children: [
              Text(object),
            ],
          ),
        ),
      ),
    );
  }
}
