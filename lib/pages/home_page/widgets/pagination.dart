import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/all_characters_bloc.dart';
import '../bloc/all_characters_event.dart';
import '../bloc/all_characters_state.dart';

class Pagination extends StatefulWidget {
  const Pagination({Key? key, required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharacterState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.black,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state.page > 1
                  ? Expanded(
                      child: Center(
                          child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<CharactersBloc>()
                              .add(FetchPreviousPage());
                          scrollToTop();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 160, 41, 33)),
                        child: const Text(
                          'Previous',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                    )
                  : Expanded(child: Container()),
              Expanded(
                  child: Center(
                      child: Text(
                (state.page).toString(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ))),
              state.page < 9
                  ? Expanded(
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<CharactersBloc>().add(FetchNextPage());
                            scrollToTop();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 160, 41, 33)),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Play'),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(),
                    )
            ],
          ),
        ),
      );
    });
  }

  void scrollToTop() {
    if (widget.scrollController.hasClients) {
      widget.scrollController.animateTo(
        widget.scrollController.position.minScrollExtent - 500,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
