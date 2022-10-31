import 'package:demo_block/Screen/Home/Bloc/home_bloc.dart';
import 'package:demo_block/Screen/Home/Bloc/home_event.dart';
import 'package:demo_block/Screen/Home/Bloc/home_state.dart';
import 'package:demo_block/Screen/Home/Repository/home_repository_impl.dart';
import 'package:demo_block/model/api_res_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(HomeRepositoryImpl()),
      child: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // late InDecBloc _inDecBloc;
  late HomeBloc _homeBloc;
  final ScrollController _scrollController = ScrollController();
  final List<ApiResData> apiResData = [];

  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    // _inDecBloc = BlocProvider.of<InDecBloc>(context);
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // You're at the top.
        } else {
          _homeBloc.limitRich ? null : _homeBloc.add(FetchApiEvent());
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                print('state ==> $state');
                if (state is HomeInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ApiSuccessState) {
                  apiResData.addAll(state.apiResModel.data ?? []);
                  print('ApiSuccessState : ${state.apiResModel.data?.length ?? 0}');
                }
                return ListView.builder(
                  itemCount: BlocProvider.of<HomeBloc>(context).limitRich ? apiResData.length : apiResData.length + 1,
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    print('index : $index');
                    return (index >= apiResData.length)
                        ? const SizedBox(
                            height: 100,
                            width: 250,
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : Container(
                            padding: const EdgeInsets.all(50),
                            margin: const EdgeInsets.all(20),
                            color: Colors.lightBlueAccent,
                            height: 300,
                            width: 250,
                            child: Text('${apiResData[index].id}'),
                          );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _homeBloc.add(FetchApiEvent());
            },
            child: const Text('FetchApiEvent'),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
