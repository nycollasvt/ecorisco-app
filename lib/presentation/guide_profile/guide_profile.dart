import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import 'widgets/about_tab_widget.dart';
import 'widgets/availability_tab_widget.dart';
import 'widgets/booking_bottom_sheet_widget.dart';
import 'widgets/guide_header_widget.dart';
import 'widgets/guide_tabs_widget.dart';
import 'widgets/photos_tab_widget.dart';
import 'widgets/reviews_tab_widget.dart';

class GuideProfile extends StatefulWidget {
  const GuideProfile({Key? key}) : super(key: key);

  @override
  State<GuideProfile> createState() => _GuideProfileState();
}

class _GuideProfileState extends State<GuideProfile>
    with TickerProviderStateMixin {
  late TabController _tabController;
  bool _isFavorite = false;
  DateTime? _selectedDate;
  String? _selectedTime;

  // Mock data for the guide
  final Map<String, dynamic> _guideData = {
    "id": "guide_001",
    "name": "Carlos Eduardo Silva",
    "profileImage":"https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "rating": 4.8,
    "toursCompleted": 127,
    "isOnline": true,
    "bio": "Sou guia de turismo há mais de 8 anos, especializado em trilhas ecológicas. Minha paixão é compartilhar a beleza natural do nosso país, sempre priorizando a segurança.",
    "languages": [{"name": "Português", "flag": "🇧🇷"}, {"name": "English", "flag": "🇺🇸"}],
    "specialties": [{"name": "Trilhas Ecológicas", "description": "Especialista em trilhas de diferentes níveis", "icon": "hiking"}],
    "certifications": [{"name": "Guia de Turismo Credenciado", "issuer": "EMBRATUR", "validUntil": "12/2025"}],
  };

  final List<Map<String, dynamic>> _reviews = [
    {
      "userName": "Maria Santos", "userPhoto": "https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      "rating": 5, "date": "15/08/2025",
      "comment": "Experiência incrível! Carlos conhece cada detalhe da trilha. Super recomendo!", "tourType": "Trilha Fotográfica"
    },
  ];

  final Map<String, dynamic> _availabilityData = {
    "availableDates": [{"date": "30/08/2025", "slots": 3}, {"date": "31/08/2025", "slots": 2}],
    "timeSlots": [{"time": "08:00", "price": "150,00"}, {"time": "14:00", "price": "140,00"}],
  };

  final List<Map<String, dynamic>> _photos = [
    {"url": "https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg", "title": "Cachoeira do Vale", "location": "Parque Nacional"},
    {"url": "https://images.pexels.com/photos/1624496/pexels-photo-1624496.jpeg", "title": "Mirante do Pôr do Sol", "location": "Serra da Mantiqueira"},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Perfil do Guia", style: TextStyle(color: Colors.black)),
        backgroundColor: AppTheme.lightTheme.colorScheme.surface,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          GuideHeaderWidget(
            guideData: _guideData,
            isFavorite: _isFavorite,
            onFavoritePressed: () => setState(() => _isFavorite = !_isFavorite),
            onSharePressed: () {},
          ),
          GuideTabsWidget(tabController: _tabController),
          SizedBox(height: 2.h),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AboutTabWidget(guideData: _guideData),
                ReviewsTabWidget(reviews: _reviews),
                AvailabilityTabWidget(
                  availabilityData: _availabilityData,
                  onDateSelected: (date, time) {
                    setState(() { _selectedDate = date; _selectedTime = time; });
                  },
                ),
                PhotosTabWidget(photos: _photos),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(3.w),
        child: ElevatedButton(
          onPressed: _showBookingBottomSheet,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 2.h),
          ),
          child: Text("Solicitar Tour", style: TextStyle(fontSize: 16.sp)),
        ),
      ),
    );
  }

  void _showBookingBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BookingBottomSheetWidget(
        guideData: _guideData,
        selectedDate: _selectedDate,
        selectedTime: _selectedTime,
        onBookingConfirmed: (bookingData) {
          Fluttertoast.showToast(msg: "Solicitação enviada!");
          Navigator.pop(context);
        },
      ),
    );
  }
}
