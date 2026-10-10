package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import events.PropertyModEvent;
   import flash.utils.Dictionary;
   import towers.Tower;
   
   public class Sequence extends Weapon implements HasReloadTime, HasChildWeapons, HasRange
   {
      
      private static var next:Dictionary = new Dictionary();
      
      private var reloadTime_:§<<§ = §-A§.§]H§();
      
      private var childWeapons_:Vector.<Weapon>;
      
      private var range_:§<<§ = §-A§.§]H§();
      
      public function Sequence(param1:String = null)
      {
         super(param1);
      }
      
      override public function destroy() : void
      {
         §-A§.§&!§(this.reloadTime_);
         §-A§.§&!§(this.range_);
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
      
      public function Range(param1:Number) : Sequence
      {
         this.range = param1;
         return this;
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
      
      public function ReloadTime(param1:Number) : Sequence
      {
         this.reloadTime = param1;
         return this;
      }
      
      public function set childWeapons(param1:Vector.<Weapon>) : void
      {
         if(this.childWeapons_ != param1)
         {
            this.childWeapons_ = param1;
            dispatchEvent(new PropertyModEvent("childWeapons"));
         }
      }
      
      public function get childWeapons() : Vector.<Weapon>
      {
         return this.childWeapons_;
      }
      
      public function ChildWeapons(param1:Vector.<Weapon>) : Sequence
      {
         this.childWeapons = param1;
         return this;
      }
      
      public function Proxied(param1:Boolean) : Sequence
      {
         proxied = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         if(next[param1] == null)
         {
            next[param1] = 0;
         }
         if(next[param1] >= this.childWeapons.length)
         {
            next[param1] = 0;
         }
         this.childWeapons[next[param1]].execute(param1,param2,param3);
         ++next[param1];
      }
   }
}

