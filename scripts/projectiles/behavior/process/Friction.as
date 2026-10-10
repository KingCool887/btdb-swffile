package projectiles.behavior.process
{
   import bloons.Bloon;
   import projectiles.Projectile;
   import weapons.SpikeSpread;
   import weapons.SpikeTo;
   
   public class Friction extends BehaviorProcess
   {
      
      public function Friction()
      {
         super();
      }
      
      override public function execute(param1:Projectile, param2:Number) : void
      {
         var _loc5_:SpikeTo = SpikeSpread.spikeTo[param1];
         if(_loc5_ == null)
         {
            return;
         }
         if(_loc5_.delay > 0)
         {
            _loc5_.delay -= param2;
            return;
         }
         if(param1.effectMask == Bloon.§6%§)
         {
            param1.x += (_loc5_.to.x - param1.x) / 10;
            param1.y += (_loc5_.to.y - param1.y) / 10;
            if(Math.pow(_loc5_.to.x - param1.x,2) + Math.pow(_loc5_.to.y - param1.y,2) < 9)
            {
               param1.§6>§();
            }
         }
         param1.clip.looping = true;
      }
   }
}

