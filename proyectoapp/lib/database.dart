import 'package:postgres/postgres.dart';
void DataBase() async {
  final conn = await Connection.open(
    Endpoint(
      host: 'localhost',
      database: 'AppTWM',
      username: 'postgres',
      password: 'hola1234',
    ),
    settings: ConnectionSettings(sslMode: SslMode.disable),
  );
  print('has connection!');
  // simple query
  final result0 = await conn.execute("SELECT * from juez");
  print(result0[0][0]); // first row, first column

  await conn.close();
}