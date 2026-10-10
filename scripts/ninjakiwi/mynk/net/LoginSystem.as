package ninjakiwi.mynk.net
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   
   public class LoginSystem
   {
      
      protected var _api:API;
      
      protected var _state:LoginState;
      
      protected var _displayObject:DisplayObjectContainer;
      
      public function LoginSystem(param1:String = null)
      {
         super();
         trace("LOGINSYSTEM_BOOT");
         this._displayObject = new Sprite();
         this._state = new LoginState(param1);
         this._state.enter();
         this._state.receive(Msg.CONNECTED);
         this._state.receive(Msg.LOGGED_IN);
      }
      
      public function load() : void
      {
         this._state.receive(Msg.CONNECT);
      }
      
      public function get api() : API
      {
         return this._api;
      }
      
      public function get state() : LoginState
      {
         return this._state;
      }
      
      public function get displayObject() : DisplayObjectContainer
      {
         return this._displayObject;
      }
      
      public function isConnected() : Boolean
      {
         return this._state.isCurrently(this._state.CONNECTED);
      }
   }
}

