import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_courses_template/bloc/colors_pallete_bloc/colors_pallete_bloc.dart';
import 'package:surf_flutter_courses_template/domain/color.dart';
import 'package:surf_flutter_courses_template/screens/pallete_details_screen.dart';

class PalleteScreen extends StatelessWidget {
  const PalleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Эксклюзивная палитра Colored Box'),
      ),
      body: BlocBuilder<ColorsPalleteBloc, ColorsPalleteState>(
        builder: (context, state) {
          switch (state) {
            case ColorsPalleteLoadedState(colors: var colors):
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: colors
                        .expand((element) => [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              PalleteDetailsScreen(
                                                  colorElement: element),
                                        )),
                                    child:
                                        _ColorInformationPanel(color: element)),
                              )
                            ])
                        .toList(),
                  ),
                ),
              );
            case ColorsPalleteLoadingState():
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
          }
        },
      ),
    );
  }
}

class _ColorInformationPanel extends StatelessWidget {
  const _ColorInformationPanel({super.key, required this.color});
  final ColorClass color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Hero(
            tag: color.name,
            child: Container(
              decoration: BoxDecoration(
                color: color.hexColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const SizedBox.square(
                dimension: 100,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(color.name),
        ),
        Text(color.value)
      ],
    );
  }
}
