{
  self,
  treefmtEval,
  ...
}:

{
  fmt-check = treefmtEval.config.build.check self;
}
