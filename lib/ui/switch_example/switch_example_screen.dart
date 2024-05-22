import 'package:bloc_practice/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_practice/bloc/switch_example/switch_event.dart';
import 'package:bloc_practice/bloc/switch_example/switch_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatelessWidget {
  const SwitchExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) =>
                    previous.isSwitch != current.isSwitch,
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Notification'),
                      Switch(
                        value: state.isSwitch,
                        onChanged: (_) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableNotification());
                        },
                      ),
                    ],
                  );
                }),
            const SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        color:
                            Colors.deepPurpleAccent.withOpacity(state.slider),
                      ),
                      const SizedBox(height: 50),
                      Slider(
                        value: state.slider,
                        onChanged: (newVal) {
                          context
                              .read<SwitchBloc>()
                              .add(SliderEvents(sliderVal: newVal));
                        },
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
