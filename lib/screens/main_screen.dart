import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  int _selectedSubIndex = 0;
  final Set<String> _expandedMenus = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGreen,
      body: Row(
        children: [
          Container(
            width: 250,
            decoration: const BoxDecoration(
              gradient: AppColors.sidebarGradient,
              border: Border(
                right: BorderSide(color: AppColors.whiteGreen, width: 2.0),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),

                SvgPicture.asset(
                  'assets/icons/logo_saa.svg',
                  height: 48,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'SAA Asset Management',
                  style: AppTextStyles.bodyBold.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 40),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _addMenuItem(
                          index: 0,
                          title: "Dasbor",
                          iconPath: 'assets/icons/ic_dashboard.svg',
                        ),
                        _addMenuItem(
                          index: 1,
                          title: "Daftar Lahan",
                          iconPath: 'assets/icons/ic_lahan.svg',
                        ),
                        _addMenuItem(
                          index: 2,
                          title: "Tim Lapangan",
                          iconPath: 'assets/icons/ic_tim.svg',
                        ),
                        _addMenuItem(
                          index: 3,
                          title: "Mitra Bisnis",
                          iconPath: 'assets/icons/ic_mitra.svg',
                        ),
                        _addExpandedMenuItem(
                          index: 4,
                          title: "Laporan",
                          iconPath: 'assets/icons/ic_laporan.svg',
                          subMenus: [
                            {'subIndex': 1, 'title': 'Aliran Logistik'},
                            {'subIndex': 2, 'title': 'Inventaris'},
                            {'subIndex': 3, 'title': 'Kondisi Aset'},
                            {'subIndex': 4, 'title': 'Kendala'},
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                _addMenuItem(
                  index: 99,
                  title: 'Log out',
                  iconPath: 'assets/icons/ic_logout.svg',
                  isLogout: true,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),

          Expanded(
            child: Center(child: Text('Konten', style: AppTextStyles.heading2)),
          ),
        ],
      ),
    );
  }

  Widget _addMenuItem({
    required int index,
    required String title,
    required String iconPath,
    bool isLogout = false,
  }) {
    bool isActive = _selectedIndex == index;

    return InkWell(
      onTap: () {
        if (!isLogout) {
          setState(() {
            _selectedIndex = index;
            _expandedMenus.clear();
            _selectedSubIndex = 0;
          });
        } else {}
      },
      child: Container(
        margin: const EdgeInsets.only(left: 24, bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          color: isActive ? AppColors.whiteGreen : Colors.transparent,

          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.darkgreen : Colors.white,
                BlendMode.srcIn,
              ),
              width: 20,
            ),
            const SizedBox(width: 16),

            Text(
              title,
              style: AppTextStyles.body.copyWith(
                color: isActive ? AppColors.darkgreen : Colors.white,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addExpandedMenuItem({
    required int index,
    required String title,
    required String iconPath,
    required List<Map<String, dynamic>> subMenus,
  }) {
    bool isExpanded = _expandedMenus.contains(title);
    bool isActive = _selectedIndex == index;


    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
              if (isExpanded) {
                _expandedMenus.remove(title);
              } else {
                _expandedMenus.add(title);
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.only(left: 24, bottom: 8),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            decoration: BoxDecoration(
              color: isActive ? AppColors.whiteGreen : Colors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  colorFilter: ColorFilter.mode(
                    isActive ? AppColors.darkgreen : Colors.white,
                    BlendMode.srcIn,
                  ),
                  width: 20,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: AppTextStyles.body.copyWith(
                    color: isActive ? AppColors.darkgreen : Colors.white,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const Spacer(),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: isActive ? AppColors.darkgreen : Colors.white,
                ),
              ],
            ),
          ),
        ),

        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 60, top: 4, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: subMenus.map((subMenu) {
                return _addSubMenuItem(
                  parentIndex: index,
                  index: subMenu['subIndex'],
                  title: subMenu['title'],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _addSubMenuItem({
    required int parentIndex,
    required int index,
    required String title,
  }) {
    bool isSubActive = _selectedIndex == parentIndex && _selectedSubIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = parentIndex;
          _selectedSubIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: AppTextStyles.body.copyWith(
            color: isSubActive ? Colors.white : Colors.white70,
            fontWeight: isSubActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
