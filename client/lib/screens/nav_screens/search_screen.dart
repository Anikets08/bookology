import 'package:bookology/common/widgets/book_tile.dart';
import 'package:bookology/common/widgets/gradient_container.dart';
import 'package:bookology/models/book_model.dart';
import 'package:bookology/providers/books_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = ref.watch(bookProvider);
    var filtered =
        data.filter((element) => element.name.contains(_controller.text))
            as List<BookModel>;

    return Scaffold(
      body: Column(
        children: [
          _controller.text.isEmpty
              ? const SizedBox()
              : const SizedBox(height: 80),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              height: _controller.text.isEmpty ? 200 : 0,
              child: AnimatedOpacity(
                opacity: _controller.text.isEmpty ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: gradientContainer(
                  context: context,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Search",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: Colors.white,
                            fontSize: 40,
                            letterSpacing: -2.8,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TextField(
            controller: _controller,
            onChanged: (value) {
              setState(() {
                filtered = data.filter((element) => element.name
                    .toLowerCase()
                    .contains(value.toLowerCase())) as List<BookModel>;
              });
            },
            decoration: const InputDecoration(
              hintText: "Enter Book Name",
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          filtered.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text("No Favourites"),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: filtered.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BookTile(
                        data: filtered[index],
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
