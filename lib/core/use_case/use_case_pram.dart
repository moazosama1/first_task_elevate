abstract class UseCasePram<Type, Pram> {
  Future<Type> call(Pram);
}
