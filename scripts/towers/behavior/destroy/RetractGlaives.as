package towers.behavior.destroy
{
   import projectiles.Projectile;
   import towers.Tower;
   import towers.behavior.initialise.SpawnGlaives;
   
   public class RetractGlaives extends BehaviorDestroy
   {
      
      public function RetractGlaives()
      {
         super();
      }
      
      override public function execute(param1:Tower) : void
      {
         var _loc3_:Projectile = null;
         var _loc2_:Vector.<Projectile> = SpawnGlaives.glaives[param1];
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc3_.destroy();
            }
            SpawnGlaives.glaives[param1] = null;
         }
      }
   }
}

