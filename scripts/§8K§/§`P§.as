package §8K§
{
   import §+C§.§0>§;
   import assets.gui.BloonSendButton;
   import flash.display.MovieClip;
   import game.§-3§;
   import game.BloonSendDef;
   
   public class §`P§
   {
      
      private var mc:MovieClip;
      
      private var §'&§:MovieClip;
      
      private var §@@§:Vector.<BloonSendButton>;
      
      private var §^N§:§0>§;
      
      public function §`P§()
      {
         super();
      }
      
      public function §,B§(param1:MovieClip) : void
      {
         this.mc = param1;
         this.§'&§ = new MovieClip();
         this.§'&§.x = this.mc.bsMask.x;
         this.§'&§.y = this.mc.bsMask.y;
         this.mc.addChild(this.§'&§);
         this.§'&§.mask = this.mc.bsMask;
      }
      
      public function §3I§(param1:§0>§) : void
      {
         this.§^N§ = param1;
         param1.§`9§.add(this.§@'§);
         param1.§^=§.add(this.§>4§);
         param1.§83§.add(this.§4M§);
         this.§4M§();
      }
      
      public function §<E§() : void
      {
         this.§^N§.§`9§.remove(this.§@'§);
         this.§^N§.§^=§.remove(this.§>4§);
         this.§^N§.§83§.remove(this.§4M§);
         this.§^N§ = null;
      }
      
      private function §@'§(param1:int, param2:String, param3:Boolean, param4:Boolean) : void
      {
         this.§4M§();
      }
      
      private function §>4§(param1:int) : void
      {
         this.§4M§();
      }
      
      private function §4M§() : void
      {
         var _loc3_:§-3§ = null;
         var _loc4_:BloonSendDef = null;
         var _loc5_:BloonSendButton = null;
         while(this.§'&§.numChildren > 0)
         {
            this.§'&§.removeChildAt(0);
         }
         this.§@@§ = new Vector.<BloonSendButton>();
         var _loc1_:Vector.<§-3§> = this.§^N§.§4O§;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            _loc4_ = _loc3_.§1T§;
            _loc5_ = new BloonSendButton();
            if(_loc3_.camo == true && _loc3_.regen == true)
            {
               _loc5_.holder_mc.addChild(new _loc4_.thumbRegenCamo());
            }
            else if(_loc3_.camo == true)
            {
               _loc5_.holder_mc.addChild(new _loc4_.thumbCamo());
            }
            else if(_loc3_.regen == true)
            {
               _loc5_.holder_mc.addChild(new _loc4_.thumbRegen());
            }
            else
            {
               _loc5_.holder_mc.addChild(new _loc4_.thumbStandard());
            }
            _loc5_.qty_txt.text = "x" + _loc4_.quantity.toString();
            _loc5_.y = 0;
            _loc5_.x = 10 + 36 * _loc2_;
            var _temp_2:* = _loc5_;
            _loc5_.scaleY = 0.75;
            _temp_2.scaleX = 0.75;
            _loc5_.extra = _loc3_;
            _loc5_.lock_mc.visible = false;
            if(_loc2_ == 0)
            {
               _loc5_.valid = false;
               _loc5_.tooltip = "Sending " + _loc4_.name + " x" + _loc4_.quantity;
            }
            this.§@@§.push(_loc5_);
            this.§'&§.addChild(_loc5_);
            _loc2_++;
         }
      }
      
      public function set x(param1:Number) : void
      {
         this.mc.x = param1;
      }
   }
}

