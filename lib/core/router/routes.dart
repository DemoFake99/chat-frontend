enum Routes {
  initial('/'),

  login('/login'),

  chat('/chat'),
  ;

  final String path;

  const Routes(this.path);
}
