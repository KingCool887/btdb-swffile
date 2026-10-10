package abilities
{
   import §+C§.§0>§;
   import §8U§.§52§;
   import §;M§.§"L§;
   import assets.projectile.ApprenticeBreath;
   import assets.projectile.ApprenticeDisspate;
   import assets.towers.Phoenix;
   import bloons.Bloon;
   import display.Clip;
   import flash.display.BitmapData;
   import flash.events.Event;
   import projectiles.Projectile;
   import projectiles.behavior.BehaviorDef;
   import projectiles.behavior.destroy.SpawnProjectile;
   import projectiles.def.DamageEffectDef;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.§-B§;
   import utils.Pool;
   import weapons.Single;
   
   public class Pheonix extends §"L§
   {
      
      protected var clip:Clip = null;
      
      protected var owner:Tower = null;
      
      protected var location:§52§ = new §52§(150,0);
      
      protected var destroyTimer:§-B§ = new §-B§(25);
      
      protected var offsetVector:§52§ = new §52§(30,0);
      
      protected var dragonsBreathDissipate:ProjectileDef;
      
      protected var dragonsBreathProjectile:ProjectileDef;
      
      protected var dragonsBreathWeapon:Single;
      
      private var levelSlug:§0>§;
      
      public function Pheonix()
      {
         super();
         this.dragonsBreathDissipate = new ProjectileDef().Display(ApprenticeDisspate).Pierce(1).Radius(5).EffectMask(Vector.<int>([Bloon.§6%§])).AdditiveBlend(true);
         this.dragonsBreathProjectile = new ProjectileDef().Display(ApprenticeBreath).Pierce(5).Radius(10).EffectMask(Vector.<int>([Bloon.§>K§])).AdditiveBlend(true).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true).BlimpScale(2)).Behavior(new BehaviorDef().Destroy(new projectiles.behavior.destroy.SpawnProjectile().Projectile(this.dragonsBreathDissipate).Lifespan(10 / 30)));
         this.dragonsBreathWeapon = new Single().Range(200).Power(560).ReloadTime(0.08).Projectile(this.dragonsBreathProjectile);
      }
      
      public function initialise(param1:Tower) : void
      {
         this.owner = param1;
         this.levelSlug = param1.levelSlug;
         this.clip = new Clip();
         this.clip.initialise(Phoenix,0);
         this.clip.looping = true;
         this.destroyTimer.addEventListener(§-B§.COMPLETE,this.§-@§);
         z = 10;
      }
      
      private function §-@§(param1:Event) : void
      {
         destroy();
      }
      
      override public function process(param1:Number) : void
      {
         var _loc7_:Vector.<Bloon> = null;
         var _loc8_:Bloon = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Projectile = null;
         if(this.owner.levelSlug == null)
         {
            this.destroyTimer.removeEventListener(§-B§.COMPLETE,this.§-@§);
            destroy();
            return;
         }
         var _loc2_:Number = this.levelSlug.§#1§ == 0 ? -160 : 255;
         this.location.§ =§(Math.PI * 2 * 0.15 * param1);
         x = 350 + this.location.x + _loc2_;
         y = 260 + this.location.y;
         rotation = this.location.rotation + Math.PI / 2;
         var _loc3_:Vector.<Vector.<Bloon>> = this.levelSlug.§%Y§.§`5§(x,y,200);
         var _loc4_:Number = Math.pow(200,2);
         var _loc5_:Number = 999999999;
         var _loc6_:Bloon = null;
         for each(_loc7_ in _loc3_)
         {
            for each(_loc8_ in _loc7_)
            {
               if(!_loc8_.§ !§)
               {
                  _loc9_ = _loc8_.x - x;
                  _loc10_ = _loc8_.y - y;
                  _loc11_ = _loc9_ * _loc9_ + _loc10_ * _loc10_;
                  if(_loc11_ <= _loc4_ && _loc11_ < _loc5_)
                  {
                     _loc6_ = _loc8_;
                     _loc5_ = _loc11_;
                  }
               }
            }
         }
         if(_loc6_)
         {
            _loc12_ = Pool.get(Projectile);
            _loc12_.initialise(this.dragonsBreathWeapon.projectile,this.owner.levelSlug);
            _loc12_.owner = this.owner;
            this.offsetVector.x = 30;
            this.offsetVector.y = 0;
            this.offsetVector.§ =§(rotation);
            _loc12_.x = x + this.offsetVector.x;
            _loc12_.y = y + this.offsetVector.y;
            _loc12_.lifespan = this.dragonsBreathWeapon.range / this.dragonsBreathWeapon.power;
            _loc12_.§#J§.x = _loc6_.x - _loc12_.x;
            _loc12_.§#J§.y = _loc6_.y - _loc12_.y;
            _loc12_.§#J§.§!X§ = this.dragonsBreathWeapon.power;
            _loc12_.rotation = _loc12_.§#J§.rotation;
            this.owner.levelSlug.addProjectile(_loc12_);
         }
         this.clip.process();
      }
      
      override public function draw(param1:BitmapData) : void
      {
         this.clip.drawRotated(param1,x,y,rotation);
      }
   }
}

