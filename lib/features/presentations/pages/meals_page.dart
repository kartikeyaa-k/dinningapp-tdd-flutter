import 'package:dinner_generator_app/features/presentations/cubit/restaurent_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';

class MealsPage extends StatefulWidget {
  const MealsPage({Key? key}) : super(key: key);

  @override
  _MealsPageState createState() =>
      _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  final cubit = RestaurentDataCubit(
      getRestaurentDrinks: sl(),
      getRestaurentMeals: sl());

  @override
  void initState() {
    addMealEvent();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  addMealEvent() {
    cubit.getMealsCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: SizedBox(
        height:
            MediaQuery.of(context).size.height,
        child: BlocBuilder<RestaurentDataCubit,
            RestaurentDataState>(
          bloc: cubit,
          builder: (context, state) {
            if (state is Loading) {
              return const CircularProgressIndicator();
            } else if (state is Error) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is LoadedMeals) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.meals.length,
                  itemBuilder: (_, int index) {
                    return SizedBox(
                      height: 100,
                      child: Card(
                        child: Row(
                          children: [
                            Container(
                                width: 90,
                                child: Image
                                    .network(state
                                        .meals[
                                            index]
                                        .strMealThumb)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(state
                                .meals[index]
                                .strMeal),
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
