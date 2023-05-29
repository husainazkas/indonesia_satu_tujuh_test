import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/arithmatics/arithmatics_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Husain Fadhilah'),
            Text(
              'Flutter Developer',
              textScaleFactor: .8,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: context.watch<ArithmaticsBloc>().textController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLines: 1,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 40.0),
            _Button(
              onPressed: (index) {
                context
                    .read<ArithmaticsBloc>()
                    .add(ArithmaticsEvent.perform(index));
              },
            ),
            const SizedBox(height: 40.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Result:'),
            ),
            const SizedBox(height: 20.0),
            BlocBuilder<ArithmaticsBloc, ArithmaticsState>(
              builder: (context, state) => state.when(
                initial: () => const Text('It seems quite here'),
                loading: () => const Text('Calculating...'),
                failure: (message) => Text(message),
                success: (result) => Text(result),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({this.onPressed});

  final ValueSetter<int>? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  onPressed?.call(0);
                },
                child: const Text('1'),
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  onPressed?.call(1);
                },
                child: const Text('2'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  onPressed?.call(2);
                },
                child: const Text('3'),
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  onPressed?.call(3);
                },
                child: const Text('4'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
