import 'package:dinner_generator_app/features/presentations/cubit/restaurent_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';

class DrinksPage extends StatefulWidget {
  const DrinksPage({Key? key}) : super(key: key);

  @override
  _DrinksPageState createState() =>
      _DrinksPageState();
}

class _DrinksPageState extends State<DrinksPage> {
  final cubit = RestaurentDataCubit(
      getRestaurentDrinks: sl(),
      getRestaurentMeals: sl());

  @override
  void initState() {
    getdrinksEvent();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getdrinksEvent() {
    cubit.getDrinksCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drinks'),
      ),
      body: SizedBox(
        height:
            MediaQuery.of(context).size.height,
        child: BlocBuilder<RestaurentDataCubit,
            RestaurentDataState>(
          bloc: cubit,
          builder: (context, state) {
            print('==>> $state');
            if (state is Loading) {
              return const CircularProgressIndicator();
            } else if (state is Error) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is LoadedDrinks) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.drinks.length,
                  itemBuilder: (_, int index) {
                    return SizedBox(
                      height: 100,
                      child: Card(
                        child: Row(
                          children: [
                            SizedBox(
                                width: 90,
                                child: Image
                                    .network(state
                                        .drinks[
                                            index]
                                        .strDrinkThumb)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(state
                                .drinks[index]
                                .strDrink),
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
