import 'package:flutter/material.dart';
import 'package:forja/core/helper/app_strings.dart';
import 'package:forja/core/theming/color_manger.dart';
import 'package:forja/core/theming/text_styel_manger.dart';
import 'package:forja/features/home/data/model/movies_model.dart';

import 'widgets/view_list_movies.dart';

class ListMoviseScreen extends StatefulWidget {
  final List<MoviesDetails>? movies;
  const ListMoviseScreen({super.key, required this.movies});

  @override
  State<ListMoviseScreen> createState() => _ListMoviseScreenState();
}

class _ListMoviseScreenState extends State<ListMoviseScreen> {
  List<MoviesDetails> searchedForMovies = [];
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.grey,
      decoration: const InputDecoration(
        hintText: 'Find a movies...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
      ),
      style: const TextStyle(color: Colors.grey, fontSize: 18),
      onChanged: (searchedMovies) {
        _addSearchedForItemsToSearchedList(searchedMovies);
      },
    );
  }

  void _addSearchedForItemsToSearchedList(String searchedMovies) {
    searchedForMovies = widget.movies!
        .where(
            (movies) => movies.name!.toLowerCase().startsWith(searchedMovies))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _searchTextController.clear();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear, color: Colors.grey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
      _searchTextController.clear();
      setState(() {
        _isSearching = false;
      });
    }));
    setState(() {
      _isSearching = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManger.black,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          leading: _isSearching
              ? const BackButton(
                  color: Colors.grey,
                )
              : Container(),
          title: _isSearching ? _buildSearchField() : _appBar(),
          actions: _buildAppBarActions(),
        ),
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ViewListMovies(
                movies: _searchTextController.text.isEmpty
                    ? widget.movies
                    : searchedForMovies),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: ColorsManger.black,
      title: Text(
        AppStrings.movies,
        style: TextStyelManger.font20WhiteBold,
      ),
      centerTitle: true,
      foregroundColor: ColorsManger.white,
    );
  }

  @override
  void dispose() {
    _searchTextController.clear();
    super.dispose();
  }
}
