import 'package:demo_application/bloc_architecture/bloc.dart';
import 'package:demo_application/main.dart';
import 'package:demo_application/models/model.dart';
import 'package:demo_application/widgets/character_details_widget.dart';
import 'package:flutter/material.dart';

class RickAndMortyChacactersListWidget extends StatefulWidget {
  const RickAndMortyChacactersListWidget({
    Key? key,
  }) : super(key: key);

  @override
  _RickAndMortyChacactersListWidgetState createState() =>
      _RickAndMortyChacactersListWidgetState();
}

class _RickAndMortyChacactersListWidgetState
    extends State<RickAndMortyChacactersListWidget> {
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);
  final ValueNotifier<bool> _isError = ValueNotifier(false);
  final Bloc bloc=Bloc();
   List<RickNMortyCharacterModel> _characterLists=[];

  @override
  void initState() {
    super.initState();
    bloc.fetchData();
    bloc.fetchInfo.listen((event) {
      setState(() {
        _characterLists=event.results!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoading,
      builder: (context, isLoading, child) => isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : child!,
      child: ValueListenableBuilder<bool>(
        valueListenable: _isError,
        builder: (context, hasError, child) => hasError
            ? const Center(
                child: Text(
                  'Something went Wrong..!!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterDetailsWidget(
                          RickNMortyCharacter: _characterLists[index],
                        ),
                      )),
                  child: Row(
                    children: [
                      Image.network(
                        _characterLists[index].image,
                        height: 50,
                        width: 50,
                      ),
                      Expanded(child:  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_characterLists[index].name),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Location ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(child:  Text(
                                  _characterLists[index].location.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                )),
                                const SizedBox(width: 20),
                                const Text(
                                  'Species ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _characterLists[index].species,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                itemCount: _characterLists.length,
              ),
      ),
    );
  }
}
