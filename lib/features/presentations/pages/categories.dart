import 'package:dinner_generator_app/features/presentations/cubit/restaurent_data_cubit.dart';
import 'package:dinner_generator_app/features/presentations/pages/drinks_page.dart';
import 'package:dinner_generator_app/features/presentations/pages/meals_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../injection_container.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key})
      : super(key: key);

  @override
  State<CategoryPage> createState() =>
      _CategoryPageState();
}

class _CategoryPageState
    extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              mealCard(context),
              drinkCard(context)
            ],
          ),
        ),
      ),
    );
  }

  InkWell drinkCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute<MealsPage>(
                builder: (BuildContext context) {
          return BlocProvider(
              create: (_) =>
                  sl<RestaurentDataCubit>(),
              child: const DrinksPage());
        }));
      },
      child: const SizedBox(
        width: 100,
        height: 100,
        child: Card(
          elevation: 10,
          child: Center(child: Text('Drinks')),
        ),
      ),
    );
  }

  InkWell mealCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute<MealsPage>(
          builder: (BuildContext context) {
            return BlocProvider(
                create: (_) =>
                    sl<RestaurentDataCubit>(),
                child: const MealsPage());
          },
        ));
      },
      child: const SizedBox(
        width: 100,
        height: 100,
        child: Card(
          elevation: 10,
          child: Center(child: Text('Meals')),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Hive.close();
    super.dispose();
  }
}











// FutureBuilder(
              //     future: Hive.openBox('meals'),
              //     builder: (_, AsyncSnapshot snap) {
              //       if (snap.connectionState ==
              //           ConnectionState.done) {
              //         return InkWell(
              //           onTap: () {},
              //           child: const Card(
              //             elevation: 10,
              //             child: Text('Meals'),
              //           ),
              //         );
              //       } else {
              //         return Container();
              //       }
              //     }),
              // FutureBuilder(
              //   future: Hive.openBox('drinks'),
              //   builder: (_, AsyncSnapshot snap) {
              //     return InkWell(
              //       onTap: () {},
              //       child: const Card(
              //         elevation: 10,
              //         child: Text('Drinks'),
              //       ),
              //     );
              //   },
              // ),
