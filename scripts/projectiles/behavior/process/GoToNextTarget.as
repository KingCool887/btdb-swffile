package projectiles.behavior.process
{
   import bloons.Bloon;
   import projectiles.Projectile;
   import towers.Tower;
   
   public class GoToNextTarget extends BehaviorProcess
   {
      
      public function GoToNextTarget()
      {
         super();
      }
      
      override public function execute(param1:Projectile, param2:Number) : void
      {
         param1.lifespan = 99999;
         var _loc3_:Bloon = param1.levelSlug.§%Y§.§^§(param1,150,Tower.§%$§);
         if(_loc3_ == null)
         {
            param1.destroy();
            return;
         }
         var _loc4_:Number = param1.§#J§.§!X§;
         param1.§#J§.x = _loc3_.x - param1.x;
         param1.§#J§.y = _loc3_.y - param1.y;
         param1.§#J§.§!X§ = 500;
         param1.x += param1.§#J§.x * param2;
         param1.y += param1.§#J§.y * param2;
      }
   }
}

