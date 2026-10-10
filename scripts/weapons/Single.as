package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import bloons.Bloon;
   import events.PropertyModEvent;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   
   public class Single extends Standard
   {
      
      private var rotate_:Boolean = true;
      
      private var tempRotation:§52§ = new §52§();
      
      public function Single(param1:String = null)
      {
         super(param1);
      }
      
      public function Range(param1:Number) : Single
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : Single
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : Single
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : Single
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : Single
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
      
      public function Rotate(param1:Boolean) : Single
      {
         this.rotate = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc5_:projectiles.Projectile = null;
         _loc5_ = Pool.get(projectiles.Projectile);
         _loc5_.initialise(projectile,param1.levelSlug);
         _loc5_.owner = param1;
         _loc5_.x = param2.x;
         _loc5_.y = param2.y;
         if(this.rotate && param3 != null)
         {
            _loc5_.§#J§.x = param3.x - _loc5_.x;
            _loc5_.§#J§.y = param3.y - _loc5_.y;
            param1.rotation = _loc5_.§#J§.rotation;
         }
         if(param4 != null)
         {
            this.tempRotation.x = param4.x;
            this.tempRotation.y = param4.y;
            this.tempRotation.§ =§(param2.rotation);
            _loc5_.x += this.tempRotation.x;
            _loc5_.y += this.tempRotation.y;
         }
         _loc5_.lifespan = range / power;
         if(param3 != null)
         {
            _loc5_.§#J§.x = param3.x - _loc5_.x;
            _loc5_.§#J§.y = param3.y - _loc5_.y;
            _loc5_.§#J§.§!X§ = power;
         }
         else
         {
            _loc5_.§#J§.x = power;
            _loc5_.§#J§.y = 0;
            _loc5_.§#J§.rotation = param2.rotation;
         }
         _loc5_.rotation = _loc5_.§#J§.rotation;
         _loc5_.target = param3 as Bloon;
         if(param1.levelSlug != null)
         {
            param1.levelSlug.addProjectile(_loc5_);
         }
      }
   }
}

