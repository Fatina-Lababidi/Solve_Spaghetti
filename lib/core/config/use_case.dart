import 'package:clean_demo/service/post_repository.dart';
import 'package:dartz/dartz.dart';
import '../error_model.dart';
import '../../model/post_entity.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
}

class GetPostsUseCase
    implements UseCase<Either<ErrorModel, List<PostEntity>>, void> {
  final PostRepository _postRepository;

  GetPostsUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  @override
  Future<Either<ErrorModel, List<PostEntity>>> call({void params}) {
    return _postRepository.getPosts.call();
  }
}