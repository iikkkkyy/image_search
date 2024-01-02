import 'package:flutter/material.dart';
import 'package:image_search_fast_coding/ui/main_view_model.dart';
import 'package:image_search_fast_coding/ui/widget/image_item_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Search',
                labelStyle: const TextStyle(color: Colors.white),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1, color: Colors.white
                  )
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    await viewModel.searchImage(myController.text);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          StreamBuilder<bool>(
            initialData: false,
              stream: viewModel.isLoading,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return Expanded(
                    child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                    childAspectRatio: 1 / 1, //item 의 가로 1, 세로 1 의 비율
                    mainAxisSpacing: 20, //수평 Padding
                    crossAxisSpacing: 20, //수직 Padding
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final item = viewModel.items[index];
                    return ImageItemWidget(imageItem: item);
                  },
                ));
              })
        ],
      )),
    );
  }
}
