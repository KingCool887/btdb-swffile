package projectiles
{
   import §+C§.§0>§;
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.projectile.BurnyLargeExplosion;
   import assets.projectile.BurnyMediumExplosion;
   import assets.projectile.BurnyNuclearExplosion;
   import assets.projectile.BurnySlightlyLargerExplosion;
   import assets.projectile.CorrosiveSplat;
   import assets.projectile.GlueSplat;
   import assets.projectile.GodGlueSplat;
   import assets.projectile.IceBurst;
   import assets.projectile.IceBurstLarge;
   import assets.projectile.IceBurstMedium;
   import assets.projectile.IceExplosion;
   import assets.projectile.IceExplosionLarge;
   import assets.projectile.IceExplosionMedium;
   import assets.projectile.LargeExplosion;
   import assets.projectile.MediumExplosion;
   import assets.projectile.NuclearExplosion;
   import assets.projectile.RingOfFire;
   import assets.projectile.SlightlyLargerExplosion;
   import assets.projectile.SmallExplosion;
   import assets.projectile.Tempest;
   import assets.projectile.TinyTornado;
   import assets.projectile.Tornado;
   import assets.towers.BloonsBushCreeper;
   import bloons.Bloon;
   import display.Clip;
   import display.LabelOverCommand;
   import entities.§!U§;
   import entities.§8M§;
   import events.LevelEvent;
   import flash.display.BitmapData;
   import flash.events.Event;
   import projectiles.behavior.destroy.BehaviorDestroy;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.§-B§;
   
   public class Projectile extends §"L§
   {
      
      public static var §^B§:int = 0;
      
      public var id:int = 1;
      
      public var def:ProjectileDef;
      
      public var §#J§:§52§ = new §52§();
      
      public var §>X§:§52§ = new §52§(Number.MAX_VALUE,Number.MAX_VALUE);
      
      public var §3H§:Boolean = false;
      
      public var § S§:Vector.<Vector.<Bloon>>;
      
      public var pierce:int = 0;
      
      public var owner:Tower = null;
      
      public var target:Bloon = null;
      
      public var clip:Clip = new Clip();
      
      private var §-'§:§8M§ = null;
      
      private var §-F§:§!U§ = null;
      
      public var §75§:§-B§ = new §-B§(1);
      
      public var effectMask:int = 0;
      
      public var §8E§:Boolean = true;
      
      public var §9H§:Vector.<uint> = new Vector.<uint>();
      
      protected var levelSlugg:§0>§ = null;
      
      public function Projectile()
      {
         super();
      }
      
      public function get levelSlug() : §0>§
      {
         return this.levelSlugg;
      }
      
      public function initialise(param1:ProjectileDef, param2:§0>§) : void
      {
         this.levelSlugg = param2;
         this.§9H§.splice(0,this.§9H§.length);
         this.id = §^B§++;
         this.def = param1;
         this.owner = null;
         this.pierce = param1.pierce;
         if(param1.display != null)
         {
            this.clip.initialise(param1.display,64);
            if(this.clip.hasLabel("Loop"))
            {
               this.clip.labelOver["Loop"] = new LabelOverCommand();
               this.clip.labelOver["Loop"].command = LabelOverCommand.gotoAndPlay;
               this.clip.labelOver["Loop"].frameNoTo = 0;
               this.clip.gotoLabel("Loop");
               this.clip.play();
               this.clip.looping = true;
            }
         }
         z = 2 + param1.zOffset;
         if(param1.layeredDisplay != null)
         {
            this.§-'§ = new §8M§();
            this.§-'§.initialise(param1.layeredDisplay,z,z,this.levelSlugg);
            this.levelSlugg.§?3§(this.§-'§);
         }
         if(param1.additiveBlend)
         {
            this.§-F§ = new §!U§();
            this.§-F§.initialise(param1.display,2,this.levelSlugg);
            this.levelSlugg.§?3§(this.§-F§);
         }
         this.§6>§();
         if(Boolean(param1.behavior) && param1.behavior.roundOver != null)
         {
            §?V§.instance.§"0§.addEventListener(LevelEvent.ROUND_OVER,this.roundOver);
         }
      }
      
      public function §6>§() : *
      {
         var _loc1_:int = 0;
         this.effectMask = 0;
         if(this.def.effectMask != null)
         {
            for each(_loc1_ in this.def.effectMask)
            {
               this.effectMask |= _loc1_;
            }
         }
      }
      
      private function roundOver(param1:Event) : void
      {
         this.def.behavior.roundOver.execute(this);
      }
      
      override public function destroy() : void
      {
         var _loc1_:BehaviorDestroy = null;
         var _loc2_:§1H§ = null;
         if(this.def == null || this.levelSlugg == null)
         {
            return;
         }
         if(this.§-'§ != null)
         {
            this.§-'§.destroy();
            this.§-'§ = null;
         }
         if(this.§-F§ != null)
         {
            this.§-F§.destroy();
         }
         if(Boolean(this.def.behavior) && Boolean(this.def.behavior.destroy))
         {
            _loc1_ = this.def.behavior.destroy;
            while(_loc1_ != null)
            {
               _loc1_.execute(this);
               _loc1_ = _loc1_.next;
            }
         }
         if(this.def.display != null)
         {
            if(this.clip.frameIndex != this.clip.frameCount - 1)
            {
               if(this.def.display == IceBurst || this.def.display == IceBurstMedium || this.def.display == IceBurstLarge || this.def.display == IceExplosion || this.def.display == IceExplosionMedium || this.def.display == IceExplosionLarge || this.def.display == RingOfFire || this.def.display == NuclearExplosion || this.def.display == LargeExplosion || this.def.display == MediumExplosion || this.def.display == SmallExplosion || this.def.display == GlueSplat || this.def.display == CorrosiveSplat || this.def.display == GodGlueSplat || this.def.display == BurnyLargeExplosion || this.def.display == BurnyMediumExplosion || this.def.display == BurnyNuclearExplosion || this.def.display == SlightlyLargerExplosion || this.def.display == BurnySlightlyLargerExplosion || this.def.display == BloonsBushCreeper)
               {
                  _loc2_ = new §1H§();
                  _loc2_.Initialise(this.clip.sourceClass,this.clip.frameIndex);
                  _loc2_.x = x;
                  _loc2_.y = y;
                  _loc2_.rotation = rotation;
                  this.levelSlug.§?3§(_loc2_);
               }
            }
         }
         if(Boolean(this.def.behavior) && this.def.behavior.roundOver != null)
         {
            §?V§.instance.§"0§.removeEventListener(LevelEvent.ROUND_OVER,this.roundOver);
         }
         if(Boolean(this.def.behavior) && this.def.behavior.lifespanOver != null)
         {
            this.def.behavior.lifespanOver.cleanup(this);
         }
         this.def = null;
         this.§#J§.x = 0;
         this.§#J§.y = 0;
         this.pierce = 0;
         this.owner = null;
         this.target = null;
         this.§-'§ = null;
         this.§-F§ = null;
         this.§75§.removeEventListener(§-B§.COMPLETE,this.lifespanOver);
         this.effectMask = 0;
         this.§9H§.splice(0,this.§9H§.length);
         this.levelSlugg.§7T§(this);
         this.levelSlugg = null;
         super.destroy();
      }
      
      public function set lifespan(param1:Number) : void
      {
         this.§75§.reset(param1);
         this.§75§.removeEventListener(§-B§.COMPLETE,this.lifespanOver);
         this.§75§.addEventListener(§-B§.COMPLETE,this.lifespanOver);
      }
      
      private function lifespanOver(param1:Event) : *
      {
         this.§75§.removeEventListener(§-B§.COMPLETE,this.lifespanOver);
         if(Boolean(this.def.behavior) && Boolean(this.def.behavior.lifespanOver))
         {
            this.def.behavior.lifespanOver.execute(this);
         }
         else
         {
            this.destroy();
         }
      }
      
      override public function process(param1:Number) : void
      {
         if(this.def == null || this.levelSlugg == null)
         {
            return;
         }
         if(Boolean(this.def.behavior) && Boolean(this.def.behavior.process))
         {
            this.def.behavior.process.execute(this,param1);
         }
         else
         {
            x += this.§#J§.x * param1;
            y += this.§#J§.y * param1;
         }
         if(this.def == null)
         {
            return;
         }
         if(this.def.display != null)
         {
            this.clip.process();
         }
         if(x < this.levelSlugg.§1§.left - 50 || x > this.levelSlugg.§1§.right + 50 || y < this.levelSlugg.§1§.top - 50 || y > this.levelSlugg.§1§.bottom + 50)
         {
            this.destroy();
         }
         if(this.§-'§)
         {
            this.§-'§.x = x;
            this.§-'§.y = y;
            this.§-'§.rotation = rotation;
         }
         if(this.§-F§)
         {
            this.§-F§.x = x;
            this.§-F§.y = y;
            this.§-F§.rotation = rotation;
         }
      }
      
      override public function draw(param1:BitmapData) : void
      {
         if(this.def == null || this.def.display == null)
         {
            return;
         }
         if(rotation == 0)
         {
            rotation = this.§#J§.rotation;
         }
         if(this.§-'§)
         {
            return;
         }
         if(this.§-F§)
         {
            return;
         }
         if(this.def.display == Tornado || this.def.display == Tempest || this.def.display == TinyTornado)
         {
            this.clip.quickDraw(param1,x,y);
            return;
         }
         this.clip.drawRotated(param1,x,y,rotation);
      }
      
      public function §99§() : void
      {
         if(this.def == null)
         {
            return;
         }
         if(!(this.def.iceEffect && this.def.iceEffect.arcticWind))
         {
            --this.pierce;
         }
         if(Boolean(this.def.behavior) && Boolean(this.def.behavior.collision))
         {
            this.def.behavior.collision.execute(this);
            if(this.def.behavior.collision.next)
            {
               this.def.behavior.collision.next.execute(this);
            }
         }
         if(this.pierce <= 0 && this.§8E§)
         {
            this.destroy();
         }
      }
   }
}

