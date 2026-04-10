import 'package:dio/dio.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      print('🔍 Intentando login con email: $email');
      
      final response = await dio.get('/users');
      
      print('📦 Respuesta del servidor: ${response.data}');
      
      final users = response.data as List;
      
      for (var user in users) {
        print('📋 Comparando: ${user['email']} == $email && ${user['password']} == $password');
      }
      
      final userFound = users.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => null,
      );
      
      if (userFound != null) {
        print('✅ Usuario encontrado: ${userFound['name']}');
        return UserModel.fromJson(userFound);
      } else {
        print('❌ No se encontró usuario con esas credenciales');
        throw Exception('Credenciales inválidas');
      }
    } on DioException catch (e) {
      print('🔥 Error de conexión: ${e.message}');
      throw Exception('Error de conexión: ${e.message}');
    }
  }
}