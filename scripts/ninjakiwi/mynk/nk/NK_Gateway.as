package ninjakiwi.mynk.nk
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.MouseEvent;
   import ninjakiwi.mynk.IGateway;
   import ninjakiwi.mynk.IGatewayUser;
   import ninjakiwi.mynk.IStore;
   import ninjakiwi.mynk.IUIHelper;
   import ninjakiwi.mynk.LoginStateIndicator;
   import ninjakiwi.mynk.net.LoginState;
   import ninjakiwi.mynk.net.RemoteLoginSystem;
   import ninjakiwi.state.State;
   
   public class NK_Gateway extends EventDispatcher implements IGateway
   {
      
      private var _nkBar:RemoteLoginSystem;
      
      private var _user:IGatewayUser;
      
      private var _store:IStore;
      
      private var _uiHelper:IUIHelper;
      
      private var _indicator:LoginStateIndicator;
      
      private var _displayObject:Sprite;
      
      public function NK_Gateway(param1:String, param2:Boolean = false)
      {
         super();
         trace("NK_GATEWAY_CONSTRUCTED");
         this._nkBar = new NK_LoginSystem(param1,param2);
         this._nkBar.state.FAILED.addEventListener(State.ENTER,this.nkBarEnterFailedHandler);
         this._nkBar.state.FAILED.addEventListener(State.EXIT,this.nkBarExitFailedHandler);
         this._indicator = new LoginStateIndicator();
         this._indicator.watchState(this._nkBar.state);
         this._indicator.retryButton.addEventListener(MouseEvent.CLICK,this.retryButtonHandler);
         this._displayObject = new Sprite();
         this._displayObject.addChild(this._indicator);
         this._displayObject.addChild(this._nkBar.displayObject);
         this._user = new NK_GatewayUser(this._nkBar);
         this._store = new NK_Store(this._nkBar);
         this._uiHelper = new NK_UIHelper(this);
      }
      
      public function activate() : void
      {
         trace("ACTIVATE_SKIPPED");
      }
      
      public function isConnected() : Boolean
      {
         return this._nkBar.isConnected();
      }
      
      private function retryButtonHandler(param1:Event) : void
      {
         this._nkBar.load();
      }
      
      public function get displayObject() : DisplayObjectContainer
      {
         return this._displayObject;
      }
      
      public function get state() : LoginState
      {
         return this._nkBar.state;
      }
      
      public function get user() : IGatewayUser
      {
         return this._user;
      }
      
      public function get store() : IStore
      {
         return this._store;
      }
      
      public function get uiHelper() : IUIHelper
      {
         return this._uiHelper;
      }
      
      private function nkBarEnterFailedHandler(param1:Event) : void
      {
         this._nkBar.displayObject.visible = false;
      }
      
      private function nkBarExitFailedHandler(param1:Event) : void
      {
         this._nkBar.displayObject.visible = true;
      }
      
      public function callServer(param1:String, param2:Function, ... rest) : void
      {
         var _loc4_:Array = ["callServer",param1,param2].concat(rest);
         this._nkBar.api.call.apply(this._nkBar.api,_loc4_);
      }
      
      public function getServerTime() : void
      {
         this._nkBar.api.call("getServerTime");
      }
      
      public function getAPIVersion() : String
      {
         var result:String = null;
         try
         {
            result = this._nkBar.api.call("getVersion");
         }
         catch(err:Error)
         {
            result = "unknown";
         }
         return result;
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._nkBar.displayObject.addEventListener(param1,param2,param3,param4,param5);
         this._user.saveBoss.addEventListener(param1,param2,param3,param4,param5);
         super.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         this.user.saveBoss.removeEventListener(param1,param2,param3);
         this._nkBar.displayObject.removeEventListener(param1,param2,param3);
      }
   }
}

