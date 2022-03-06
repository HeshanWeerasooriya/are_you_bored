import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bored_bloc.dart';
import '../model/bored.dart';
import '../services/connectivityService.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoredBloc(
        RepositoryProvider.of<BoredService>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Activities for bored people'),
        ),
        body: BlocBuilder<BoredBloc, BoredState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.activityName,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Type: ${state.activityType}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "participants: ${state.participants.toString()}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => BlocProvider.of<BoredBloc>(context)
                          .add(LoadApiEvent()),
                      child: const Text(
                        'TRY NEXT',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.purpleAccent,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20)),
                    )
                  ],
                ),
              );
            }
            if (state is HomeNoInternetState) {
              return const Text('no internet :(');
            }
            return Container();
          },
        ),
      ),
    );
  }
}
