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
   
   public class FireAtMouseSpread extends Standard implements HasSpread
   {
      
      private static var angleTempVect:§52§ = new §52§();
      
      private var spread_:§<<§ = §-A§.§]H§();
      
      private var tmpRotation:§52§ = new §52§();
      
      public function FireAtMouseSpread()
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
      
      public function Spread(param1:Number) : FireAtMouseSpread
      {
         this.spread = param1;
         return this;
      }
      
      public function Range(param1:Number) : FireAtMouseSpread
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : FireAtMouseSpread
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : FireAtMouseSpread
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : FireAtMouseSpread
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : FireAtMouseSpread
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         var _loc11_:projectiles.Projectile = null;
         var _loc5_:§52§ = new §52§();
         if(param1.targetingSystem == TowerDef.TARGETS_MOUSE)
         {
            _loc5_ = param1.levelSlug.§#"§();
         }
         else if(param1.targetingSystem == TowerDef.TARGETS_RETICLE)
         {
            _loc5_ = FireAtReticle.GetLocation(param1);
         }
         _loc6_ = 0.3;
         _loc7_ = 3;
         angleTempVect.x = _loc5_.x - param2.x;
         angleTempVect.y = _loc5_.y - param2.y;
         _loc8_ = angleTempVect.rotation - _loc6_ / 2;
         _loc9_ = _loc6_ / (_loc7_ - 1);
         _loc10_ = 0;
         while(_loc10_ < _loc7_)
         {
            _loc11_ = Pool.get(projectiles.Projectile);
            _loc11_.initialise(projectile,param1.levelSlug);
            _loc11_.owner = param1;
            _loc11_.x = param2.x;
            _loc11_.y = param2.y;
            _loc11_.lifespan = range / power;
            _loc11_.§#J§.x = power;
            _loc11_.§#J§.y = 0;
            _loc11_.§#J§.§ =§(_loc8_ + _loc9_ * _loc10_);
            _loc11_.rotation = _loc11_.§#J§.rotation;
            _loc11_.§#J§.§ =§(Rndm.random() * this.spread - this.spread / 2);
            if(param4)
            {
               this.tmpRotation.x = param4.x;
               this.tmpRotation.y = param4.y;
               this.tmpRotation.§ =§(_loc11_.rotation);
               _loc11_.x += this.tmpRotation.x;
               _loc11_.y += this.tmpRotation.y;
            }
            param1.levelSlug.addProjectile(_loc11_);
            _loc10_++;
         }
      }
   }
}

