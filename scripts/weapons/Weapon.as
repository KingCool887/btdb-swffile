package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import data.§%"§;
   import events.PropertyModEvent;
   import towers.Tower;
   
   public class Weapon extends §%"§
   {
      
      private var proxied_:Boolean = false;
      
      public function Weapon(param1:String = null)
      {
         super(param1);
      }
      
      public function set proxied(param1:Boolean) : void
      {
         if(this.proxied_ != param1)
         {
            this.proxied_ = param1;
            dispatchEvent(new PropertyModEvent("proxied"));
         }
      }
      
      public function get proxied() : Boolean
      {
         return this.proxied_;
      }
      
      public function destroy() : void
      {
      }
      
      public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
      }
   }
}

