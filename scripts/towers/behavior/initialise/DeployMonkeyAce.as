package towers.behavior.initialise
{
   import entities.§^H§;
   import events.PropertyModEvent;
   import flash.utils.Dictionary;
   import towers.Tower;
   
   public class DeployMonkeyAce extends BehaviorInitialise
   {
      
      public static var aces:Dictionary = new Dictionary();
      
      private var display_:Class = null;
      
      public function DeployMonkeyAce()
      {
         super();
      }
      
      public function set display(param1:Class) : void
      {
         if(this.display_ != param1)
         {
            this.display_ = param1;
            dispatchEvent(new PropertyModEvent("display"));
         }
      }
      
      public function get display() : Class
      {
         return this.display_;
      }
      
      public function Display(param1:Class) : DeployMonkeyAce
      {
         this.display = param1;
         return this;
      }
      
      override public function execute(param1:Tower) : void
      {
         var _loc2_:§^H§ = null;
         if(aces[param1] == null)
         {
            aces[param1] = new §^H§();
            aces[param1].Initialise(param1,this.display,param1.def);
            param1.levelSlug.§?3§(aces[param1]);
         }
         else if(aces[param1].def != param1.def)
         {
            _loc2_ = aces[param1];
            aces[param1].destroy();
            aces[param1] = new §^H§();
            aces[param1].Initialise(param1,this.display,param1.def);
            param1.levelSlug.§?3§(aces[param1]);
            aces[param1].copy(_loc2_);
         }
         aces[param1].takeoff();
      }
   }
}

