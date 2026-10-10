package ninjakiwi.mynk.kongregate
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import ninjakiwi.mynk.*;
   import ninjakiwi.mynk.net.LoginState;
   import ninjakiwi.mynk.net.RemoteLoginSystem;
   import ninjakiwi.mynk.nk.SecretNK_LoginSystem;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   import ninjakiwi.state.State;
   
   public class Kong_Gateway extends EventDispatcher implements IGateway
   {
      
      private var _state:LoginState;
      
      private var _kongAPI:RemoteLoginSystem;
      
      private var _nkAPI:RemoteLoginSystem;
      
      private var _user:IGatewayUser;
      
      private var _store:IStore;
      
      private var _uiHelper:IUIHelper;
      
      private var _indicator:LoginStateIndicator;
      
      public function Kong_Gateway(param1:LoaderInfo, param2:String = null, param3:Boolean = false)
      {
         super();
         this._state = new LoginState("Kong Gateway");
         this._state.enter();
         this._indicator = new LoginStateIndicator();
         this._indicator.watchState(this._state);
         this._nkAPI = new SecretNK_LoginSystem(param2,param3);
         this._nkAPI.displayObject.visible = false;
         this._nkAPI.state.CONNECTED.addEventListener(State.ENTER,this.nkBarConnectedHandler);
         this._nkAPI.state.FAILED.addEventListener(State.ENTER,this.nkBarFailedHandler);
         this._kongAPI = new Kong_LoginSystem(param1,param3);
         this._kongAPI.displayObject.addChildAt(this._indicator,0);
         this._kongAPI.displayObject.addChild(this._nkAPI.displayObject);
         this._kongAPI.state.CONNECTED.addEventListener(State.ENTER,this.kongConnectedHandler);
         this._kongAPI.state.LOGGED_IN.addEventListener(State.ENTER,this.kongLoggedInHandler);
         this._kongAPI.state.LOGGED_OUT.addEventListener(State.ENTER,this.kongLoggedOutHandler);
         this._kongAPI.state.FAILED.addEventListener(State.ENTER,this.kongFailedHandler);
         this._user = new Kong_GatewayUser(this._kongAPI,this._nkAPI);
         this._store = new Kong_Store(this._kongAPI,this._user);
         this._uiHelper = new Kong_UIHelper(this,this._kongAPI);
         this._state.LIMBO.addEventListener(State.ENTER,this.enterLimboHandler);
         this._state.LOGGED_IN.addEventListener(State.ENTER,this.loggedInHandler);
         this._state.LOGGED_OUT.addEventListener(State.ENTER,this.loggedOutHandler);
         this._state.FAILED.addEventListener(State.ENTER,this.enterFailedHandler);
         this._user.saveBoss.addEventListener(Msg.DATA_READY,this.findAndExtractDiskIcon);
      }
      
      public function activate() : void
      {
         this._kongAPI.load();
         this._state.receive(Msg.CONNECT);
      }
      
      public function isConnected() : Boolean
      {
         return this._kongAPI.isConnected();
      }
      
      private function findAndExtractDiskIcon(param1:Event) : void
      {
         var _loc2_:MovieClip = null;
         var _loc4_:Loader = null;
         var _loc3_:int = 0;
         while(_loc3_ < this._nkAPI.displayObject.numChildren)
         {
            _loc4_ = this._nkAPI.displayObject.getChildAt(_loc3_) as Loader;
            if(_loc4_ != null)
            {
               try
               {
                  _loc2_ = (_loc4_.content as MovieClip).widget_mc.save_status_mc;
                  break;
               }
               catch(err:Error)
               {
                  break;
               }
               break;
            }
            _loc3_++;
         }
         if(_loc2_ != null)
         {
            this.displayObject.addChild(_loc2_);
         }
      }
      
      private function kongConnectedHandler(param1:Event) : void
      {
         this._nkAPI.load();
      }
      
      private function nkBarConnectedHandler(param1:Event) : void
      {
         this._state.receive(Msg.CONNECTED);
      }
      
      private function enterLimboHandler(param1:Event) : void
      {
         if(this._kongAPI.state.isCurrently(this._kongAPI.state.LOGGED_IN))
         {
            this._state.receive(Msg.LOGGED_IN);
         }
         else if(this._kongAPI.state.isCurrently(this._kongAPI.state.LOGGED_OUT))
         {
            this._state.receive(Msg.LOGGED_OUT);
         }
      }
      
      private function kongLoggedInHandler(param1:Event) : void
      {
         this._state.receive(Msg.LOGGED_IN);
      }
      
      private function kongLoggedOutHandler(param1:Event) : void
      {
         this._state.receive(Msg.LOGGED_OUT);
      }
      
      private function loggedInHandler(param1:Event) : void
      {
         this.logInToNKasKongUser();
      }
      
      private function loggedOutHandler(param1:Event) : void
      {
         this.logInToNKasKongUser();
      }
      
      private function logInToNKasKongUser() : void
      {
         var _loc1_:String = this._user.name;
         var _loc2_:String = this._user.id;
         var _loc3_:String = this._user.token;
         this._nkAPI.api.call("loginAsKongUser",_loc1_,_loc2_,_loc3_);
      }
      
      private function kongFailedHandler(param1:Event) : void
      {
         this._state.receive(Msg.CONNECT_ERROR);
      }
      
      private function nkBarFailedHandler(param1:Event) : void
      {
         this._state.receive(Msg.CONNECT_ERROR);
      }
      
      private function enterFailedHandler(param1:Event) : void
      {
         this._indicator.visible = false;
      }
      
      public function get displayObject() : DisplayObjectContainer
      {
         return this._kongAPI.displayObject;
      }
      
      public function get state() : LoginState
      {
         return this._state;
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
      
      public function callServer(param1:String, param2:Function, ... rest) : void
      {
         var _loc4_:Array = ["callServer",param1,param2].concat(rest);
         this._nkAPI.api.call.apply(this._nkAPI.api,_loc4_);
      }
      
      public function getServerTime() : void
      {
      }
      
      public function getAPIVersion() : String
      {
         return "unknown";
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._kongAPI.api.addEventListener(param1,param2,param3,param4,param5);
         this._user.saveBoss.addEventListener(param1,param2,param3,param4,param5);
         super.addEventListener(param1,param2,param3,param4,param5);
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         super.removeEventListener(param1,param2,param3);
         this.user.saveBoss.removeEventListener(param1,param2,param3);
         this._kongAPI.api.removeEventListener(param1,param2,param3);
      }
   }
}

