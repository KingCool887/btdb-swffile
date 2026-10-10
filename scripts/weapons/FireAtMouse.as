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
   import towers.def.TowerDef;
   import utils.Pool;
   import utils.Rndm;
   
   public class FireAtMouse extends Standard implements HasSpread
   {
      
      private var spread_:§<<§ = §-A§.§]H§();
      
      private var tmpRotation:§52§ = new §52§();
      
      public function FireAtMouse()
      {
         super();
      }
      
      public function set spread(param1:Number) : void
      {
         if(this.spread_.value != param1)
         {
            this.spread_.value = param1;
            dispatchEvent(new PropertyModEvent("spread"));
         }
      }
      
      override public function destroy() : void
      {
         §-A§.§&!§(this.spread_);
         super.destroy();
      }
      
      public function get spread() : Number
      {
         return this.spread_.value;
      }
      
      public function Spread(param1:Number) : FireAtMouse
      {
         this.spread = param1;
         return this;
      }
      
      public function Range(param1:Number) : FireAtMouse
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : FireAtMouse
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : FireAtMouse
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : FireAtMouse
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : FireAtMouse
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc6_:projectiles.Projectile = null;
         var _loc7_:§52§ = null;
         var _loc5_:§52§ = new §52§();
         if(param1.targetingSystem == TowerDef.TARGETS_MOUSE)
         {
            _loc7_ = param1.levelSlug.§#"§();
            _loc5_.x = _loc7_.x;
            _loc5_.y = _loc7_.y;
         }
         else if(param1.targetingSystem == TowerDef.TARGETS_RETICLE)
         {
            _loc5_ = FireAtReticle.GetLocation(param1);
         }
         _loc6_ = Pool.get(projectiles.Projectile);
         _loc6_.initialise(projectile,param1.levelSlug);
         _loc6_.owner = param1;
         _loc6_.x = param2.x;
         _loc6_.y = param2.y;
         _loc6_.lifespan = range / power;
         _loc6_.§#J§.x = _loc5_.x - _loc6_.x;
         _loc6_.§#J§.y = _loc5_.y - _loc6_.y;
         param1.rotation = _loc6_.§#J§.rotation;
         _loc6_.§#J§.§!X§ = power;
         _loc6_.§#J§.§ =§(Rndm.random() * this.spread - this.spread / 2);
         _loc6_.rotation = _loc6_.§#J§.rotation;
         if(param4)
         {
            this.tmpRotation.x = param4.x;
            this.tmpRotation.y = param4.y;
            this.tmpRotation.§ =§(_loc6_.§#J§.rotation);
            _loc6_.x += this.tmpRotation.x;
            _loc6_.y += this.tmpRotation.y;
         }
         param1.levelSlug.addProjectile(_loc6_);
      }
   }
}

