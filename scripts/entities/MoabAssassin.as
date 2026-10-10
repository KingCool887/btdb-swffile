package entities
{
   import §+C§.§0>§;
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.projectile.MOABAssassinPower;
   import assets.projectile.NuclearExplosion;
   import bloons.Bloon;
   import display.BloonClip;
   import display.Clip;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import projectiles.Projectile;
   import projectiles.def.DamageEffectDef;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.§-B§;
   import utils.Pool;
   
   public class MoabAssassin extends §"L§
   {
      
      private var tower:Tower = null;
      
      private var §[#§:Clip = new Clip();
      
      private var §`3§:Number = 0;
      
      private var §2L§:Number = 0;
      
      private var §=N§:BloonClip = null;
      
      private var §@N§:Number = 0;
      
      private var §[3§:Number = 0;
      
      private var bloonOriginX:Number = 0;
      
      private var bloonOriginY:Number = 0;
      
      private var animationTimer:§-B§ = new §-B§(0.4);
      
      private var § I§:Number = 0.1;
      
      private var angle:Number = 0;
      
      private var §8@§:MovieClip = new MovieClip();
      
      private var §7M§:Number = 0;
      
      private var §'=§:int = 0;
      
      private var levelSlug:§0>§;
      
      public function MoabAssassin()
      {
         super();
      }
      
      public function initialise(param1:Tower, param2:Bloon) : *
      {
         var to:§52§;
         var tower:Tower = param1;
         var bloon:Bloon = param2;
         this.tower = tower;
         this.levelSlug = tower.levelSlug;
         this.§[#§.initialise(MOABAssassinPower,64);
         this.§@N§ = bloon.x;
         this.§[3§ = bloon.y;
         this.bloonOriginX = bloon.x;
         this.bloonOriginY = bloon.y;
         this.§7M§ = bloon.rotation;
         this.§'=§ = bloon.type;
         if(bloon.type == Bloon.§9?§)
         {
            bloon.damage(750,1,null,true);
         }
         else
         {
            this.§=N§ = new BloonClip();
            this.§=N§.setFrame(bloon.type,bloon.§#+§,bloon.levelSlug.§#1§);
            bloon.§1G§(1,1,tower,false);
         }
         to = new §52§(bloon.x - tower.x,bloon.y - tower.y);
         this.angle = to.rotation;
         this.animationTimer.start();
         this.animationTimer.addEventListener(§-B§.COMPLETE,function(param1:Event):void
         {
            var _loc4_:Projectile = null;
            var _loc3_:ProjectileDef = new ProjectileDef().Display(NuclearExplosion).Pierce(40).Radius(60).DamageEffect(new DamageEffectDef().Damage(3).CanBreakIce(true).CantBreak(Vector.<int>([Bloon.§''§,Bloon.§07§])));
            _loc4_ = Pool.get(Projectile);
            _loc4_.initialise(_loc3_,levelSlug);
            _loc4_.owner = tower;
            _loc4_.x = bloonOriginX;
            _loc4_.y = bloonOriginY;
            levelSlug.addProjectile(_loc4_);
            _loc4_.lifespan = 0.1;
            destroy();
            animationTimer.removeEventListener(§-B§.COMPLETE,arguments.callee);
         });
         z = 1;
      }
      
      override public function process(param1:Number) : void
      {
         var _loc2_:Number = this.animationTimer.current / this.animationTimer.delay;
         this.§`3§ = this.tower.x + (this.§@N§ - this.tower.x) * _loc2_;
         this.§2L§ = this.tower.y + (this.§[3§ - this.tower.y) * _loc2_;
      }
      
      override public function draw(param1:BitmapData) : void
      {
         if(this.§=N§ == null)
         {
            return;
         }
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

