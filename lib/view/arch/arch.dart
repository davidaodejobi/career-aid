import 'package:career_aid/constant/constant.dart';
import 'package:career_aid/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../controller/arch/arch_controller.dart';

class Arch extends ConsumerWidget {
  const Arch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final archProvider = ref.watch(archController);
    return Scaffold(
      //**this could be simplifed and written in a more simpler way using things
      //* a maap to loop through the list or by using an explicit looping method /
      body: IndexedStack(index: archProvider.currentIndex, children: const [
        Home(),
        Center(
          child: Text(
            'Relearn',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Center(
          child: Text(
            'Unlearn',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Center(
          child: Text(
            'Unlearn',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ]),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.white,
        selectedIndex: archProvider.currentIndex,
        onDestinationSelected: (int index) {
          archProvider.setCurrentIndex(index);
        },
        backgroundColor: Colors.white,
        height: 70,
        animationDuration: const Duration(milliseconds: 500),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: <NavigationDestination>[
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              'assets/svgs/home.svg',
              color: AppColor.kLightPrimaryColor,
            ),
            icon: SvgPicture.asset('assets/svgs/home.svg'),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              'assets/svgs/connection.svg',
              color: AppColor.kLightPrimaryColor,
            ),
            icon: SvgPicture.asset('assets/svgs/connection.svg'),
            label: 'Community',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              'assets/svgs/chat.svg',
              color: AppColor.kLightPrimaryColor,
            ),
            icon: SvgPicture.asset('assets/svgs/chat.svg'),
            label: 'Chat',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              'assets/svgs/save.svg',
              color: AppColor.kLightPrimaryColor,
            ),
            icon: SvgPicture.asset('assets/svgs/save.svg'),
            label: 'Save',
          ),
        ],
      ),
    );
  }
}
