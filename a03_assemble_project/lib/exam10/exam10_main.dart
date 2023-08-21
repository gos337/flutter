import 'package:flutter/material.dart';

import 'color_schemes.g2.dart';

class Exam10_Material3 extends StatefulWidget {
  const Exam10_Material3({super.key});

  @override
  State<Exam10_Material3> createState() => _Exam10_Material3State();
}

class _Exam10_Material3State extends State<Exam10_Material3> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: _Scaffold(context),
    );
  }

  Widget _Scaffold(BuildContext context) {
    const textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Material3"),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: <Widget>[
        SingleChildScrollView(
          child: SizedBox(
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("ButtonTypesExample", style: textStyle),
                    const ButtonTypesExample(),
                    const Text("FloatingActionButton", style: textStyle),
                    const FabExample(),
                    const Text("IconButtonExampleState", style: textStyle),
                    const IconButtonExample(),
                    const IconButtonExample2(),
                    const IconButtonExample3(),
                    Text("IconToggleButtons",
                        style: textStyle.copyWith(fontSize: 15)),
                    const IconToggleButtons(),
                    const IconToggleButtons(),
                    const Text("SegmentedButtonApp", style: textStyle),
                    const SegmentedButtonApp(),
                    const SizedBox(height: 100)
                  ],
                ),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('Page 2'),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('Page 3'),
          ),
        ),
      ][currentPageIndex],
      floatingActionButton: const _FAB(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore), label: "Explore"),
          NavigationDestination(icon: Icon(Icons.commute), label: "Commute"),
          NavigationDestination(icon: Icon(Icons.bookmark), label: "Bookmark"),
        ],
      ),
    );
  }
}

/*
#### Material 3 button types ####
https://api.flutter.dev/flutter/material/ButtonStyle-class.html#material-3-button-types

*/

class ButtonTypesExample extends StatelessWidget {
  const ButtonTypesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: [
          Spacer(), // 앞 공간
          ButtonTypesGroup(enabled: true), // Row 1열
          ButtonTypesGroup(enabled: false), // Row 2열
          Spacer(), // 뒷 공간
        ],
      ),
    );
  }
}

class ButtonTypesGroup extends StatelessWidget {
  const ButtonTypesGroup({super.key, required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(onPressed: onPressed, child: const Text('Elevated')),
          FilledButton(onPressed: onPressed, child: const Text('Filled')),
          FilledButton.tonal(
              onPressed: onPressed, child: const Text('Filled Tonal')),
          OutlinedButton(onPressed: onPressed, child: const Text('Outlined')),
          TextButton(onPressed: onPressed, child: const Text('Text')),
        ],
      ),
    );
  }
}

/* ####################################################
    FAB
#################################################### */

class _FAB extends StatelessWidget {
  const _FAB();

  @override
  Widget build(BuildContext context) {
    /* ####################################################
        ICon & Text 있는 FloatingActionButton.extended
    #################################################### */
    return FloatingActionButton.extended(
      onPressed: () => {},
      label: const Text("FloatingActionButton"),
      icon: const Icon(Icons.navigation),
    );

    /* ####################################################
        ICon만 있는 FloatingActionButton
    #################################################### */
    // return FloatingActionButton(
    //     onPressed: () => {}, child: const Icon(Icons.navigation));
  }
}

/* ####################################################
    FabExample
#################################################### */

class FabExample extends StatelessWidget {
  const FabExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Small'),
              const SizedBox(width: 16),
              // An example of the small floating action button.
              //
              // https://m3.material.io/components/floating-action-button/specs#669a1be8-7271-48cb-a74d-dd502d73bda4
              FloatingActionButton.small(
                  onPressed: () {}, child: const Icon(Icons.add)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Regular'),
              const SizedBox(width: 16),
              // An example of the regular floating action button.
              //
              // https://m3.material.io/components/floating-action-button/specs#71504201-7bd1-423d-8bb7-07e0291743e5
              FloatingActionButton(
                  onPressed: () {}, child: const Icon(Icons.add)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Large'),
              const SizedBox(width: 16),
              // An example of the large floating action button.
              //
              // https://m3.material.io/components/floating-action-button/specs#9d7d3d6a-bab7-47cb-be32-5596fbd660fe
              FloatingActionButton.large(
                  onPressed: () {}, child: const Icon(Icons.add)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Extended'),
              const SizedBox(width: 16),
              // An example of the extended floating action button.
              //
              // https://m3.material.io/components/extended-fab/specs#686cb8af-87c9-48e8-a3e1-db9da6f6c69b
              FloatingActionButton.extended(
                onPressed: () {},
                label: const Text('Add'),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/* ####################################################
    IconButtonExample
#################################################### */

class IconButtonExample extends StatefulWidget {
  const IconButtonExample({super.key});

  @override
  State<IconButtonExample> createState() => _IconButtonExampleState();
}

class _IconButtonExampleState extends State<IconButtonExample> {
  double _volume = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.volume_up),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              _volume += 10;
            });
          },
        ),
        Text('Volume : $_volume'),
      ],
    );
  }
}

class IconButtonExample2 extends StatelessWidget {
  const IconButtonExample2({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.android),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class IconButtonExample3 extends StatelessWidget {
  const IconButtonExample3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          Spacer(),
          IconButtonTypesGroup(enabled: true),
          IconButtonTypesGroup(enabled: false),
          Spacer(),
        ],
      ),
    );
  }
}

class IconButtonTypesGroup extends StatelessWidget {
  const IconButtonTypesGroup({super.key, required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = enabled ? () {} : null;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
              icon: const Icon(Icons.filter_drama), onPressed: onPressed),

          // Filled icon button
          IconButton.filled(
              onPressed: onPressed, icon: const Icon(Icons.filter_drama)),

          // Filled tonal icon button
          IconButton.filledTonal(
              onPressed: onPressed, icon: const Icon(Icons.filter_drama)),

          // Outlined icon button
          IconButton.outlined(
              onPressed: onPressed, icon: const Icon(Icons.filter_drama)),
        ],
      ),
    );
  }
}

/* ####################################################
    IconToggleButtons
#################################################### */

class IconToggleButtons extends StatefulWidget {
  const IconToggleButtons({super.key});

  @override
  State<IconToggleButtons> createState() => _DemoIconToggleButtonsState();
}

class _DemoIconToggleButtonsState extends State<IconToggleButtons> {
  bool standardSelected = false;
  bool filledSelected = false;
  bool tonalSelected = false;
  bool outlinedSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              isSelected: standardSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  standardSelected = !standardSelected;
                });
              },
            ),
            const SizedBox(width: 10),
            IconButton(
              isSelected: standardSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: null,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton.filled(
              isSelected: filledSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  filledSelected = !filledSelected;
                });
              },
            ),
            const SizedBox(width: 10),
            IconButton.filled(
              isSelected: filledSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: null,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton.filledTonal(
              isSelected: tonalSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  tonalSelected = !tonalSelected;
                });
              },
            ),
            const SizedBox(width: 10),
            IconButton.filledTonal(
              isSelected: tonalSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: null,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton.outlined(
              isSelected: outlinedSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: () {
                setState(() {
                  outlinedSelected = !outlinedSelected;
                });
              },
            ),
            const SizedBox(width: 10),
            IconButton.outlined(
              isSelected: outlinedSelected,
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              onPressed: null,
            ),
          ],
        ),
      ],
    );
  }
}

/* ####################################################
    SegmentedButton
#################################################### */

class SegmentedButtonApp1 extends StatefulWidget {
  const SegmentedButtonApp1({super.key});

  @override
  State<SegmentedButtonApp1> createState() => _SegmentedButtonAppState1();
}

class _SegmentedButtonAppState1 extends State<SegmentedButtonApp1> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(),
        Text('Single choice'),
        // SingleChoice(),
        // SizedBox(height: 20),
        // Text('Multiple choice'),
        // MultipleChoice(),
        // Spacer(),
      ],
    );
  }
}

class SegmentedButtonApp extends StatefulWidget {
  const SegmentedButtonApp({super.key});

  @override
  State<SegmentedButtonApp> createState() => _SegmentedButtonAppState();
}

class _SegmentedButtonAppState extends State<SegmentedButtonApp> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Single choice'),
        SingleChoice(),
        SizedBox(height: 20),
        Text('Multiple choice'),
        MultipleChoice(),
      ],
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('Day'),
            icon: Icon(Icons.calendar_view_day)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year'),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          // By default there is only a single segment that can be
          // selected at one time, so its value is always the first
          // item in the selected set.
          calendarView = newSelection.first;
          print(calendarView);
        });
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}
