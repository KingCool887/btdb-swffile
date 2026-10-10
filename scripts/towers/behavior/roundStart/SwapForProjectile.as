package towers.behavior.roundStart
{
   import assets.projectile.PineappleBomb;
   import events.PropertyModEvent;
   import flash.events.Event;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.§-B§;
   import utils.Pool;
   
   public class SwapForProjectile extends BehaviorRoundStart
   {
      
      private var projectile_:ProjectileDef;
      
      private var lifespan_:Number = 0;
      
      public function SwapForProjectile()
      {
         super();
      }
      
      public function set projectile(param1:ProjectileDef) : void
      {
         if(this.projectile_ != param1)
         {
            this.projectile_ = param1;
            dispatchEvent(new PropertyModEvent("projectile"));
         }
      }
      
      public function get projectile() : ProjectileDef
      {
         return this.projectile_;
      }
      
      public function Projectile(param1:ProjectileDef) : SwapForProjectile
      {
         this.projectile = param1;
         return this;
      }
      
      public function set lifespan(param1:Number) : void
      {
         if(this.lifespan_ != param1)
         {
            this.lifespan_ = param1;
            dispatchEvent(new PropertyModEvent("lifespan"));
         }
      }
      
      public function get lifespan() : Number
      {
         return this.lifespan_;
      }
      
      public function Lifespan(param1:Number) : SwapForProjectile
      {
         this.lifespan = param1;
         return this;
      }
      
      override public function execute(param1:Tower) : void
      {
         var ts:*;
         var newProjectile:projectiles.Projectile = null;
         var timerFrame:§-B§ = null;
         var tower:Tower = param1;
         newProjectile = Pool.get(projectiles.Projectile);
         newProjectile.initialise(this.projectile,tower.levelSlug);
         newProjectile.owner = tower;
         newProjectile.x = tower.x;
         newProjectile.y = tower.y;
         newProjectile.lifespan = this.lifespan;
         newProjectile.rotation = tower.rotation;
         tower.levelSlug.addProjectile(newProjectile);
         if(newProjectile.def.display == PineappleBomb)
         {
            timerFrame = null;
            newProjectile.lifespan = 0.6 * 3;
            newProjectile.clip.gotoAndStop(3);
            timerFrame = new §-B§(0.6,2);
            timerFrame.addEventListener(§-B§.TIMER,function(param1:Event):void
            {
               newProjectile.clip.gotoAndStop(newProjectile.clip.frameIndex - 1);
            });
            timerFrame.start();
         }
         else
         {
            newProjectile.clip.stop();
         }
         ts = tower.§`!§;
         tower.levelSlug.removeTower(tower);
         tower.destroy();
      }
   }
}

