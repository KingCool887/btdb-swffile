package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import events.PropertyModEvent;
   import flash.utils.Dictionary;
   import projectiles.Projectile;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   import utils.Pool;
   import utils.Rndm;
   
   public class FireAtReticle extends Standard implements HasSpread
   {
      
      public static var locations:Dictionary = new Dictionary();
      
      private var spread_:Number = 0;
      
      public function FireAtReticle(param1:String = null)
      {
         super(param1);
      }
      
      public static function GetLocation(param1:Tower) : §52§
      {
         if(locations[param1.id] == null)
         {
            locations[param1.id] = new §52§();
            locations[param1.id].x = param1.x;
            locations[param1.id].y = param1.y;
         }
         return locations[param1.id];
      }
      
      public static function SetLocation(param1:Tower, param2:Number, param3:Number) : *
      {
         if(locations[param1.id] == null)
         {
            locations[param1.id] = new §52§();
         }
         locations[param1.id].x = param2;
         locations[param1.id].y = param3;
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
      
      public function Spread(param1:Number) : FireAtReticle
      {
         this.spread = param1;
         return this;
      }
      
      public function Range(param1:Number) : FireAtReticle
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : FireAtReticle
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : FireAtReticle
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : FireAtReticle
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : FireAtReticle
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc5_:§52§ = null;
         var _loc6_:projectiles.Projectile = null;
         var _loc7_:§52§ = null;
         _loc5_ = GetLocation(param1);
         _loc6_ = Pool.get(projectiles.Projectile);
         _loc6_.initialise(projectile,param1.levelSlug);
         _loc6_.owner = param1;
         _loc6_.x = param2.x;
         _loc6_.y = param2.y;
         _loc7_ = new §52§();
         _loc7_.x = Rndm.random() * this.spread;
         _loc7_.y = 0;
         _loc7_.rotation = Rndm.random() * Math.PI * 2;
         _loc6_.§#J§.x = _loc5_.x - _loc6_.x;
         _loc6_.§#J§.y = _loc5_.y - _loc6_.y;
         _loc6_.§>X§.x = _loc5_.x;
         _loc6_.§>X§.y = _loc5_.y;
         _loc6_.§#J§.x += _loc7_.x;
         _loc6_.§#J§.y += _loc7_.y;
         _loc6_.§>X§.x += _loc7_.x;
         _loc6_.§>X§.y += _loc7_.y;
         _loc6_.lifespan = _loc6_.§#J§.§!X§ / power;
         _loc6_.§#J§.§!X§ = power;
         _loc6_.rotation = _loc6_.§#J§.rotation;
         param1.levelSlug.addProjectile(_loc6_);
      }
   }
}

