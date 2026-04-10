import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.sharedPreferences,
  });

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      
      // Guardar sesión
      await sharedPreferences.setString('user_id', userModel.id);
      await sharedPreferences.setString('user_email', userModel.email);
      await sharedPreferences.setString('user_name', userModel.name);
      await sharedPreferences.setString('user_role', userModel.role);
      
      return Right(userModel);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    final userId = sharedPreferences.getString('user_id');
    
    if (userId == null) {
      return Left(ServerFailure(message: 'No hay sesión activa'));
    }
    
    final user = UserModel(
      id: userId,
      email: sharedPreferences.getString('user_email') ?? '',
      name: sharedPreferences.getString('user_name') ?? '',
      role: sharedPreferences.getString('user_role') ?? 'customer',
    );
    
    return Right(user);
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    await sharedPreferences.clear();
    return const Right(null);
  }
}