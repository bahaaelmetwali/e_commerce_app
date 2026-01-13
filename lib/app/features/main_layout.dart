import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/features/home/presentation/home_page.dart';
import 'package:mega/app/material/images/app_svg_photo.dart';
import 'package:flutter/material.dart';
import '../../constants/assets.dart';
import '../../l10n/app_localizations.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomePage(),
    Center(child: Text('favorite Page')),
    Center(child: Text('cart Page')),
    Center(child: Text('Menu Page')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: Container(
        height: 72,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .14),
              blurRadius: 60,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,

            backgroundColor: AppColors.scaffoldColor,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: currentIndex == 0
                    ? Text(
                        AppLocalizations.of(context)!.home,
                        style: TextStyles.bold12.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : AppSvgPhoto(
                        path: Assets.iconsHome,
                        width: 22,
                        height: 22,
                      ),
                label: "home",
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 1
                    ? Text(
                        AppLocalizations.of(context)!.favorite,
                        style: TextStyles.bold12.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : AppSvgPhoto(
                        path: Assets.iconsFavPage,
                        width: 22,
                        height: 22,
                      ),
                label: "favorite",
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 2
                    ? Text(
                        AppLocalizations.of(context)!.cart,
                        style: TextStyles.bold12.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : AppSvgPhoto(path: Assets.iconsBag, width: 22, height: 22),
                label: "cart",
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 3
                    ? Text(
                        AppLocalizations.of(context)!.menu,
                        style: TextStyles.bold12.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : AppSvgPhoto(path: Assets.iconsTab, width: 18, height: 14),
                label: "menu",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
