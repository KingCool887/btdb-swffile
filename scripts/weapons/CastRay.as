package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import bloons.Bloon;
   import entities.§@W§;
   import events.PropertyModEvent;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   
   public class CastRay extends Standard
   {
      
      private var rotate_:Boolean = true;
      
      private var tempRotation:§52§ = new §52§();
      
      public function CastRay()
      {
         super();
      }
      
      public function Range(param1:Number) : CastRay
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : CastRay
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : CastRay
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : CastRay
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : CastRay
      {
         proxied = param1;
         return this;
      }
      
      public function set rotate(param1:Boolean) : void
      {
         if(this.rotate_ != param1)
         {
            this.rotate_ = param1;
            dispatchEvent(new PropertyModEvent("rotate"));
         }
      }
      
      public function get rotate() : Boolean
      {
         return this.rotate_;
      }
      
      public function Rotate(param1:Boolean) : CastRay
      {
         this.rotate = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         if(param3 == null)
         {
            return;
         }
         if(§@W§.target[param1] != null)
         {
            return;
         }
         var _loc5_:§@W§ = new §@W§();
         _loc5_.initialise(param1,param4,param3 as Bloon);
         param1.levelSlug.§?3§(_loc5_);
      }
   }
}

