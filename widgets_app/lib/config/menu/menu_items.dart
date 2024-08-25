

import 'package:flutter/material.dart';

class MenuItem{
    final String title;
    final String subTitle;
    final String link;
    final IconData icon;

    const MenuItem({
      required this.title,
      required this.subTitle,
      required this.link,
      required this.icon
    });

}

const appMenuItems = <MenuItem>[

  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ),
  
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card
  ),
  
  MenuItem(
    title: 'ProgressIndicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded
  ),
  
  MenuItem(
    title: 'Snackbars y dialogos',
    subTitle: 'Indicadores de progreso y mensajes emergentes',
    link: '/snackbars',
    icon: Icons.info_outline
  ),
  
  MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded
  ),
  
  MenuItem(
    title: 'Ui Controls',
    subTitle: 'una serie de controles en flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined
  ),
  
  MenuItem(
    title: 'Tutorial',
    subTitle: 'tutorial para el uso de la app',
    link: '/tutorial',
    icon: Icons.accessible_rounded
  ),
  
  MenuItem(
    title: 'Infinite Scroll y Pull',
    subTitle: 'Listas infinitas y pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded
  ),
  
  MenuItem(
    title: 'Counter Screen',
    subTitle: 'Contadores',
    link: '/counter_screen',
    icon: Icons.add_circle_outline
  ),
  
  MenuItem(
    title: 'Cambiar Tema',
    subTitle: 'Cambiar tema de la aplicacion',
    link: '/theme-charger',
    icon: Icons.color_lens_outlined
  ),


];