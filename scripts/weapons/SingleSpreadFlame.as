package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import events.PropertyModEvent;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   import utils.Rndm;
   
   public class SingleSpreadFlame extends Standard implements HasSpread
   {
      
      private static var angleTempVect:§52§ = new §52§();
      
      private var rotate_:Boolean = true;
      
      private var spread_:Number = 0;
      
      private var tempRotation:§52§ = new §52§();
      
      public function SingleSpreadFlame()
      {
         super();
      }
      
      public function set spread(param1:Number) : void
      {
         if(this.spread_ != param1)
         {
            this.spread_ = param1;
            dispatchEvent(new PropertyModEvent("spread"));
         }
      }
      
      public function get spread() : Number
      {
         return this.spread_;
      }
      
      public function Spread(param1:Number) : SingleSpreadFlame
      {
         this.spread = param1;
         return this;
      }
      
      public function Range(param1:Number) : SingleSpreadFlame
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : SingleSpreadFlame
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : SingleSpreadFlame
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : SingleSpreadFlame
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : SingleSpreadFlame
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
      
      public function Rotate(param1:Boolean) : SingleSpreadFlame
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
         var _loc6_:Number = range;
         if(param4 != null)
         {
            this.tempRotation.x = param4.x;
            this.tempRotation.y = param4.y;
            this.tempRotation.§ =§(param2.rotation);
            _loc5_.x += this.tempRotation.x;
            _loc5_.y += this.tempRotation.y;
            _loc6_ -= param4.§!X§;
         }
         _loc5_.lifespan = _loc6_ / power;
         if(param3 != null)
         {
            _loc5_.§#J§.x = param3.x - param1.x;
            _loc5_.§#J§.y = param3.y - param1.y;
            _loc5_.§#J§.§!X§ = power;
         }
         else
         {
            _loc5_.§#J§.x = power;
            _loc5_.§#J§.y = 0;
            _loc5_.§#J§.rotation = param2.rotation;
         }
         _loc5_.§#J§.rotation += Rndm.random() * this.spread - this.spread / 2;
         _loc5_.rotation = _loc5_.§#J§.rotation;
         param1.levelSlug.addProjectile(_loc5_);
      }
   }
}

