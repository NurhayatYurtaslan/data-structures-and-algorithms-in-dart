import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_app_one/view_home/view_model/home_event.dart';
import 'package:stack_app_one/view_home/view_model/home_state.dart';
import 'package:stack_app_one/view_home/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewModel(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text("Kareler")),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<HomeViewModel, HomeState>(
                    builder: (context, state) {
                      if (state.stack.isEmpty) {
                        return const Center(child: Text("Kare yok."));
                      }
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: state.stack.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            color: Colors.primaries[
                                state.stack[index] % Colors.primaries.length],
                            child: Center(
                              child: Text(
                                'Kare ${state.stack[index]}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Sıralı bir kare ID'si oluşturun
                        final squareId =
                            context.read<HomeViewModel>().state.stack.length;
                        context
                            .read<HomeViewModel>()
                            .add(PushSquareEvent(squareId));
                      },
                      child: const Text("Kare Ekle"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeViewModel>().add(PopSquareEvent());
                      },
                      child: const Text("Kare Sil"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
