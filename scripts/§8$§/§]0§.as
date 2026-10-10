package §8$§
{
   import §8U§.§52§;
   
   public class §]0§ extends §7;§
   {
      
      private var §0F§:§52§;
      
      private var §1R§:§52§;
      
      private var §9W§:§52§;
      
      private var §8;§:Boolean;
      
      private var §0M§:Boolean;
      
      public function §]0§()
      {
         super();
      }
      
      public function §!3§(param1:§52§) : §]0§
      {
         this.§0F§ = param1;
         return this;
      }
      
      public function §]Y§(param1:§52§) : §]0§
      {
         this.§1R§ = param1;
         return this;
      }
      
      public function §`&§(param1:§52§) : §]0§
      {
         this.§9W§ = param1;
         return this;
      }
      
      public function §^P§(param1:Boolean) : §]0§
      {
         this.§8;§ = param1;
         return this;
      }
      
      override public function initialise(param1:Vector.<§7;§>) : void
      {
         var _loc2_:§52§ = null;
         var _loc3_:§52§ = null;
         var _loc11_:Number = NaN;
         super.initialise(param1);
         _loc2_ = §52§.§02§(this.§1R§,this.§0F§,new §52§());
         _loc3_ = §52§.§02§(this.§9W§,this.§0F§,new §52§());
         var _loc4_:Number = _loc2_.§!X§;
         var _loc5_:Number = Math.acos(_loc2_.§=D§(_loc3_) / (_loc2_.§!X§ * _loc3_.§!X§));
         if(this.§8;§)
         {
            _loc5_ = 2 * Math.PI - _loc5_;
         }
         §-N§ = _loc5_ * _loc4_;
         var _loc6_:int = Math.ceil(§-N§ / §3"§);
         §<+§ = §-N§ / _loc6_;
         var _loc7_:Number = §<+§ / _loc4_;
         var _loc8_:Number = Math.atan2(_loc2_.y,_loc2_.x);
         var _loc9_:Number = Math.atan2(_loc3_.y,_loc3_.x);
         while(_loc9_ > _loc8_ && Math.abs(_loc9_ - _loc8_) > Math.PI)
         {
            _loc9_ -= 2 * Math.PI;
         }
         while(_loc9_ < _loc8_ && Math.abs(_loc9_ - _loc8_) > Math.PI)
         {
            _loc9_ += 2 * Math.PI;
         }
         this.§0M§ = !(_loc9_ < _loc8_ && !this.§8;§ || _loc9_ > _loc8_ && this.§8;§);
         if(this.§8;§ && Math.abs(_loc9_ - _loc8_) < Math.PI)
         {
            if(this.§0M§)
            {
               _loc9_ += 2 * Math.PI;
            }
            else
            {
               _loc9_ -= 2 * Math.PI;
            }
         }
         §'D§ = new Vector.<§52§>();
         var _loc10_:int = 0;
         while(_loc10_ <= _loc6_)
         {
            _loc11_ = _loc8_ + (_loc9_ - _loc8_) * _loc10_ / _loc6_;
            §'D§.push(new §52§(this.§0F§.x + Math.cos(_loc11_) * _loc4_,this.§0F§.y + Math.sin(_loc11_) * _loc4_));
            _loc10_++;
         }
      }
      
      override public function get startAngle() : Number
      {
         if(this.§0M§)
         {
            return Math.atan2(this.§0F§.x - this.§1R§.x,this.§1R§.y - this.§0F§.y);
         }
         return Math.atan2(this.§1R§.x - this.§0F§.x,this.§0F§.y - this.§1R§.y);
      }
      
      override public function get endAngle() : Number
      {
         if(!this.§0M§)
         {
            return Math.atan2(this.§0F§.x - this.§9W§.x,this.§9W§.y - this.§0F§.y);
         }
         return Math.atan2(this.§9W§.x - this.§0F§.x,this.§0F§.y - this.§9W§.y);
      }
      
      override public function get startX() : Number
      {
         return this.§1R§.x;
      }
      
      override public function get startY() : Number
      {
         return this.§1R§.y;
      }
      
      override public function get endX() : Number
      {
         return this.§9W§.x;
      }
      
      override public function get endY() : Number
      {
         return this.§9W§.y;
      }
   }
}

