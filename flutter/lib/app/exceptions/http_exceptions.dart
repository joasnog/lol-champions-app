// ignore_for_file: public_member_api_docs, sort_constructors_first
class HttpExceptions implements Exception {
  final String msg;

  HttpExceptions(this.msg);

  @override
  String toString() => 'Erro na requisição: $msg ';
}
