import 'package:mega/app/core/config/router/route_names.dart';
import 'package:mega/app/core/config/theme/app_colors.dart';
import 'package:mega/app/core/config/theme/text_styles.dart';
import 'package:mega/app/features/home/presentation/home_page.dart';
import 'package:mega/app/material/images/app_svg_photo.dart';
import 'package:flutter/material.dart';
import '../../constants/assets.dart';
import '../../l10n/app_localizations.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key, required this.isGuest});
  final bool isGuest;
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }



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
              if (widget.isGuest) {
                if (index == 0) return;

                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(AppLocalizations.of(context)!.alert),
                    content: Text(AppLocalizations.of(context)!.login_required),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RouteNames.login,
                          );
                        },
                        child: Text(AppLocalizations.of(context)!.login),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(AppLocalizations.of(context)!.cancel),
                      ),
                    ],
                  ),
                );
                return;
              }

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
                    : AppSvgIcon(path: Assets.iconsHome, width: 22, height: 22),
                label: AppLocalizations.of(context)!.home,
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 1
                    ? Text(
                        AppLocalizations.of(context)!.favorite,
                        style: TextStyles.bold12.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : AppSvgIcon(
                        path: Assets.iconsFavPage,
                        width: 22,
                        height: 22,
                      ),
                label: AppLocalizations.of(context)!.favorite,
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 2
                    ? Text(
                        AppLocalizations.of(context)!.cart,
                        style: TextStyles.bold12.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : AppSvgIcon(path: Assets.iconsBag, width: 22, height: 22),
                label: AppLocalizations.of(context)!.cart,
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 3
                    ? Text(
                        AppLocalizations.of(context)!.menu,
                        style: TextStyles.bold12.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : AppSvgIcon(path: Assets.iconsTab, width: 18, height: 14),
                label: AppLocalizations.of(context)!.menu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
