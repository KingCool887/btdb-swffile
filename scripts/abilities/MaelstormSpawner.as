package abilities
{
   import assets.projectile.BladeMaelstrom;
   import bloons.Bloon;
   import flash.events.Event;
   import projectiles.Projectile;
   import projectiles.def.DamageEffectDef;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.§-B§;
   import utils.Pool;
   
   public class MaelstormSpawner
   {
      
      public var tower:Tower = null;
      
      private var timer:§-B§ = new §-B§(1 / 30,60);
      
      public function MaelstormSpawner()
      {
         super();
         this.timer.addEventListener(§-B§.TIMER,this.process);
      }
      
      public function process(param1:Event) : void
      {
         var _loc5_:Projectile = null;
         if(this.tower.§?"§ == null)
         {
            this.timer.removeEventListener(§-B§.TIMER,this.process);
            return;
         }
         var _loc2_:ProjectileDef = new ProjectileDef().Display(BladeMaelstrom).Pierce(99999).Radius(5).DamageEffect(new DamageEffectDef().Damage(1).CantBreak(Vector.<int>([Bloon.§?<§])).CanBreakIce(false));
         _loc5_ = Pool.get(Projectile);
         _loc5_.initialise(_loc2_,this.tower.levelSlug);
         _loc5_.owner = this.tower;
         _loc5_.x = this.tower.x;
         _loc5_.y = this.tower.y;
         _loc5_.lifespan = 1000 / 400;
         _loc5_.§#J§.x = 400;
         _loc5_.§#J§.y = 0;
         _loc5_.§#J§.rotation = this.timer.§+U§ / this.timer.§41§ * Math.PI * 2 * 2;
         this.tower.levelSlug.addProjectile(_loc5_);
         _loc5_ = Pool.get(Projectile);
         _loc5_.initialise(_loc2_,this.tower.levelSlug);
         _loc5_.owner = this.tower;
         _loc5_.x = this.tower.x;
         _loc5_.y = this.tower.y;
         _loc5_.lifespan = 1000 / 400;
         _loc5_.§#J§.x = 400;
         _loc5_.§#J§.y = 0;
         _loc5_.§#J§.rotation = this.timer.§+U§ / this.timer.§41§ * Math.PI * 2 * 2 + Math.PI;
         this.tower.levelSlug.addProjectile(_loc5_);
      }
   }
}

