package ninjakiwi.mynk.nk
{
   import flash.events.Event;
   import flash.utils.setTimeout;
   import ninjakiwi.mynk.IGateway;
   import ninjakiwi.mynk.IUIHelper;
   import ninjakiwi.mynk.UIHelper_Base;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   import ninjakiwi.state.State;
   
   public class NK_UIHelper extends UIHelper_Base implements IUIHelper
   {
      
      private var _gateway:IGateway;
      
      public function NK_UIHelper(param1:IGateway)
      {
         var self:NK_UIHelper;
         super();
         this._gateway = param1;
         this._gateway.user.saveBoss.addEventListener(Msg.DATA_READY,this.dataReadyHandler);
         this._gateway.state.FAILED.addEventListener(State.ENTER,this.gatewayFailedHandler);
         self = this;
         setTimeout(function():void
         {
            trace("UIHELPER_TIMEOUT_BYPASS");
            self.playAsGuest();
         },1500);
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
         trace("DATA_READY fired: loggedIn=" + this._gateway.state.isCurrently(this._gateway.state.LOGGED_IN) + " failed=" + this._gateway.state.isCurrently(this._gateway.state.FAILED));
         var _loc2_:Boolean = this._gateway.state.isCurrently(this._gateway.state.LOGGED_IN);
         var _loc3_:Boolean = this._gateway.state.isCurrently(this._gateway.state.FAILED);
         if(_loc2_ || _loc3_)
         {
            if(!_isInGame || this._gateway.user.saveBoss.dataWasChanged)
            {
               _isInGame = true;
               trace("DATA_READY -> MAIN_MENU");
               postEvent(new Event(SHOW_MAIN_MENU));
            }
         }
         else
         {
            _isInGame = false;
            trace("DATA_READY -> LOGIN_OPTIONS");
            postEvent(new Event(SHOW_LOGIN_OPTIONS));
         }
      }
      
      private function gatewayFailedHandler(param1:Event) : void
      {
         trace("GATEWAY_FAILED");
         _isInGame = false;
         postEvent(new Event(SHOW_FAIL_OPTIONS));
      }
   }
}

