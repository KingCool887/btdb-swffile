package towers.behavior.process
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import bloons.Bloon;
   import flash.utils.Dictionary;
   import projectiles.Projectile;
   import towers.Tower;
   import towers.behavior.initialise.SpawnGlaives;
   
   public class GlaiveLordProcess extends BehaviorProcess
   {
      
      private static var count:Dictionary = new Dictionary();
      
      private var vec:§52§ = new §52§();
      
      public function GlaiveLordProcess()
      {
         super();
      }
      
      public function updateGlaives(param1:Tower) : *
      {
         var _loc3_:Projectile = null;
         var _loc2_:Vector.<Projectile> = SpawnGlaives.glaives[param1];
         if(_loc2_ == null)
         {
            return;
         }
         if(count[param1] == null)
         {
            count[param1] = 0;
         }
         if(count[param1] == 0)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc3_.effectMask = Bloon.§>K§;
            }
         }
         else
         {
            for each(_loc3_ in _loc2_)
            {
               _loc3_.effectMask = Bloon.§6%§;
            }
         }
         ++count[param1];
         if(count[param1] == 5)
         {
            count[param1] = 0;
         }
      }
      
      override public function process(param1:Tower, param2:Number) : void
      {
         this.updateGlaives(param1);
         if(!param1.§>§ || param1.§+A§.length <= 0)
         {
            return;
         }
         var _loc3_:§"L§ = param1.§+A§[param1.§+A§.length - 1];
         this.vec.x = _loc3_.x - param1.x;
         this.vec.y = _loc3_.y - param1.y;
         param1.rotation = this.vec.rotation;
      }
   }
}

