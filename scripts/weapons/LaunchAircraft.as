package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import entities.§]>§;
   import events.PropertyModEvent;
   import projectiles.def.ProjectileDef;
   import towers.Tower;
   
   public class LaunchAircraft extends Standard
   {
      
      private var aircraftWeapon_:Vector.<Weapon> = null;
      
      public function LaunchAircraft()
      {
         super();
      }
      
      public function set aircraftWeapon(param1:Vector.<Weapon>) : void
      {
         if(this.aircraftWeapon_ != param1)
         {
            this.aircraftWeapon_ = param1;
            dispatchEvent(new PropertyModEvent("aircraftWeapon"));
         }
      }
      
      public function get aircraftWeapon() : Vector.<Weapon>
      {
         return this.aircraftWeapon_;
      }
      
      public function AircraftWeapon(param1:Vector.<Weapon>) : LaunchAircraft
      {
         this.aircraftWeapon = param1;
         return this;
      }
      
      public function Range(param1:Number) : LaunchAircraft
      {
         range = param1;
         return this;
      }
      
      public function ReloadTime(param1:Number) : LaunchAircraft
      {
         reloadTime = param1;
         return this;
      }
      
      public function Power(param1:Number) : LaunchAircraft
      {
         power = param1;
         return this;
      }
      
      public function Projectile(param1:ProjectileDef) : LaunchAircraft
      {
         projectile = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : LaunchAircraft
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         var _loc5_:§]>§ = new §]>§();
         _loc5_.initialise(param1,param3,this.aircraftWeapon);
         param1.levelSlug.§?3§(_loc5_);
      }
   }
}

