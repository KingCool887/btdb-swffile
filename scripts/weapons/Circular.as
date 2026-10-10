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
   
   public class Circular extends Standard
   {
      
      private var count_:§<<§ = §-A§.§]H§();
      
      public function Circular(param1:String = null)
      {
         super(param1);
      }
      
      override public function destroy() : void
      {
         §-A§.§&!§(this.count_);
         super.destroy();
      }
      
      public function set count(param1:int) : void
      {
         if(this.count_.value != param1)
         {
            this.count_.value = param1;
            dispatchEvent(new PropertyModEvent("count"));
         }
      }
      
      public function get count() : int
      {
         return this.count_.value;
      }
      
      public function Count(param1:int) : Circular
      {
         this.count = param1;
         return this;
      }
      
      public function Range(param1:Number) : Circular
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : Circular
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : Circular
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : Circular
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : Circular
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:projectiles.Projectile = null;
         if(param1.def == null)
         {
            return;
         }
         _loc5_ = 2 * Math.PI / this.count;
         _loc6_ = 0;
         while(_loc6_ < this.count)
         {
            _loc7_ = Pool.get(projectiles.Projectile);
            _loc7_.initialise(projectile,param1.levelSlug);
            _loc7_.owner = param1;
            _loc7_.x = param2.x;
            _loc7_.y = param2.y;
            _loc7_.lifespan = range / power;
            _loc7_.§#J§.x = power;
            _loc7_.§#J§.y = 0;
            _loc7_.§#J§.§ =§(param1.rotation + _loc5_ * _loc6_);
            _loc7_.rotation = _loc7_.§#J§.rotation;
            param1.levelSlug.addProjectile(_loc7_);
            _loc6_++;
         }
      }
   }
}

