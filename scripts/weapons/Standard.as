package weapons
{
   import §8U§.§52§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import events.PropertyModEvent;
   import projectiles.def.ProjectileDef;
   
   public class Standard extends Weapon implements HasReloadTime, HasRange, HasPower, HasProjectile
   {
      
      private var range_:§<<§ = §-A§.§]H§();
      
      private var reloadTime_:§<<§ = §-A§.§]H§();
      
      private var power_:§<<§ = §-A§.§]H§();
      
      private var projectile_:ProjectileDef = null;
      
      private var offset_:§52§ = null;
      
      public function Standard(param1:String = null)
      {
         super(param1);
      }
      
      override public function destroy() : void
      {
         §-A§.§&!§(this.range_);
         §-A§.§&!§(this.reloadTime_);
         §-A§.§&!§(this.power_);
      }
      
      public function set range(param1:Number) : void
      {
         if(this.range_.value != param1)
         {
            this.range_.value = param1;
            dispatchEvent(new PropertyModEvent("range"));
         }
      }
      
      public function get range() : Number
      {
         return this.range_.value;
      }
      
      public function set reloadTime(param1:Number) : void
      {
         if(this.reloadTime_.value != param1)
         {
            this.reloadTime_.value = param1;
            dispatchEvent(new PropertyModEvent("reloadTime"));
         }
      }
      
      public function get reloadTime() : Number
      {
         return this.reloadTime_.value;
      }
      
      public function set power(param1:Number) : void
      {
         if(this.power_.value != param1)
         {
            this.power_.value = param1;
            dispatchEvent(new PropertyModEvent("power"));
         }
      }
      
      public function get power() : Number
      {
         return this.power_.value;
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
   }
}

