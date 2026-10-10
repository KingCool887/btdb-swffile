package ninjakiwi.mynk.nk
{
   import flash.events.Event;
   
   public class SecretNK_LoginSystem extends NK_LoginSystem
   {
      
      public function SecretNK_LoginSystem(param1:String, param2:Boolean = false)
      {
         super(param1,param2);
         this.addAPIListeners();
      }
      
      private function addAPIListeners() : void
      {
         _api.addEventListener(Event.COMPLETE,this.loadedHandler);
      }
      
      private function loadedHandler(param1:Event) : void
      {
         _api.call("useBackDoorMode");
      }
   }
}

