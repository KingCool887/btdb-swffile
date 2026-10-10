package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import events.PropertyModEvent;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   
   public class SingleAtMultiTarget extends Standard
   {
      
      private var rotate_:Boolean = true;
      
      private var tempRotation:§52§ = new §52§();
      
      private var count_:§<<§ = §-A§.§]H§();
      
      public function SingleAtMultiTarget()
      {
         super();
      }
      
      public function set count(param1:int) : void
      {
         if(this.count_.value != param1)
         {
            this.count_.value = param1;
            dispatchEvent(new PropertyModEvent("count"));
         }
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
      
      public function get count() : int
      {
         return this.count_.value;
      }
      
      public function Count(param1:int) : SingleAtMultiTarget
      {
         this.count = param1;
         return this;
      }
      
      public function Range(param1:Number) : SingleAtMultiTarget
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : SingleAtMultiTarget
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : SingleAtMultiTarget
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : SingleAtMultiTarget
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : SingleAtMultiTarget
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
      
      public function Rotate(param1:Boolean) : SingleAtMultiTarget
      {
         this.rotate = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc6_:§"L§ = null;
         var _loc7_:projectiles.Projectile = null;
         var _loc5_:int = 0;
         while(_loc5_ < this.count)
         {
            _loc6_ = param3;
            if(_loc5_ < param1.§+A§.length)
            {
               _loc6_ = param1.§+A§[param1.§+A§.length - 1 - _loc5_];
            }
            _loc7_ = Pool.get(projectiles.Projectile);
            _loc7_.initialise(projectile,param1.levelSlug);
            _loc7_.owner = param1;
            _loc7_.x = param2.x;
            _loc7_.y = param2.y;
            if(param4 != null)
            {
               this.tempRotation.x = param4.x;
               this.tempRotation.y = param4.y;
               this.tempRotation.§ =§(param1.rotation);
               _loc7_.x += this.tempRotation.x;
               _loc7_.y += this.tempRotation.y;
            }
            _loc7_.lifespan = range / power;
            if(_loc6_ != null)
            {
               _loc7_.§#J§.x = _loc6_.x - _loc7_.x;
               _loc7_.§#J§.y = _loc6_.y - _loc7_.y;
               _loc7_.§#J§.§!X§ = power;
               if(this.rotate)
               {
                  param1.rotation = _loc7_.§#J§.rotation;
               }
            }
            else
            {
               _loc7_.§#J§.x = power;
               _loc7_.§#J§.y = 0;
               _loc7_.§#J§.rotation = param2.rotation;
            }
            _loc7_.rotation = _loc7_.§#J§.rotation;
            param1.levelSlug.addProjectile(_loc7_);
            _loc5_++;
         }
      }
   }
}

