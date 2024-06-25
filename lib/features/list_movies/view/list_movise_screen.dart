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
      cursorColor: ColorsManger.white,
      decoration: InputDecoration(
        hintText: AppStrings.findAMovies,
        border: InputBorder.none,
        hintStyle: TextStyelManger.font16White,
      ),
      style: TextStyelManger.font16White,
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
          icon: Icon(Icons.clear, color: ColorsManger.white),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: ColorsManger.white,
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
          backgroundColor: ColorsManger.black,
          leading: _isSearching
              ? BackButton(
                  color: ColorsManger.white,
                )
              : const SizedBox.shrink(),
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

  _appBar() {
    return Center(
      child: Text(
        AppStrings.movies,
        style: TextStyelManger.font20WhiteBold,
      ),
    );
  }

  @override
  void dispose() {
    _searchTextController.clear();
    super.dispose();
  }
}
