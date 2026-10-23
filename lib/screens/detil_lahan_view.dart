import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class DetilLahanView extends StatelessWidget {
  final Map<String, dynamic>? data;

  const DetilLahanView({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGreen,
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // KIRI: Gambar Lahan 
          Expanded(
            flex: 4,
            child: _buildImageSection(),
          ),
          
          const SizedBox(width: 24),
          
          // KANAN
          Expanded(
            flex: 6,
            child: Row(
              children: [
                // KOLOM 1
                Expanded(
                  child: Column(
                    children: [
                      Expanded(flex: 2, child: _buildTextCard('Lokasi', 'Ds. Sumbermulyo, Kec. Jogoroto, Kab. Jombang, Jawa Timur 61485')),
                      const SizedBox(height: 16),
                      Expanded(flex: 2, child: _buildTextCard('Koordinat', 'Latitude : -7.576134\nLongitude : 112.281455')),
                      const SizedBox(height: 16),
                      Expanded(flex: 3, child: _buildStatCard('assets/icons/ic_kelembaban.svg', 'Kelembaban', '65', '%')),
                      const SizedBox(height: 16),
                      Expanded(flex: 3, child: _buildStatCard('assets/icons/ic_ph.svg', 'pH Level', '6,7', '')),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                
                // KOLOM 2
                Expanded(
                  child: Column(
                    children: [
                      Expanded(flex: 2, child: _buildTextCard('Luas', '1.2 Hektar')),
                      const SizedBox(height: 16),
                      Expanded(flex: 2, child: _buildTextCard('Estimasi Nilai Lahan', 'Rp. 1.500.000.000', iconPath: 'assets/icons/ic_nilailahan.svg')),
                      const SizedBox(height: 16),
                      Expanded(flex: 3, child: _buildStatCard('assets/icons/ic_suhu.svg', 'Temperatur', '19', '°C')),
                      const SizedBox(height: 16),
                      Expanded(flex: 3, child: _KomoditasCard(komoditasData: data?['commodities'])),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                
                // KOLOM 3
                Expanded(
                  child: Column(
                    children: [
                      Expanded(flex: 1, child: _buildActionCard('assets/icons/ic_inventory.svg', 'Inventaris Lahan')),
                      const SizedBox(height: 16),
                      Expanded(flex: 1, child: _buildActionCard('assets/icons/ic_progresstracking.svg', 'Progress Tracking')),
                      const SizedBox(height: 16),
                      Expanded(flex: 1, child: _buildActionCard('assets/icons/ic_logaktivitas.svg', 'Log aktivitas')),
                      const SizedBox(height: 16),
                      // Melempar data PIC ke fungsi _buildPICCard
                      Expanded(flex: 7, child: _buildPICCard(data?['pic'] ?? 'Belum ada PIC')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            data?['image'] ?? 'assets/images/lahan_dummy.png', 
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            bottom: 0, left: 0, right: 0, height: 150,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter, end: Alignment.topCenter,
                  colors: [Colors.black.withValues(alpha: 0.8), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            top: 24, right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Text('Masa Tanam', style: AppTextStyles.bodyBold),
            ),
          ),
          Positioned(
            bottom: 24, left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data?['name'] ?? 'Nama Lahan', style: AppTextStyles.heading3Bold.copyWith(color: Colors.white)),
                Text(data?['location'] ?? 'Lokasi', style: AppTextStyles.heading3.copyWith(color: Colors.white70)),
              ],
            ),
          ),
          Positioned(
            bottom: 24, right: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Text('Informasi Investasi', style: AppTextStyles.bodyBold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextCard(String title, String value, {String? iconPath}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), 
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (iconPath != null) ...[
            SvgPicture.asset(
              iconPath,
              width: 25,
              colorFilter: ColorFilter.mode(AppColors.darkgreen, BlendMode.srcIn),
            ),
            const SizedBox(height: 2), 
          ],
          Text(title, style: AppTextStyles.bodyBold),
          const SizedBox(height: 2), 
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Text(value, style: AppTextStyles.subBody.copyWith(color: Colors.grey.shade700)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String iconPath, String title, String value, String unit) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
              iconPath,
              width: 25,
              colorFilter: ColorFilter.mode(AppColors.darkgreen, BlendMode.srcIn),
            ),
          const SizedBox(height: 4),
          Text(title, style: AppTextStyles.bodyBold),
          const Spacer(), 
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: AppTextStyles.heading2Bold.copyWith(fontSize: 42, color: AppColors.darkgreen)),
              Text(unit, style: AppTextStyles.heading2Bold.copyWith(fontSize: 42, color: AppColors.darkgreen)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(String iconPath, String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
              iconPath,
              width: 25,
              colorFilter: ColorFilter.mode(AppColors.darkgreen, BlendMode.srcIn),
            ),
          const SizedBox(width: 12),
          Text(title, style: AppTextStyles.bodyBold),
        ],
      ),
    );
  }

  Widget _buildPICCard(String picName) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/icons/ic_penanggungjawab.svg',
                  width: 20,
                  colorFilter: ColorFilter.mode(AppColors.darkgreen, BlendMode.srcIn),
                ),
                const SizedBox(height: 4),
                Text('Penanggungjawab', style: AppTextStyles.bodyBold),
                Text(picName, style: AppTextStyles.subBody.copyWith(color: Colors.grey.shade600)),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
              child: Image.asset('assets/images/pegawai_dummy.png', width: double.infinity, fit: BoxFit.cover), 
            ),
          ),
        ],
      ),
    );
  }
}

class _KomoditasCard extends StatefulWidget {
  final List<dynamic>? komoditasData;

  const _KomoditasCard({this.komoditasData});

  @override
  State<_KomoditasCard> createState() => _KomoditasCardState();
}

class _KomoditasCardState extends State<_KomoditasCard> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Jika data null atau kosong, berikan nilai default agar tidak error
    final List<dynamic> activeList = (widget.komoditasData != null && widget.komoditasData!.isNotEmpty) 
        ? widget.komoditasData! 
        : [{'name': 'Data Kosong', 'percentage': '0%'}];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/icons/ic_komoditas.svg',
            width: 25,
            colorFilter: ColorFilter.mode(AppColors.darkgreen, BlendMode.srcIn),
          ),
          const SizedBox(height: 2),
          Text('Komoditas', style: AppTextStyles.bodyBold),
          
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemCount: activeList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(activeList[index]['name'], style: AppTextStyles.body ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        activeList[index]['percentage'], 
                        style: AppTextStyles.heading2Bold.copyWith(fontSize: 36, color: AppColors.darkgreen),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          
          const SizedBox(height: 4), 
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              activeList.length, 
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: _currentIndex == index ? 16 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? AppColors.darkgreen : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}