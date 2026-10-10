package projectiles.behavior.collision
{
   import projectiles.Projectile;
   
   public class RoadSpikeCollision extends BehaviorCollision
   {
      
      public function RoadSpikeCollision()
      {
         super();
      }
      
      override public function execute(param1:Projectile) : void
      {
         var _loc2_:int = int(param1.clip.frameCount - 1 - param1.pierce / param1.def.pierce * (param1.clip.frameCount - 1));
         if(param1.def.pierce < param1.clip.frameCount - 1)
         {
            _loc2_ = param1.clip.frameCount - 1 - param1.def.pierce + (param1.def.pierce - param1.pierce);
         }
         param1.clip.gotoAndStop(_loc2_);
      }
   }
}

