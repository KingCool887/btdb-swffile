package entities
{
   import §+C§.§0>§;
   import §8U§.§52§;
   import §;M§.§"L§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import assets.gui.PopCash;
   import display.Clip;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import towers.Tower;
   import utils.§-B§;
   import utils.Rndm;
   
   public class Banana extends §"L§
   {
      
      public static var §9N§:Rndm = new Rndm();
      
      internal var clip:Clip = new Clip();
      
      internal var §#J§:§52§ = new §52§();
      
      internal var §3N§:§52§ = new §52§();
      
      internal var cash:§<<§ = §-A§.§]H§(0);
      
      internal var timer:§-B§ = null;
      
      internal var §]5§:* = false;
      
      internal var owner:Tower = null;
      
      private var levelSlug:§0>§ = null;
      
      public function Banana()
      {
         super();
      }
      
      public function initialise(param1:Tower, param2:int, param3:Number, param4:Class) : void
      {
         this.owner = param1;
         this.levelSlug = param1.levelSlug;
         this.cash.value = param2;
         this.timer = new §-B§(param3);
         this.timer.addEventListener(§-B§.COMPLETE,this.destroyTimer);
         this.clip.initialise(param4,1);
         this.§#J§.x = 250;
         this.§#J§.y = 0;
         this.§#J§.rotation = §9N§.random() * Math.PI * 2;
         z = 50;
      }
      
      public function destroyTimer(param1:Event) : *
      {
         this.destroy();
      }
      
      override public function destroy() : void
      {
         if(this.timer)
         {
            this.timer.removeEventListener(§-B§.COMPLETE,this.destroyTimer);
         }
         super.destroy();
      }
      
      override public function process(param1:Number) : void
      {
         var _loc2_:§52§ = null;
         var _loc5_:PopCash = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         _loc2_ = this.levelSlug.§#"§();
         this.§3N§.x = _loc2_.x - x;
         this.§3N§.y = _loc2_.y - y;
         if(this.timer.current > 0.5 && this.§3N§.§!X§ <= 30)
         {
            this.levelSlug.§4>§(this.cash.value);
            _loc5_ = new PopCash();
            _loc5_.x = x;
            _loc5_.y = y;
            _loc5_.mouseEnabled = false;
            _loc5_.mouseChildren = false;
            _loc5_.label.text = "$" + String(this.cash.value);
            §?V§.instance.§"0§.§ 2§.addChild(_loc5_);
            this.destroy();
            return;
         }
         if(Boolean(this.§]5§) || this.timer.current > 0.5 && this.§3N§.§!X§ <= 200)
         {
            _loc6_ = this.§3N§.§!X§;
            _loc7_ = 400;
            this.§#J§.x *= 0.84;
            this.§#J§.y *= 0.84;
            this.§#J§.x += _loc7_ * (this.§3N§.x / this.§3N§.§!X§);
            this.§#J§.y += _loc7_ * (this.§3N§.y / this.§3N§.§!X§);
            this.§]5§ = true;
         }
         x += this.§#J§.x * param1;
         y += this.§#J§.y * param1;
         var _loc3_:Rectangle = this.levelSlug.§1§;
         if(x - 5 < _loc3_.x)
         {
            x = _loc3_.x + 5;
            this.§#J§.x *= -1;
         }
         else if(x + 5 > _loc3_.right)
         {
            x = _loc3_.right - 5;
            this.§#J§.x *= -1;
         }
         if(y - 5 < _loc3_.y)
         {
            y = _loc3_.y + 5;
            this.§#J§.y *= -1;
         }
         else if(y + 5 > _loc3_.bottom)
         {
            y = _loc3_.bottom - 5;
            this.§#J§.y *= -1;
         }
         this.§#J§.x *= 0.9;
         this.§#J§.y *= 0.9;
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.clip.drawRotated(param1,x,y,rotation);
      }
   }
}

