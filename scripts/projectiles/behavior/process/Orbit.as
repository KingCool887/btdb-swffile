package projectiles.behavior.process
{
   import §8U§.§52§;
   import projectiles.Projectile;
   import towers.Tower;
   
   public class Orbit extends BehaviorProcess
   {
      
      public function Orbit()
      {
         super();
      }
      
      override public function execute(param1:Projectile, param2:Number) : void
      {
         var _loc3_:Tower = null;
         _loc3_ = param1.owner;
         var _loc4_:§52§ = new §52§(_loc3_.x - param1.x,_loc3_.y - param1.y);
         _loc4_.§ =§(Math.PI * 2 * param2);
         param1.x = _loc3_.x - _loc4_.x;
         param1.y = _loc3_.y - _loc4_.y;
      }
   }
}

