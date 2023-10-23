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
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        foregroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Эксклюзивная палитра \n"Colored Box"',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w800),textAlign: TextAlign.start,),
        ),
      ),
      body: BlocBuilder<ColorsPalleteBloc, ColorsPalleteState>(
        builder: (context, state) {
          switch (state) {
            case ColorsPalleteLoadedState(colors: var colors):
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
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
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: color.name,
              child: Container(
                decoration: BoxDecoration(
                  color: color.hexColor,
                  borderRadius: BorderRadius.circular(10),
                ),
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
