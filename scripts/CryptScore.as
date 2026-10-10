package
{
   import §0$§.§&K§;
   
   public class CryptScore
   {
      
      private var fvalue1_:Number = 0;
      
      private var §^!§:Number = 0;
      
      private var fvalue2_:Number = 0;
      
      private var fvalue3_:Number = 0;
      
      private var §],§:uint;
      
      private var fvalue4_:Number = 0;
      
      public function CryptScore(param1:Number = 0)
      {
         super();
         this.§^!§ = param1 * 32 - 7;
         this.§],§ = this.§,2§(this.§^!§);
      }
      
      public function get value() : Number
      {
         if(this.§],§ != this.§,2§(this.§^!§))
         {
            §&K§.instance.§ Q§.§^V§();
         }
         return (this.§^!§ + 7) * 0.03125;
      }
      
      public function set value(param1:Number) : void
      {
         if(this.§],§ != this.§,2§(this.§^!§))
         {
            §&K§.instance.§ Q§.§^V§();
            return;
         }
         this.fvalue1_ = param1;
         this.fvalue2_ = -param1;
         this.§^!§ = param1 * 32 - 7;
         this.fvalue3_ = param1 * 2;
         this.fvalue4_ = param1 * 31;
         this.§],§ = this.§5E§(this.§^!§);
         var _loc2_:uint = uint(this.§^!§ + 45342 << 4 ^ (this.§^!§ >> 5) * this.§^!§);
         var _loc3_:uint = uint(this.§^!§ << 6 ^ (this.§^!§ >> 3) - this.§^!§);
         var _loc4_:uint = uint(this.§^!§ << 16 ^ (this.§^!§ >> 11) + this.§^!§);
         var _loc5_:uint = uint(this.§^!§ << 24 ^ (this.§^!§ >> 7) / this.§^!§);
         this.§],§ = _loc2_ ^ _loc3_ | _loc4_ & _loc5_;
      }
      
      private function §,2§(param1:Number) : uint
      {
         var _loc2_:uint = uint(this.§^!§ + 45342 << 4 ^ (this.§^!§ >> 5) * this.§^!§);
         var _loc3_:uint = uint(this.§^!§ << 6 ^ (this.§^!§ >> 3) - this.§^!§);
         var _loc4_:uint = uint(this.§^!§ << 16 ^ (this.§^!§ >> 11) + this.§^!§);
         var _loc5_:uint = uint(this.§^!§ << 24 ^ (this.§^!§ >> 7) / this.§^!§);
         return _loc2_ ^ _loc3_ | _loc4_ & _loc5_;
      }
      
      public function §5E§(param1:Number) : uint
      {
         return param1 * 2479;
      }
   }
}

