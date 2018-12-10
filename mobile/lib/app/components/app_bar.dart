import 'package:flutter/material.dart';
import 'package:mobile/core/widgets/Header/header.dart';

class AppBarCustom extends StatefulWidget {
  _AppBarCustomState createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  TextEditingController searchQuery;

  bool isSearching = false;
  bool theatersOpen = false;

  @override
  void initState() {
    super.initState();
    searchQuery = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _clearSearchQuery() {
    setState(() {
      searchQuery.clear();
      // TODO:
      //_updateSearchQuery(null);
    });
  }

  List<Widget> _buildActions() {
    if (isSearching) {
      return [
        IconButton(
          color: Colors.white70,
          icon: Icon(Icons.clear),
          onPressed: () {
            if (searchQuery == null || searchQuery.text.isEmpty) {
              // Stop searching.
              Navigator.pop(context);
              return;
            }

            _clearSearchQuery();
          },
        )
      ];
    }

    return [
      //TheaterIconButton(theatersOpen, _toggleTheaters),
      TheaterIconButton(theatersOpen: theatersOpen),
      IconButton(
        color: Colors.white,
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch(){
     setState(() {
      isSearching = true;
    });
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchQuery,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search movies & showtimes...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      //onChanged: _updateSearchQuery,
      onChanged: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      leading: isSearching ? BackButton() : null,
      title: isSearching ? _buildSearchField() : Header(),
      actions: _buildActions(),
    );
  }
}

class TheaterIconButton extends StatelessWidget {
  final bool theatersOpen;

  const TheaterIconButton({Key key, this.theatersOpen}) : super(key: key);

  // TODO:
  // callback xử lý

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        theatersOpen ? const Color(0xFF152451) : Colors.transparent;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      color: backgroundColor,
      child: GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            Icons.place,
            color: Colors.white,
            size: 24.0,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
