mixin Transformable<T> {
  T transformable();
}
extension TransformableList<T>on List<Transformable<T>>{
  List<T>transformable()=>map((item)=>item.transformable()).toList();
}