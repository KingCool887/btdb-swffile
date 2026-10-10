package entities
{
   import §+C§.§0>§;
   import §8U§.§52§;
   import §;M§.§"L§;
   import assests.effects.BuccaneerHarpoonInitialBlast;
   import assests.effects.BuccaneerHarpoonSkullBlast;
   import assets.projectile.Harpoon;
   import assets.sound.GrapplingHookRetract;
   import assets.sounds.ExplosionHuge;
   import bloons.Bloon;
   import display.BloonClip;
   import display.Clip;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import sound.§^5§;
   import towers.Tower;
   import utils.§-B§;
   
   public class Harpoon extends §"L§
   {
      
      private var tower:Tower = null;
      
      private var §[#§:Clip = new Clip();
      
      private var §`3§:Number = 0;
      
      private var §2L§:Number = 0;
      
      private var §=N§:BloonClip = null;
      
      private var §@N§:Number = 0;
      
      private var §[3§:Number = 0;
      
      private var §'=§:int = 0;
      
      private var bloonOriginX:Number = 0;
      
      private var bloonOriginY:Number = 0;
      
      private var animationTimer:§-B§ = new §-B§(3);
      
      private var § I§:Number = 0.1;
      
      private var angle:Number = 0;
      
      private var §8@§:MovieClip = new MovieClip();
      
      private var §7M§:Number = 0;
      
      private var from:§52§ = new §52§();
      
      private var §[N§:int = 0;
      
      protected var levelSlug:§0>§;
      
      public function Harpoon()
      {
         super();
      }
      
      public function initialise(param1:Tower, param2:Bloon) : void
      {
         var to:§52§;
         var rot:§52§;
         var mc:Effect = null;
         var retractTimer:§-B§ = null;
         var tower:Tower = param1;
         var bloon:Bloon = param2;
         this.tower = tower;
         this.levelSlug = tower.levelSlug;
         this.§[#§.initialise(assets.projectile.Harpoon,64);
         this.§=N§ = new BloonClip();
         this.§=N§.setFrame(bloon.type,bloon.§#+§,bloon.levelSlug.§#1§);
         this.§@N§ = bloon.x;
         this.§[3§ = bloon.y;
         this.bloonOriginX = bloon.x;
         this.bloonOriginY = bloon.y;
         this.§'=§ = bloon.type;
         this.§7M§ = bloon.rotation;
         this.§[N§ = bloon.type;
         bloon.destroy();
         to = new §52§(bloon.x - tower.x,bloon.y - tower.y);
         this.angle = to.rotation;
         tower.rotation = this.angle + Math.PI / 2;
         tower.pause = true;
         tower.§^R§ = true;
         rot = new §52§(-6,-44);
         rot.§ =§(tower.rotation);
         mc = new Effect();
         mc.initialise(BuccaneerHarpoonInitialBlast,3);
         mc.x = tower.x + rot.x;
         mc.y = tower.y + rot.y;
         tower.levelSlug.§?3§(mc);
         rot = new §52§(-6,-72);
         rot.§ =§(tower.rotation);
         this.from.x = tower.x + rot.x;
         this.from.y = tower.y + rot.y;
         this.animationTimer.start();
         this.animationTimer.addEventListener(§-B§.COMPLETE,this.§,M§);
         retractTimer = new §-B§(this.§ I§);
         retractTimer.addEventListener(§-B§.COMPLETE,function(param1:Event):void
         {
            new §^5§(GrapplingHookRetract).play();
            retractTimer.removeEventListener(§-B§.COMPLETE,arguments.callee);
         });
         z = 1;
      }
      
      private function §,M§(param1:Event) : void
      {
         var _loc2_:Effect = null;
         this.tower.pause = false;
         this.tower.§^R§ = false;
         new §^5§(ExplosionHuge).play();
         _loc2_ = new Effect();
         _loc2_.initialise(BuccaneerHarpoonSkullBlast,3);
         _loc2_.x = this.from.x;
         _loc2_.y = this.from.y;
         this.levelSlug.§?3§(_loc2_);
         destroy();
         this.animationTimer.removeEventListener(§-B§.COMPLETE,this.§,M§);
      }
      
      override public function process(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(this.animationTimer.current < this.§ I§)
         {
            _loc2_ = this.animationTimer.current / this.§ I§;
            this.§`3§ = this.from.x + (this.§@N§ - this.from.x) * _loc2_;
            this.§2L§ = this.from.y + (this.§[3§ - this.from.y) * _loc2_;
         }
         if(this.animationTimer.current > this.§ I§)
         {
            _loc2_ = (this.animationTimer.current - this.§ I§) / (this.animationTimer.delay - this.§ I§);
            this.§@N§ = this.bloonOriginX + (this.from.x - this.bloonOriginX) * _loc2_;
            this.§[3§ = this.bloonOriginY + (this.from.y - this.bloonOriginY) * _loc2_;
            this.§`3§ = this.§@N§;
            this.§2L§ = this.§[3§;
         }
         this.§8@§.graphics.clear();
         this.§8@§.graphics.lineStyle(2,0);
         this.§8@§.graphics.moveTo(this.tower.x,this.tower.y);
         this.§8@§.graphics.lineTo(this.§`3§,this.§2L§);
      }
      
      override public function draw(param1:BitmapData) : void
      {
         param1.draw(this.§8@§);
         if(this.§'=§ < Bloon.MOAB)
         {
            this.§=N§.quickDraw(param1,this.§@N§,this.§[3§);
         }
         else
         {
            this.§=N§.drawRotated(param1,this.§@N§,this.§[3§,this.§7M§);
         }
         this.§[#§.drawRotated(param1,this.§`3§,this.§2L§,this.angle);
      }
   }
}

