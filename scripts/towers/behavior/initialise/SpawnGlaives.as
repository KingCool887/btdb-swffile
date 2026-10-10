package towers.behavior.initialise
{
   import assets.projectile.Glaive;
   import bloons.Bloon;
   import flash.utils.Dictionary;
   import projectiles.Projectile;
   import projectiles.behavior.BehaviorDef;
   import projectiles.behavior.process.Orbit;
   import projectiles.def.DamageEffectDef;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   
   public class SpawnGlaives extends BehaviorInitialise
   {
      
      public static var glaives:Dictionary = new Dictionary();
      
      public function SpawnGlaives()
      {
         super();
      }
      
      override public function execute(param1:Tower) : void
      {
         var _loc2_:ProjectileDef = null;
         var _loc3_:Projectile = null;
         _loc2_ = new ProjectileDef().Display(Glaive).Pierce(int.MAX_VALUE).Radius(15).EffectMask(Vector.<int>([Bloon.§>K§])).DamageEffect(new DamageEffectDef().Damage(1).CanBreakIce(true)).CanMultiEffect(true).Behavior(new BehaviorDef().Process(new Orbit()));
         if(glaives[param1] == null)
         {
            glaives[param1] = new Vector.<Projectile>();
            _loc3_ = Pool.get(Projectile);
            _loc3_.initialise(_loc2_,param1.levelSlug);
            _loc3_.owner = param1;
            _loc3_.x = param1.x + 55;
            _loc3_.y = param1.y;
            _loc3_.lifespan = 99999;
            param1.levelSlug.addProjectile(_loc3_);
            glaives[param1].push(_loc3_);
            _loc3_ = Pool.get(Projectile);
            _loc3_.initialise(_loc2_,param1.levelSlug);
            _loc3_.owner = param1;
            _loc3_.x = param1.x - 50;
            _loc3_.y = param1.y;
            _loc3_.lifespan = 99999;
            param1.levelSlug.addProjectile(_loc3_);
            glaives[param1].push(_loc3_);
         }
      }
   }
}

