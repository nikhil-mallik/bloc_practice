import 'package:bloc_practice/bloc/switch_example/switch_bloc.dart';
import 'package:flutter/material.dart';

import '../views.dart';

/// A screen demonstrating the usage of switches and sliders.
class SwitchExampleScreen extends StatelessWidget {
  const SwitchExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch Example'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Switch widget controlled by the SwitchBloc state.
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
                },
              ),
              const SizedBox(height: 30),
              // Slider widget controlled by the SwitchBloc state.
              BlocBuilder<SwitchBloc, SwitchStates>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        color: Colors.deepPurpleAccent.withOpacity(state.slider),
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
