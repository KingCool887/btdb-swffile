package projectiles.behavior.process
{
   import §8U§.§52§;
   import bloons.Bloon;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import projectiles.Projectile;
   import utils.§-B§;
   import weapons.SpikeSpread;
   
   public class CleansingFoamProcess extends BehaviorProcess
   {
      
      internal static var effect:Dictionary = new Dictionary();
      
      internal static var tVec:§52§ = new §52§();
      
      public function CleansingFoamProcess()
      {
         super();
      }
      
      override public function execute(param1:Projectile, param2:Number) : void
      {
         var destroyTimer:§-B§ = null;
         param1.clip.play();
         if(SpikeSpread.spikeTo[param1] == null)
         {
            return;
         }
         if(SpikeSpread.spikeTo[param1].delay > 0)
         {
            SpikeSpread.spikeTo[param1].delay -= param2;
            return;
         }
         param1.x += (SpikeSpread.spikeTo[param1].to.x - param1.x) / 5;
         param1.y += (SpikeSpread.spikeTo[param1].to.y - param1.y) / 5;
         if(param1.effectMask == Bloon.§6%§)
         {
            if(param1.clip.currentLabel != "Loop")
            {
               param1.clip.gotoLabel("Loop");
               param1.clip.play();
            }
            tVec.x = SpikeSpread.spikeTo[param1].to.x - param1.x;
            tVec.y = SpikeSpread.spikeTo[param1].to.y - param1.y;
            param1.rotation = tVec.rotation;
            if(Math.pow(SpikeSpread.spikeTo[param1].to.x - param1.x,2) + Math.pow(SpikeSpread.spikeTo[param1].to.y - param1.y,2) < 9)
            {
               param1.clip.gotoLabel("Bubble");
               param1.§6>§();
               destroyTimer = new §-B§(8.5);
               destroyTimer.extra = Vector.<Projectile>([param1]);
               destroyTimer.addEventListener(§-B§.COMPLETE,function(evt:Event):void
               {
                  var _loc2_:Projectile = (evt.target as §-B§).extra[0];
                  if(_loc2_.levelSlug != null)
                  {
                     _loc2_.levelSlug.§7T§(_loc2_);
                     _loc2_.destroy();
                  }
               });
            }
         }
         param1.clip.looping = true;
      }
   }
}

