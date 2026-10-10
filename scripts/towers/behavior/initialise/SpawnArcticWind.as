package towers.behavior.initialise
{
   import assets.projectile.IceBurst;
   import flash.utils.Dictionary;
   import projectiles.Projectile;
   import projectiles.def.IceEffectDef;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   
   public class SpawnArcticWind extends BehaviorInitialise
   {
      
      public static var arcticWinds:Dictionary = new Dictionary();
      
      public function SpawnArcticWind()
      {
         super();
      }
      
      override public function execute(param1:Tower) : void
      {
         var _loc3_:Projectile = null;
         var _loc2_:ProjectileDef = new ProjectileDef().Display(IceBurst).Pierce(9999999).Radius(126).CanMultiEffect(true).IceEffect(new IceEffectDef().Lifespan(0).ArcticWind(0.33));
         if(arcticWinds[param1] == null)
         {
            _loc3_ = Pool.get(Projectile);
            _loc3_.initialise(_loc2_,param1.levelSlug);
            _loc3_.owner = param1;
            _loc3_.x = param1.x;
            _loc3_.y = param1.y;
            _loc3_.lifespan = 9999999;
            _loc3_.effectMask = param1.targetMask;
            param1.levelSlug.addProjectile(_loc3_);
            arcticWinds[param1] = _loc3_;
         }
      }
   }
}

