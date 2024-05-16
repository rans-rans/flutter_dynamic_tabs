import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final tabs = <CustomTabLabel>[
    CustomTabLabel(
      id: 0,
      label: const Text('Home'),
    ),
    CustomTabLabel(
      id: 1,
      label: const Text('Home'),
    ),
  ];

  final tabviews = <CustomTabView>[
    CustomTabView(
      id: 0,
      view: const Text('Home'),
    ),
    CustomTabView(
      id: 1,
      view: const Text('Home'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Tab'),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    tabs: [for (var tab in tabs) tab.label],
                    isScrollable: true,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final id = DateTime.now().microsecondsSinceEpoch;
                    tabs.add(CustomTabLabel(
                        id: id,
                        label: Row(
                          children: [
                            const Text("view"),
                            IconButton(
                                onPressed: () {
                                  tabs.removeWhere((element) => element.id == id);
                                  tabviews
                                      .removeWhere((element) => element.id == id);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.cancel))
                          ],
                        )));
                    tabviews.add(
                      CustomTabView(id: id, view: const Text("view")),
                    );
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            for (var view in tabviews) view.view,
          ],
        ),
      ),
    );
  }
}

class CustomTabLabel {
  final int id;
  final Widget label;

  CustomTabLabel({required this.id, required this.label});
}

class CustomTabView {
  final int id;
  final Widget view;

  CustomTabView({required this.id, required this.view});
}
