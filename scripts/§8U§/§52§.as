package §8U§
{
   import flash.geom.Matrix;
   
   public class §52§
   {
      
      public var x:Number;
      
      public var y:Number;
      
      public function §52§(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.x = param1;
         this.y = param2;
      }
      
      public static function add(param1:§52§, param2:§52§, param3:§52§) : §52§
      {
         param3.x = param1.x + param2.x;
         param3.y = param1.y + param2.y;
         return param3;
      }
      
      public static function §02§(param1:§52§, param2:§52§, param3:§52§) : §52§
      {
         param3.x = param1.x - param2.x;
         param3.y = param1.y - param2.y;
         return param3;
      }
      
      public static function §'P§(param1:§52§, param2:§52§, param3:§52§) : §52§
      {
         param3.x = param2.x;
         param3.y = param2.y;
         param3.§]6§(param1.§=D§(param2) / param2.§=D§(param2));
         return param3;
      }
      
      public function §61§(param1:Number) : §52§
      {
         this.x = param1;
         return this;
      }
      
      public function Y(param1:Number) : §52§
      {
         this.y = param1;
         return this;
      }
      
      public function §`1§(param1:Number, param2:Number) : void
      {
         this.x = Math.cos(param1) * param2;
         this.y = Math.sin(param1) * param2;
      }
      
      public function set rotation(param1:Number) : void
      {
         var _loc2_:Number = this.§!X§;
         this.x = _loc2_ * Math.cos(param1);
         this.y = _loc2_ * Math.sin(param1);
      }
      
      public function get rotation() : Number
      {
         return Math.atan2(this.y,this.x);
      }
      
      public function set §!X§(param1:Number) : void
      {
         if(this.x == 0 && this.y == 0)
         {
            this.x = 1;
            this.y = 0;
            this.§]6§(param1);
         }
         else
         {
            this.§]6§(param1 / this.§!X§);
         }
      }
      
      public function §]6§(param1:Number) : void
      {
         this.x *= param1;
         this.y *= param1;
      }
      
      public function get §!X§() : Number
      {
         return Math.sqrt(this.x * this.x + this.y * this.y);
      }
      
      public function §6T§() : Number
      {
         return this.x * this.x + this.y * this.y;
      }
      
      public function §=D§(param1:§52§) : Number
      {
         return param1.x * this.x + param1.y * this.y;
      }
      
      public function §-9§(param1:§52§) : Number
      {
         return this.x * param1.y - this.y * param1.x;
      }
      
      public function § =§(param1:Number) : void
      {
         param1 += Math.atan2(this.y,this.x);
         var _loc2_:Number = Math.sqrt(this.x * this.x + this.y * this.y);
         this.x = Math.cos(param1) * _loc2_;
         this.y = Math.sin(param1) * _loc2_;
      }
      
      public function §",§() : §52§
      {
         return new §52§(-this.y,this.x);
      }
      
      public function §9F§(param1:Matrix) : §52§
      {
         var _loc2_:Number = this.x;
         this.x = param1.a * _loc2_ + param1.c * this.y + param1.tx;
         this.y = param1.b * _loc2_ + param1.d * this.y + param1.ty;
         return this;
      }
      
      public function §^1§(param1:§52§) : Number
      {
         var _loc2_:Number = Math.acos(this.§=D§(param1) / (this.§!X§ * param1.§!X§));
         var _loc3_:§52§ = this.§",§();
         var _loc4_:Boolean = _loc3_.§=D§(param1) > 0;
         if(!_loc4_)
         {
            _loc2_ = -_loc2_;
         }
         return _loc2_;
      }
      
      public function §[M§(param1:§52§) : void
      {
         this.x += param1.x;
         this.y += param1.y;
      }
   }
}

