package §8U§
{
   public class §4&§
   {
      
      public static var t1:Number = 0;
      
      public static var t2:Number = 0;
      
      public function §4&§()
      {
         super();
      }
      
      public static function §#O§(param1:§52§, param2:Number, param3:§52§, param4:Number) : Boolean
      {
         return (param1.x - param3.x) * (param1.x - param3.x) + (param1.y - param3.y) * (param1.y - param3.y) <= (param2 + param4) * (param2 + param4);
      }
      
      public static function §;X§(param1:§52§, param2:§52§, param3:§52§, param4:§52§) : Boolean
      {
         var _loc5_:§52§ = §52§.§02§(param2,param1,new §52§());
         var _loc6_:§52§ = §52§.§02§(param4,param3,new §52§());
         var _loc7_:§52§ = §52§.§02§(param3,param1,new §52§());
         var _loc8_:Number = _loc5_.§-9§(_loc6_);
         if(_loc8_ == 0)
         {
            return false;
         }
         t1 = _loc7_.§-9§(_loc6_) / _loc8_;
         t2 = _loc7_.§-9§(_loc5_) / _loc8_;
         return t1 >= 0 && t1 <= 1 && t2 >= 0 && t2 <= 1;
      }
      
      public static function §#D§(param1:§52§, param2:§52§, param3:§52§, param4:Number) : Boolean
      {
         var _loc5_:§52§ = param2;
         var _loc6_:§52§ = §52§.§02§(param1,param3,new §52§());
         var _loc7_:Number = _loc5_.§=D§(_loc5_);
         var _loc8_:Number = 2 * _loc6_.§=D§(_loc5_);
         var _loc9_:Number = _loc6_.§=D§(_loc6_) - param4 * param4;
         var _loc10_:Number = _loc8_ * _loc8_ - 4 * _loc7_ * _loc9_;
         if(_loc10_ < 0)
         {
            return false;
         }
         _loc10_ = Math.sqrt(_loc10_);
         t1 = (-_loc8_ + _loc10_) / (2 * _loc7_);
         t2 = (-_loc8_ - _loc10_) / (2 * _loc7_);
         if(t1 * t2 < 0 || t1 >= 0 && t1 <= 1 || t2 >= 0 && t2 <= 1)
         {
            return true;
         }
         return false;
      }
      
      public static function §1J§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Boolean
      {
         return (param1 - param3) * (param1 - param3) + (param2 - param4) * (param2 - param4) <= param5 * param5;
      }
      
      public static function §"'§(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : Boolean
      {
         var _loc8_:Number = Math.abs(param1 - param4 - param6 * 0.5);
         var _loc9_:Number = param6 * 0.5 + param3;
         if(_loc8_ > _loc9_)
         {
            return false;
         }
         var _loc10_:Number = Math.abs(param2 - param5 - param7 * 0.5);
         var _loc11_:Number = param7 * 0.5 + param3;
         if(_loc10_ > _loc11_)
         {
            return false;
         }
         if(_loc8_ <= param6 * 0.5 || param2 <= param7 * 0.5)
         {
            return true;
         }
         var _loc12_:Number = _loc8_ - param6 * 0.5;
         var _loc13_:Number = _loc10_ - param7 * 0.5;
         return _loc12_ * _loc12_ + _loc13_ * _loc13_ <= param3 * param3;
      }
   }
}

