package abilities
{
   import abilities.def.AbilityDef;
   import abilities.def.ProjectileHitAllDef;
   import bloons.Bloon;
   import entities.Effect;
   import projectiles.Projectile;
   import towers.Tower;
   import utils.Pool;
   import weapons.HasProjectile;
   
   public class ProjectileHitAll extends Ability
   {
      
      public function ProjectileHitAll()
      {
         super();
      }
      
      override public function execute(param1:Tower, param2:AbilityDef) : void
      {
         var _loc5_:Bloon = null;
         var _loc6_:ProjectileHitAllDef = null;
         var _loc7_:Effect = null;
         var _loc3_:Projectile = Pool.get(Projectile);
         _loc3_.owner = param1;
         _loc3_.initialise((param2 as ProjectileHitAllDef).projectile,param1.levelSlug);
         var _loc4_:Vector.<Bloon> = param1.levelSlug.allBloons.concat();
         if(_loc3_.def.glueEffect != null)
         {
            _loc3_.def.glueEffect = (param1.def.weapons[0] as HasProjectile).projectile.glueEffect;
         }
         for each(_loc5_ in _loc4_)
         {
            _loc5_.§99§(_loc3_);
         }
         _loc6_ = param2 as ProjectileHitAllDef;
         if(_loc6_.fullscreenEffect != null)
         {
            _loc7_ = new Effect();
            _loc7_.initialise(_loc6_.fullscreenEffect,3000);
            _loc7_.x = param1.levelSlug.§1§.x;
            param1.levelSlug.§?3§(_loc7_);
         }
         super.execute(param1,param2);
      }
   }
}

