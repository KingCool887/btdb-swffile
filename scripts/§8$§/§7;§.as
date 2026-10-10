package §8$§
{
   import §8U§.§52§;
   import bloons.Bloon;
   import flash.display.MovieClip;
   
   public class §7;§
   {
      
      public static var §?F§:MovieClip;
      
      public static const §+Q§:int = 0;
      
      public static const underpass:int = 1;
      
      public static const §17§:int = 2;
      
      public static const §?D§:int = 3;
      
      public static const max:int = 4;
      
      public var §]V§:int = 0;
      
      public var layer:int = 0;
      
      public var §<V§:Vector.<int> = new Vector.<int>();
      
      public var §^J§:Vector.<§7;§> = new Vector.<§7;§>();
      
      public var §86§:Vector.<§7;§> = new Vector.<§7;§>();
      
      protected const §3"§:Number = 1;
      
      public var §-N§:Number;
      
      public var §<+§:Number;
      
      public var §'D§:Vector.<§52§>;
      
      private var §@=§:int = 0;
      
      public var §"<§:Boolean = false;
      
      public var §]M§:Boolean = false;
      
      private var §1,§:Vector.<§7;§>;
      
      public var §3+§:Number = -1;
      
      private var §#A§:Number = -1;
      
      private var §6"§:Number = -1;
      
      public function §7;§()
      {
         super();
      }
      
      public function §+'§(param1:Vector.<int>) : §7;§
      {
         this.§<V§ = param1;
         return this;
      }
      
      public function §&I§(param1:int) : §7;§
      {
         this.§]V§ = param1;
         return this;
      }
      
      public function §;=§(param1:int) : §7;§
      {
         this.layer = param1;
         return this;
      }
      
      public function initialise(param1:Vector.<§7;§>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§7;§ = null;
         if(this.§"<§)
         {
            return;
         }
         for each(_loc2_ in this.§<V§)
         {
            _loc3_ = param1[_loc2_];
            this.§^J§.push(_loc3_);
            _loc3_.§86§.push(this);
         }
         this.§"<§ = true;
      }
      
      public function §%Q§(param1:Bloon) : void
      {
         var _loc6_:§7;§ = null;
         var _loc7_:§7;§ = null;
         if(param1.§=E§ < 0)
         {
            if(this.§86§.length != 0)
            {
               _loc6_ = this.§86§[0];
               if(_loc6_.§]V§ != §17§)
               {
                  param1.§=E§ += _loc6_.§-N§;
               }
               param1.tile = _loc6_;
               _loc6_.§%Q§(param1);
            }
            else
            {
               param1.x = -5000;
            }
            return;
         }
         if(this.§]V§ == §17§)
         {
            param1.§=E§ += this.§-N§;
         }
         var _loc2_:int = Math.floor((this.§'D§.length - 1) * param1.§=E§ / this.§-N§);
         var _loc3_:Number = (param1.§=E§ - _loc2_ * this.§<+§) / this.§<+§;
         if(_loc2_ >= this.§'D§.length - 1)
         {
            param1.§=E§ -= this.§-N§;
            if(this.§^J§.length != 0)
            {
               ++this.§@=§;
               _loc7_ = this.§^J§[this.§@=§ % this.§^J§.length];
               if(param1.tile.§]M§)
               {
                  param1.overallProgress = this.§^?§();
               }
               param1.tile = _loc7_;
               _loc7_.§%Q§(param1);
            }
            else
            {
               param1.§>'§();
            }
            return;
         }
         var _loc4_:§52§ = this.§'D§[_loc2_];
         var _loc5_:§52§ = this.§'D§[_loc2_ + 1];
         param1.x = _loc4_.x + (_loc5_.x - _loc4_.x) * _loc3_;
         param1.y = _loc4_.y + (_loc5_.y - _loc4_.y) * _loc3_;
      }
      
      public function get startAngle() : Number
      {
         return 0;
      }
      
      public function get endAngle() : Number
      {
         return 0;
      }
      
      public function get startX() : Number
      {
         return 0;
      }
      
      public function get startY() : Number
      {
         return 0;
      }
      
      public function get endX() : Number
      {
         return 0;
      }
      
      public function get endY() : Number
      {
         return 0;
      }
      
      public function §#!§(param1:Vector.<§7;§>) : void
      {
         var _loc2_:§7;§ = null;
         if(this.§1,§)
         {
            for each(_loc2_ in this.§1,§)
            {
               param1.push(_loc2_);
            }
            return;
         }
         for each(_loc2_ in this.§86§)
         {
            _loc2_.§#!§(param1);
            if(_loc2_.§]V§ == §+Q§)
            {
               param1.push(_loc2_);
            }
         }
         this.§1,§ = new Vector.<§7;§>();
         for each(_loc2_ in param1)
         {
            this.§1,§.push(_loc2_);
         }
      }
      
      public function §^?§() : Number
      {
         if(this.§3+§ == -1)
         {
            this.§3+§ = 0;
            if(this.§86§.length != 0)
            {
               this.§3+§ = this.§86§[0].§^?§();
               this.§3+§ += this.§86§[0].§-N§;
            }
         }
         return this.§3+§;
      }
      
      public function §]4§() : Number
      {
         if(this.§#A§ != -1)
         {
            return this.§#A§;
         }
         var _loc1_:Number = this.§]V§ == 2 ? 0 : this.§-N§;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < this.§^J§.length)
         {
            _loc3_ = this.§^J§[_loc4_].§]4§();
            if(_loc3_ > _loc2_)
            {
               _loc2_ = _loc3_;
            }
            _loc4_++;
         }
         _loc1_ += _loc2_;
         this.§#A§ = _loc1_;
         return _loc1_;
      }
      
      public function §&E§() : Number
      {
         if(this.§6"§ != -1)
         {
            return this.§6"§;
         }
         var _loc1_:Number = this.§]V§ == 2 ? 0 : this.§-N§;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:int = 0;
         while(_loc4_ < this.§86§.length)
         {
            _loc3_ = this.§86§[_loc4_].§&E§();
            if(_loc3_ > _loc2_)
            {
               _loc2_ = _loc3_;
            }
            _loc4_++;
         }
         _loc1_ += _loc3_;
         this.§6"§ = _loc1_;
         return _loc1_;
      }
   }
}

