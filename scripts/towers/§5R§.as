package towers
{
   import §8K§.§ E§;
   import §8K§.§0"§;
   import §;M§.§"L§;
   import assets.effects.CantPlaceEffect;
   import assets.effects.Place;
   import assets.sounds.Place;
   import assets.towerPlace.Ace;
   import assets.towerPlace.AceUnder;
   import assets.towers.Meerkat;
   import assets.towers.MeerkatHead;
   import assets.towers.MeerkatHeadPro;
   import assets.towers.MeerkatMound;
   import assets.towers.TribalCoconutArm;
   import assets.towers.TribalSpearArm;
   import assets.towers.TribalWaterRipple;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import sound.§^5§;
   import towers.behavior.initialise.BloonberryInit;
   import towers.def.AreaEffectDef;
   import towers.def.DisplayAddonDef;
   import towers.def.TowerDef;
   import towers.upgrades.AddDef;
   import towers.upgrades.Combinator;
   import towers.upgrades.UpgradeDef;
   import utils.Pool;
   
   public class §5R§ extends §"L§
   {
      
      public static var §;%§:UpgradeDef = new UpgradeDef().Add(new AddDef().DisplayAddons(Vector.<DisplayAddonDef>([new DisplayAddonDef().Clip(TribalWaterRipple).Z(-4).Loop(true)])));
      
      public var def:TowerDef;
      
      public var towerPickerDef:§ E§;
      
      private var clip:MovieClip;
      
      private var clip2:MovieClip;
      
      private var occupiedSpace:MovieClip = null;
      
      private var range:§0"§ = new §0"§();
      
      private var §'S§:Matrix = new Matrix();
      
      private var §`#§:MovieClip = new assets.effects.Place();
      
      private var §@?§:MovieClip = new CantPlaceEffect();
      
      private var §#Y§:ColorTransform = new ColorTransform(0,0,0,1,255);
      
      private var §="§:§^5§ = new §^5§(assets.sounds.Place);
      
      public function §5R§()
      {
         super();
      }
      
      public function initialise(param1:TowerDef, param2:§ E§) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:MovieClip = null;
         var _loc6_:MovieClip = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc10_:Object = null;
         this.occupiedSpace = new (Class(param1.occupiedSpace))();
         this.range.visible = true;
         this.range.process(param1);
         this.def = param1;
         this.towerPickerDef = param2;
         §?V§.instance.stage.addEventListener(MouseEvent.MOUSE_UP,this.§[A§);
         if(param1.id == "Meerkat" || param1.id == "MeerkatPro")
         {
            rotation = -Math.PI / 2;
            this.clip = new MovieClip();
            §?V§.instance.addChild(this.clip);
            _loc4_ = new MeerkatMound();
            _loc4_.rotation = 90;
            this.clip.addChild(_loc4_);
            this.clip.addChild(new Meerkat());
            if(param1.id == "Meerkat")
            {
               this.clip.addChild(new MeerkatHead());
            }
            else
            {
               this.clip.addChild(new MeerkatHeadPro());
            }
            this.clip2 = new MovieClip();
            §?V§.instance.addChild(this.clip2);
            _loc4_ = new MeerkatMound();
            _loc4_.rotation = 90;
            this.clip2.addChild(_loc4_);
            this.clip2.addChild(new Meerkat());
            if(param1.id == "Meerkat")
            {
               this.clip2.addChild(new MeerkatHead());
            }
            else
            {
               this.clip2.addChild(new MeerkatHeadPro());
            }
         }
         else if(param1.id == "MonkeyAce")
         {
            §?V§.instance.addChild(this.clip = new AceUnder());
            §?V§.instance.addChild(this.clip2 = new Ace());
         }
         else if(param1.id == "TribalTurtle" || param1.id == "TribalTurtlePro")
         {
            this.clip = new MovieClip();
            _loc5_ = new TribalSpearArm();
            _loc5_.stop();
            this.clip.addChild(_loc5_);
            _loc6_ = new TribalCoconutArm();
            _loc6_.stop();
            this.clip.addChild(_loc6_);
            this.clip.addChild(new (Class(param1.display))());
            this.clip2 = new MovieClip();
            _loc5_ = new TribalSpearArm();
            _loc5_.stop();
            this.clip2.addChild(_loc5_);
            _loc6_ = new TribalCoconutArm();
            _loc6_.stop();
            this.clip2.addChild(_loc6_);
            this.clip2.addChild(new (Class(param1.display))());
            §?V§.instance.addChild(this.clip);
            §?V§.instance.addChild(this.clip2);
         }
         else
         {
            §?V§.instance.addChild(this.clip = new (Class(param1.display))());
            §?V§.instance.addChild(this.clip2 = new (Class(param1.display))());
            this.clip.stop();
            this.clip2.stop();
         }
         if(param1.id == "BloonberryBush" || param1.id == "BloonberryBushPro")
         {
            _loc7_ = 10;
            _loc8_ = (param1.behavior.initialise as BloonberryInit).projectile.pierce;
            this.clip.gotoAndStop(int(this.clip.totalFrames - 1 - _loc7_ / _loc8_ * (this.clip.totalFrames - 1)) + 1);
            this.clip2.gotoAndStop(this.clip.currentFrame);
         }
         var _loc3_:GlowFilter = new GlowFilter(0,0.3);
         _loc3_.knockout = true;
         this.clip.filters = [_loc3_];
         this.clip.mouseEnabled = false;
         this.clip2.mouseEnabled = false;
         this.clip.mouseChildren = false;
         this.clip2.mouseChildren = false;
         if(param1.weapons)
         {
            _loc9_ = false;
            for each(_loc10_ in param1.weapons)
            {
               if(_loc10_.hasOwnProperty("rotate"))
               {
                  if(_loc10_.rotate)
                  {
                     _loc9_ = true;
                     break;
                  }
               }
            }
            if(_loc9_ || param1.id == "MonkeyApprentice" || param1.id == "BeekeeperPro" || param1.id == "Beekeeper" || param1.id == "DartMonkey" || param1.id == "SniperMonkey" || param1.id == "MonkeyBuccaneer" || param1.id == "DartlingGun" || param1.id == "TribalTurtle" || param1.id == "TribalTurtlePro")
            {
               rotation = -Math.PI / 2;
            }
         }
         if(param1.id == "RoadSpikes" || param1.id == "BloonberryBush")
         {
            rotation = Math.random() * Math.PI * 2;
         }
         z = 99999;
      }
      
      override public function destroy() : void
      {
         §?V§.instance.removeChild(this.clip);
         §?V§.instance.removeChild(this.clip2);
         rotation = 0;
         this.def = null;
         this.towerPickerDef = null;
         §?V§.instance.stage.removeEventListener(MouseEvent.MOUSE_UP,this.§[A§);
         this.range.visible = false;
         Pool.release(this);
         this.range.destroy();
         super.destroy();
      }
      
      private function §[A§(param1:MouseEvent) : void
      {
         if(§?V§.instance.§"0§.§ 2§.§"=§() == true)
         {
            this.§+R§();
         }
      }
      
      private function §+R§() : void
      {
         var _loc1_:String = null;
         var _loc2_:uint = 0;
         var _loc3_:Tower = null;
         var _loc4_:int = 0;
         x = §?V§.instance.mouseX;
         y = §?V§.instance.mouseY;
         this.occupiedSpace.x = x;
         this.occupiedSpace.y = y;
         if(§?V§.instance.§"0§.§-W§.§,D§(this.occupiedSpace,this.def.isBoat,this.def.canPlaceOnTrack,this.def.isBoat && this.def.isLand) && §?V§.instance.§"0§.§-W§.§7F§(this.towerPickerDef.cost))
         {
            _loc1_ = String(Tower.§20§++);
            _loc2_ = uint(Math.random() * uint.MAX_VALUE);
            _loc3_ = §?V§.instance.§"0§.§-W§.§`'§(_loc1_,this.def,x,y,rotation,_loc2_);
            _loc4_ = §?V§.instance.§"0§.§-W§.§ P§(this.towerPickerDef.cost,x,y,_loc3_);
            _loc3_.spentOn = _loc4_;
            §?V§.instance.§"0§.§-W§.§]3§(_loc4_);
            this.destroy();
            §?V§.instance.§"0§.§ 2§.§7&§(_loc3_);
         }
      }
      
      override public function process(param1:Number) : void
      {
         var _loc2_:Vector.<AreaEffectDef> = null;
         var _loc3_:Vector.<UpgradeDef> = null;
         var _loc4_:AreaEffectDef = null;
         x = §?V§.instance.mouseX;
         y = §?V§.instance.mouseY;
         this.occupiedSpace.x = x;
         this.occupiedSpace.y = y;
         this.range.x = x;
         this.range.y = y;
         if(this.def.areaEffects != null)
         {
            this.range.process(this.def);
         }
         else
         {
            _loc2_ = §?V§.instance.§"0§.§-W§.§,L§(x,y,null);
            if(_loc2_ != null)
            {
               _loc3_ = null;
               for each(_loc4_ in _loc2_)
               {
                  if(_loc4_.upgrade != null)
                  {
                     if(_loc3_ == null)
                     {
                        _loc3_ = new Vector.<UpgradeDef>();
                     }
                     if(_loc3_.indexOf(_loc4_.upgrade) == -1)
                     {
                        _loc3_.push(_loc4_.upgrade);
                     }
                  }
               }
               if(_loc3_ != null)
               {
                  this.range.process(Combinator.combine(this.def,_loc3_));
               }
               else
               {
                  this.range.process(this.def);
               }
            }
            else
            {
               this.range.process(this.def);
            }
         }
         if(§?V§.instance.§"0§.§-W§.§,D§(this.occupiedSpace,this.def.isBoat,this.def.canPlaceOnTrack,this.def.isBoat && this.def.isLand))
         {
            this.range.§&7§ = null;
         }
         else
         {
            this.range.§&7§ = this.§#Y§;
         }
      }
      
      override public function draw(param1:BitmapData) : void
      {
         if(this.def == null)
         {
            return;
         }
         this.occupiedSpace.x = x;
         this.occupiedSpace.y = y;
         var _loc2_:Boolean = §?V§.instance.§"0§.§-W§.§,D§(this.occupiedSpace,this.def.isBoat,this.def.canPlaceOnTrack,this.def.isBoat && this.def.isLand) && §?V§.instance.§"0§.§-W§.§7F§(this.towerPickerDef.cost);
         this.clip.rotation = rotation * 180 / Math.PI;
         this.clip2.rotation = rotation * 180 / Math.PI;
         this.clip.x = x;
         this.clip2.x = x;
         this.clip.y = y;
         this.clip2.y = y;
      }
   }
}

