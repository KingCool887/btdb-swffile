package ninjakiwi.mynk.kongregate
{
   import flash.events.Event;
   import ninjakiwi.mynk.IUIHelper;
   import ninjakiwi.mynk.UIHelper_Base;
   import ninjakiwi.mynk.net.RemoteLoginSystem;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   import ninjakiwi.state.State;
   
   public class Kong_UIHelper extends UIHelper_Base implements IUIHelper
   {
      
      private var _gateway:Kong_Gateway;
      
      private var _kongLogin:RemoteLoginSystem;
      
      public function Kong_UIHelper(param1:Kong_Gateway, param2:RemoteLoginSystem)
      {
         super();
         this._gateway = param1;
         this._kongLogin = param2;
         this._gateway.user.saveBoss.addEventListener(Msg.DATA_READY,this.dataReadyHandler);
         this._gateway.state.FAILED.addEventListener(State.ENTER,this.gatewayFailedHandler);
      }
      
      public function waitForGame() : void
      {
         _gameIsReady = false;
      }
      
      public function gameIsReady() : void
      {
         _gameIsReady = true;
         processEventCue();
      }
      
      public function playAsGuest(param1:Event = null) : void
      {
         _isInGame = true;
         postEvent(new Event(SHOW_MAIN_MENU));
      }
      
      public function openLoginPage(param1:Event = null) : void
      {
         trace("LOGIN_BUTTON_PRESSED_USING_GUEST");
         this.playAsGuest();
      }
      
      private function dataReadyHandler(param1:Event) : void
      {
         if(this._gateway.user.isLoggedIn())
         {
            if(!_isInGame || this._gateway.user.saveBoss.dataWasChanged)
            {
               _isInGame = true;
               postEvent(new Event(SHOW_MAIN_MENU));
            }
         }
         else
         {
            _isInGame = false;
            postEvent(new Event(SHOW_LOGIN_OPTIONS));
         }
      }
      
      private function gatewayFailedHandler(param1:Event) : void
      {
         _isInGame = false;
         postEvent(new Event(SHOW_FAIL_OPTIONS));
      }
   }
}

