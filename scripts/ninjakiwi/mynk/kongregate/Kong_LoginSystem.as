package ninjakiwi.mynk.kongregate
{
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import ninjakiwi.mynk.net.RemoteLoginSystem;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   import ninjakiwi.state.State;
   
   public class Kong_LoginSystem extends RemoteLoginSystem
   {
      
      private static const URL_DEBUG:String = "http://www.kongregate.com/flash/API_AS3_Local.swf";
      
      private var _debug:Boolean;
      
      public function Kong_LoginSystem(param1:LoaderInfo, param2:Boolean = false)
      {
         this._debug = param2;
         var _loc3_:String = param1.parameters["api_path"];
         if(_loc3_ == null)
         {
            _loc3_ = URL_DEBUG;
         }
         super(_loc3_,{},"Kong Login");
         _state.LIMBO.addEventListener(State.ENTER,this.enterLimboHandler);
         this.addAPIListeners();
      }
      
      private function addAPIListeners() : void
      {
         _api.addEventListener(Event.COMPLETE,this.loadCompleteMsgHandler);
      }
      
      private function loadCompleteMsgHandler(param1:Event) : void
      {
         _api.callNested("services.addEventListener","login",this.loginMsgHandler);
         _api.callNested("services.connect");
         _state.receive(Msg.CONNECTED);
      }
      
      private function loginMsgHandler(param1:Event) : void
      {
         this.updateLoggedInState();
      }
      
      private function enterLimboHandler(param1:Event) : void
      {
         this.updateLoggedInState();
      }
      
      private function updateLoggedInState() : void
      {
         if(_api.callNested("services.isGuest"))
         {
            _state.receive(Msg.LOGGED_OUT);
         }
         else
         {
            _state.receive(Msg.LOGGED_IN);
         }
      }
   }
}

