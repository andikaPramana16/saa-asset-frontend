import 'package:flutter/material.dart';
import 'package:saa_asset_management_frontend/core/theme.dart';

class InventarisLahanView extends StatefulWidget {
  const InventarisLahanView({super.key});

  @override
  State<InventarisLahanView> createState() => _InventarisLahanViewState();
}

class _InventarisLahanViewState extends State<InventarisLahanView> {
  int _selectedFilterIndex = 0; 

  final List<Map<String, dynamic>> dummyMaterial = [
    {
      'nama_item': 'Pupuk NPK Mutiara',
      'kategori': 'Pupuk',
      'sisa_stok': '120',
      'satuan': 'Karung',
      'riwayat': [
        {'tanggal': '07-08-2005', 'jenis': 'Barang Masuk', 'ket': 'Toko Tani Makmur', 'nilai': '+100 Karung'},
        {'tanggal': '05-08-2005', 'jenis': 'Pemakaian Lapangan', 'ket': 'Pemupukan Susulan', 'nilai': '-10 Karung'},
      ]
    },
  ];

  final List<Map<String, dynamic>> dummyMesin = [
    {
      'nama_item': 'Traktor Kubota L3200',
      'kategori': 'Kendaraan',
      'status': 'Baik',
      'update_terakhir': '27-08-2005',
      'inspeksi': [
        {'tanggal': '17-08-2005', 'kondisi': 'Baik', 'pic': 'Yanto Siregar', 'catatan': 'Mesin hidup normal, oli cukup.'},
        {'tanggal': '26-08-2005', 'kondisi': 'Rusak Ringan', 'pic': 'Yanto Siregar', 'catatan': 'Busi kotor, sudah dibersihkan mekanik.'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteGreen,
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Inventaris Lahan', style: AppTextStyles.heading3Bold),
          const SizedBox(height: 4),
          Text('Sektor Barat Malang', style: AppTextStyles.subHeading),
          const SizedBox(height: 24),
          
          Row(
            children: [
              _buildFilterGroup(),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text('Kategori', style: TextStyle(color: Colors.grey.shade600)),
                    const SizedBox(width: 32),
                    Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 24),

          Expanded(
            child: _selectedFilterIndex == 0 
                ? _buildTabelMaterial() 
                : _buildTabelMesin(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterGroup() {
    final List<String> filters = ['Stok Material', 'Aset Mesin & Alat Berat'];
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(filters.length, (index) {
          final isActive = _selectedFilterIndex == index;
          return InkWell(
            onTap: () => setState(() => _selectedFilterIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isActive ? AppColors.darkgreen : Colors.transparent,
                borderRadius: BorderRadius.horizontal(
                  left: index == 0 ? const Radius.circular(7) : Radius.zero,
                  right: index == filters.length - 1 ? const Radius.circular(7) : Radius.zero,
                ),
                border: index == 0 ? Border(right: BorderSide(color: Colors.grey.shade400)) : null,
              ),
              child: Text(
                filters[index],
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.grey.shade600,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTabelMaterial() {
    return Column(
      children: [
        _buildTableHeader(['Nama Item', 'Kategori', 'Sisa Stok Terakhir', 'Satuan']),
        Expanded(
          child: ListView.builder(
            itemCount: dummyMaterial.length,
            itemBuilder: (context, index) {
              final data = dummyMaterial[index];
              final isLast = index == dummyMaterial.length - 1;
              return InkWell(
                onTap: () => _openSideDrawerMaterial(context, data),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: isLast ? const BorderRadius.vertical(bottom: Radius.circular(8)) : BorderRadius.zero,
                    border: Border(
                      left: BorderSide(color: Colors.grey.shade300),
                      right: BorderSide(color: Colors.grey.shade300),
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: Text(data['nama_item'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                      Expanded(flex: 2, child: Text(data['kategori'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                      Expanded(flex: 2, child: Text(data['sisa_stok'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                      Expanded(flex: 2, child: Text(data['satuan'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                      Icon(Icons.keyboard_arrow_right, color: Colors.grey.shade600),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _openSideDrawerMaterial(BuildContext context, Map<String, dynamic> data) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'SideDrawer',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 400,
              height: double.infinity,
              color: AppColors.darkgreen, // Hijau Gelap
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text('Detil Material', style: AppTextStyles.bodyBold.copyWith(color: Colors.white, fontSize: 18)),
                        const SizedBox(height: 24),
                        Text(data['nama_item'], style: AppTextStyles.bodyBold.copyWith(color: Colors.white, fontSize: 16)),
                        const SizedBox(height: 8),
                        Text('Sisa Stok Saat Ini:\n${data['sisa_stok']} ${data['satuan']}', 
                            textAlign: TextAlign.center, style: AppTextStyles.body.copyWith(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(child: Text('Riwayat Mutasi Stok', style: AppTextStyles.bodyBold.copyWith(color: Colors.white, fontSize: 16))),
                  const SizedBox(height: 24),
                  ...((data['riwayat'] as List).map((riwayat) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(riwayat['tanggal'], style: AppTextStyles.bodyBold.copyWith(color: Colors.white)),
                                Text(riwayat['jenis'], style: AppTextStyles.bodyBold.copyWith(color: Colors.white)),
                                Text(riwayat['ket'], style: AppTextStyles.body.copyWith(color: Colors.white70, fontSize: 12)),
                              ],
                            ),
                          ),
                          Text(riwayat['nilai'], style: AppTextStyles.body.copyWith(color: Colors.white)),
                        ],
                      ),
                    );
                  })),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
          child: child,
        );
      },
    );
  }

  Widget _buildTabelMesin() {
    return Column(
      children: [
        _buildTableHeader(['Nama Item', 'Kategori', 'Status Saat Ini', 'Update Terakhir']),
        Expanded(
          child: ListView.builder(
            itemCount: dummyMesin.length,
            itemBuilder: (context, index) {
              final data = dummyMesin[index];
              final isLast = index == dummyMesin.length - 1;
              return ExpandableMesinRow(data: data, isLast: isLast);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTableHeader(List<String> columns) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
      child: Row(
        children: [
          ...columns.map((col) => Expanded(flex: 2, child: Text(col, style: AppTextStyles.bodyBold.copyWith(fontSize: 14)))),
          const SizedBox(width: 24),
        ],
      ),
    );
  }
}

class ExpandableMesinRow extends StatefulWidget {
  final Map<String, dynamic> data;
  final bool isLast;

  const ExpandableMesinRow({super.key, required this.data, this.isLast = false});

  @override
  State<ExpandableMesinRow> createState() => _ExpandableMesinRowState();
}

class _ExpandableMesinRowState extends State<ExpandableMesinRow> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> inspeksi = widget.data['inspeksi'] ?? [];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: widget.isLast ? const BorderRadius.vertical(bottom: Radius.circular(8)) : BorderRadius.zero,
        border: Border(
          left: BorderSide(color: Colors.grey.shade300),
          right: BorderSide(color: Colors.grey.shade300),
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  Expanded(flex: 2, child: Text(widget.data['nama_item'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                  Expanded(flex: 2, child: Text(widget.data['kategori'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                  Expanded(flex: 2, child: Text(widget.data['status'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                  Expanded(flex: 2, child: Text(widget.data['update_terakhir'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                  Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.grey.shade600),
                ],
              ),
            ),
          ),
          
          if (_isExpanded && inspeksi.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 8),
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(flex: 2, child: Text('Tanggal Inspeksi', style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
                      Expanded(flex: 2, child: Text('Status Kondisi', style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
                      Expanded(flex: 2, child: Text('Penanggungjawab', style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
                      Expanded(flex: 3, child: Text('Catatan / Temuan Fisik', style: AppTextStyles.bodyBold.copyWith(fontSize: 14))),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(height: 1, color: Colors.black12),
                  ),
                  ...inspeksi.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        children: [
                          Expanded(flex: 2, child: Text(item['tanggal'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                          Expanded(flex: 2, child: Text(item['kondisi'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                          Expanded(flex: 2, child: Text(item['pic'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                          Expanded(flex: 3, child: Text(item['catatan'], style: AppTextStyles.body.copyWith(fontSize: 14))),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
        ],
      ),
    );
  }
}