import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget {
  final String iconName;
  final double size;
  final Color? color;

  const CustomIconWidget({
    Key? key,
    required this.iconName,
    this.size = 24.0,
    this.color,
  }) : super(key: key);

  static const Map<String, IconData> _iconMap = {
    'star': Icons.star, 'star_border': Icons.star_border, 'verified': Icons.verified,
    'favorite': Icons.favorite, 'favorite_border': Icons.favorite_border, 'share': Icons.share,
    'hiking': Icons.hiking, 'camera_alt': Icons.camera_alt, 'pets': Icons.pets,
    'message': Icons.message, 'people': Icons.people, 'close': Icons.close,
    'calendar_today': Icons.calendar_today, 'access_time': Icons.access_time,
    'remove_circle_outline': Icons.remove_circle_outline, 'add_circle_outline': Icons.add_circle_outline,
    'info': Icons.info, 'group': Icons.group, 'location_on': Icons.location_on,
    'map': Icons.map, 'tour': Icons.tour, 'person': Icons.person, 'add': Icons.add,
    'add_location': Icons.add_location, 'radio_button_checked': Icons.radio_button_checked,
    'layers': Icons.layers, 'my_location': Icons.my_location, 'satellite_alt': Icons.satellite_alt,
    'terrain': Icons.terrain, 'check': Icons.check, 'straighten': Icons.straighten,
    'offline_pin': Icons.offline_pin, 'cloud_download': Icons.cloud_download,
    'psychology': Icons.psychology, 'wb_sunny': Icons.wb_sunny, 'search': Icons.search,
    'tune': Icons.tune, 'arrow_back': Icons.arrow_back_ios, 'more_vert': Icons.more_vert,
    'visibility': Icons.visibility, 'warning': Icons.warning, 'circle': Icons.circle,
    'dangerous': Icons.dangerous_outlined, 'event_busy': Icons.event_busy,
  };

  @override
  Widget build(BuildContext context) {
    return Icon(
      _iconMap[iconName] ?? Icons.help,
      size: size,
      color: color ?? Theme.of(context).iconTheme.color,
    );
  }
}
