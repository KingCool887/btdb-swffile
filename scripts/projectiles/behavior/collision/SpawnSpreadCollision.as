package projectiles.behavior.collision
{
   import events.PropertyModEvent;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import utils.Pool;
   
   public class SpawnSpreadCollision extends BehaviorCollision
   {
      
      private var projectile_:ProjectileDef;
      
      public function SpawnSpreadCollision()
      {
         super();
      }
      
      public function SpawnSpread() : *
      {
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
      
      public function Projectile(param1:ProjectileDef) : SpawnSpreadCollision
      {
         this.projectile = param1;
         return this;
      }
      
      override public function execute(param1:projectiles.Projectile) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:projectiles.Projectile = null;
         var _loc3_:Number = Math.PI * 2 * 7 / 8;
         _loc5_ = _loc3_ / (8 - 1);
         _loc6_ = 0;
         while(_loc6_ < 8)
         {
            _loc7_ = Pool.get(projectiles.Projectile);
            _loc7_.initialise(this.projectile,param1.levelSlug);
            _loc7_.owner = param1.owner;
            _loc7_.x = param1.x;
            _loc7_.y = param1.y;
            _loc7_.pierce = 1;
            _loc7_.lifespan = 0.2;
            _loc7_.§#J§.x = 500;
            _loc7_.§#J§.y = 0;
            _loc7_.§#J§.§ =§(0 + _loc5_ * _loc6_);
            _loc7_.id = param1.id;
            param1.levelSlug.addProjectile(_loc7_);
            _loc6_++;
         }
      }
   }
}

