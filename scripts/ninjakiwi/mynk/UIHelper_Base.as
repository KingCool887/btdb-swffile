package ninjakiwi.mynk
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class UIHelper_Base extends EventDispatcher
   {
      
      protected var _isInGame:Boolean = false;
      
      protected var _gameIsReady:Boolean = true;
      
      private var _eventQueue:Array = [];
      
      public function UIHelper_Base()
      {
         super();
      }
      
      public function get SHOW_MAIN_MENU() : String
      {
         return "showMainMenu";
      }
      
      public function get SHOW_LOGIN_OPTIONS() : String
      {
         return "showLoginOptions";
      }
      
      public function get SHOW_FAIL_OPTIONS() : String
      {
         return "showFailOptions";
      }
      
      protected function postEvent(param1:Event) : void
      {
         if(param1.type == "showLoginOptions")
         {
            trace("BLOCKED_LOGIN_SCREEN");
            return;
         }
         if(!this._gameIsReady)
         {
            this._eventQueue.push(param1);
         }
         else
         {
            this.dispatchEvent(param1);
         }
      }
      
      protected function processEventCue() : void
      {
         var _loc1_:Event = null;
         for each(_loc1_ in this._eventQueue)
         {
            this.dispatchEvent(_loc1_);
         }
         this._eventQueue.length = 0;
      }
   }
}

