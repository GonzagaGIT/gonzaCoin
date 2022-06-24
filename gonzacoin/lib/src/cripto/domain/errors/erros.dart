abstract class ICriptoException{
  final String message;
  final StackTrace? stackTrace;

  const ICriptoException(this.message, [this.stackTrace]);
}

  class DatasourceGetException extends ICriptoException{
    const DatasourceGetException(super.message, [super.stackTrace]);
  }