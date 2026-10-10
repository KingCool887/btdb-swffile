package entities
{
   import §;M§.§"L§;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import towers.Tower;
   import towers.def.AltDisplayAddonDef;
   import towers.def.DisplayAddonDef;
   
   public class §5F§ extends §"L§
   {
      
      internal var §0X§:§6;§ = null;
      
      internal var §=B§:Number = 0;
      
      public var tower:Tower = null;
      
      internal var §9K§:MovieClip = null;
      
      private var §=!§:MovieClip = null;
      
      private var §`S§:MovieClip = new MovieClip();
      
      private var §0O§:MovieClip = new MovieClip();
      
      private var sourceClass:Class = null;
      
      private var addonClips:Vector.<MovieClip> = null;
      
      public function §5F§(param1:Class)
      {
         super();
         this.§0O§.scaleX = §?V§.instance.scale;
         this.§0O§.scaleY = §?V§.instance.scale;
         this.§=!§ = new param1();
         z = 9999999;
         this.§0O§.addChild(this.§=!§);
         this.§`S§.addChild(this.§0O§);
      }
      
      public function §%&§(param1:Tower) : void
      {
         var _loc2_:DisplayAddonDef = null;
         var _loc3_:Class = null;
         var _loc4_:MovieClip = null;
         var _loc5_:AltDisplayAddonDef = null;
         this.tower = param1;
         if(param1 != null)
         {
            if(param1.def == null)
            {
               param1 = null;
               return;
            }
            if(this.§9K§ != null)
            {
               this.§=!§.inner.removeChild(this.§9K§);
               this.§9K§ = null;
            }
            this.§9K§ = new (Class(param1.def.display))();
            this.addonClips = new Vector.<MovieClip>();
            if(param1.def.displayAddons != null)
            {
               for each(_loc2_ in param1.def.displayAddons)
               {
                  _loc3_ = _loc2_.clip;
                  if(_loc2_.alts != null)
                  {
                     for each(_loc5_ in _loc2_.alts)
                     {
                        if(_loc5_.useFor == param1.def.display)
                        {
                           _loc3_ = _loc5_.display;
                           break;
                        }
                     }
                  }
                  _loc4_ = new _loc3_();
                  this.addonClips.push(_loc4_);
                  this.§9K§.addChild(_loc4_);
               }
            }
            this.sourceClass = param1.def.display;
            this.§9K§.stop();
            this.§=!§.inner.addChild(this.§9K§);
         }
      }
      
      override public function process(param1:Number) : void
      {
         super.process(param1);
      }
      
      override public function draw(param1:BitmapData) : void
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         if(Boolean(this.tower) && Boolean(this.tower.def))
         {
            if(this.sourceClass != this.tower.def.display)
            {
               this.§%&§(this.tower);
            }
            this.§=!§.x = this.tower.x;
            this.§=!§.y = this.tower.y;
            this.§=!§.rotation = this.tower.rotation / (Math.PI * 2) * 360;
            this.§9K§.gotoAndStop(this.tower.clip.frameIndex + 1);
            _loc2_ = 0;
            for each(_loc3_ in this.addonClips)
            {
               if(Boolean(this.tower.addonRotation) && this.tower.addonRotation[this.tower.addonClips[_loc2_]] != null)
               {
                  _loc3_.rotation = this.tower.addonRotation[this.tower.addonClips[_loc2_]] / (Math.PI * 2) * 360 - this.§=!§.rotation;
               }
               else if(!this.tower.def.displayAddons[_loc2_].rotate)
               {
                  _loc3_.rotation = -this.§=!§.rotation;
               }
               else
               {
                  _loc3_.rotation = 0;
               }
               _loc3_.gotoAndStop(this.tower.addonClips[_loc2_].frameIndex + 1);
               _loc2_++;
            }
            param1.draw(this.§`S§);
         }
         super.draw(param1);
      }
   }
}

