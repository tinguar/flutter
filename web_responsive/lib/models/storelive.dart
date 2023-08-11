import 'package:web_responsive_ui/core/assets/assets.dart';

class StoreLiveEC {
  final String? title;
  final String? link;
  final String? description;
  final String? iconImage;

  StoreLiveEC({
    this.title,
    this.description,
    this.link,
    this.iconImage,
  });
}

List<StoreLiveEC> storeLiveECs = [
  StoreLiveEC(
    title: 'Netflix',
    description:
        'Netflix, Inc. es una empresa de entretenimiento y un servicio por suscripción estadounidense que opera a nivel mundial y cuyo servicio principal es la distribución de contenidos audiovisuales a través de una plataforma en línea o servicio de video bajo demanda por streaming.',
    link: 'https://streamingecu.com/',
    iconImage: Assets.pngNetflix,
  ),
  StoreLiveEC(
      title: 'HBO Max',
      description:
          'HBO Max es una plataforma de streaming estadounidense propiedad de WarnerMedia, una división de AT&T. El servicio se lanzó el 27 de mayo de 2020 en los Estados Unidos y está disponible en Latinoamérica y el Caribe desde el 29 de junio de 2021.',
      link: 'https://github.com/GbrielGarcia/noticias',
      iconImage: Assets.pngHboMax),
  StoreLiveEC(
      title: 'Disney Plus',
      description:
          'Disney+ es un servicio de suscripción de vídeo a la carta en streaming propiedad de la división de Distribución de Medios y Entretenimiento de The Walt Disney Company y gestionado por la misma. Disney, Pixar, Marvel, Star Wars y National Geographic.​',
      link: 'https://superhuertastecnology.com/#',
      iconImage: Assets.pngDisney),
  StoreLiveEC(
      title: 'Amazon Prime',
      description:
          'Amazon Prime Video, también comercializado como Prime Video, es un servicio de videos disponible en retransmisión en directo, creado y gestionado por STORELIVE.EC',
      link: 'https://github.com/GbrielGarcia/noticias',
      iconImage: Assets.pngPrimeVideo),
  StoreLiveEC(
      title: 'Star Plus',
      description:
          'Star plus cuenta con contenido exclusivo, películas, series, series animadas, deportes, torneos deportivos en vivo y mucho más, También puedes ver los partidos de la Liga Pro.',
      link: 'https://inoxhierro.com',
      iconImage: Assets.pngStarPlus),
  StoreLiveEC(
      title: 'Spotify',
      description:
          'Spotify es una empresa de servicios multimedia sueca fundada en 2006, cuyo producto es la aplicación homónima empleada para la reproducción de música vía streaming.',
      link: 'https://inoxhierro.com',
      iconImage: Assets.pngspotify),
];
