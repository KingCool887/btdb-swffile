package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import assets.projectile.PineappleBomb;
   import events.PropertyModEvent;
   import flash.events.Event;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.§-B§;
   import utils.Pool;
   
   public class Surround extends Standard
   {
      
      private var lifespan_:§<<§ = §-A§.§]H§();
      
      public function Surround(param1:String = null)
      {
         this.lifespan_.value = 1;
         super(param1);
      }
      
      override public function destroy() : void
      {
         §-A§.§&!§(this.lifespan_);
         super.destroy();
      }
      
      public function set lifespan(param1:Number) : void
      {
         if(this.lifespan_.value != param1)
         {
            this.lifespan_.value = param1;
            dispatchEvent(new PropertyModEvent("lifespan"));
         }
      }
      
      public function get lifespan() : Number
      {
         return this.lifespan_.value;
      }
      
      public function Lifespan(param1:Number) : Surround
      {
         this.lifespan = param1;
         return this;
      }
      
      public function Range(param1:Number) : Surround
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : Surround
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : Surround
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : Surround
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : Surround
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var newProjectile:projectiles.Projectile = null;
         var timerFrame:§-B§ = null;
         var tower:Tower = param1;
         var spawnFrom:§"L§ = param2;
         var target:§"L§ = param3;
         var offset:§52§ = param4;
         newProjectile = Pool.get(projectiles.Projectile);
         newProjectile.initialise(projectile,tower.levelSlug);
         newProjectile.owner = tower;
         newProjectile.x = spawnFrom.x;
         newProjectile.y = spawnFrom.y;
         newProjectile.lifespan = this.lifespan;
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
      }
   }
}

