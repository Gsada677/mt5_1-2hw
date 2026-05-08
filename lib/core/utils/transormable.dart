mixin Transormable<T>{
  T transform();
}
extension TransformList<T> on List<Transormable<T>>{
  List<T>transform()=>map((item)
  =>item.transform()).toList();
}
