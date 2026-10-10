package abilities
{
   import abilities.def.AbilityDef;
   import abilities.def.SpawnProjectileDef;
   import projectiles.Projectile;
   import towers.Tower;
   import utils.Pool;
   
   public class SpawnProjectile extends Ability
   {
      
      public function SpawnProjectile()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc3_:Projectile = null;
         _loc3_ = Pool.get(Projectile);
         _loc3_.initialise((param2 as SpawnProjectileDef).projectile,param1.levelSlug);
         _loc3_.owner = param1;
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         _loc3_.lifespan = 0.1;
         param1.levelSlug.addProjectile(_loc3_);
         super.execute(param1,param2);
      }
   }
}

