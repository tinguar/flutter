class Privacy {
  final String? name, text;

  Privacy({this.name, this.text});
}

final List<Privacy> privacys = [
  Privacy(
    name: "Política",
    text: '''
Gabriel Código te informa sobre sus políticas, al momento de 
contratar los servicios de Gabriel Código  está aceptando de manera voluntaria las políticas de el mismo.''',
  ),
  Privacy(
    name: "Reembolso",
    text:
   '''Si el cliente desiste de continuar con el servicio de manera voluntaria solo será entregado el 10% del dinero transferido o depositado a las cuentas de Alberto Gabriel Guaman Garcia''',
  ),
  Privacy(
    name: "Suspensión de servicios",
    text:
    "Los servicios se dan de baja por incumplimiento por parte del cliente en los pagos acordados, cada "
        "renovación de servicio se tendrá que realizar una semana antes de la fecha de vencimiento. ",
  ),
  Privacy(
    name: "Obtención de datos personales",
    text:
    "Para utilizar nuestras aplicaciones y páginas web, no es necesario facilitar ningún dato personal.",
  ),
];
