package ninjakiwi.mynk.nk
{
   import flash.events.Event;
   import ninjakiwi.mynk.net.RemoteLoginSystem;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   
   public class NK_LoginSystem extends RemoteLoginSystem
   {
      
      private static const URL_LIVE:String = "./Banana.swf";
      
      private static const URL_DEBUG:String = "./Banana.swf";
      
      private static const §0Q§:Boolean = false;
      
      private var _debug:Boolean;
      
      public function NK_LoginSystem(param1:String, param2:Boolean = false)
      {
         var _loc3_:String = null;
         this._debug = param2;
         if(this._debug && §0Q§)
         {
            _loc3_ = URL_DEBUG;
         }
         else
         {
            _loc3_ = URL_LIVE;
         }
         super(_loc3_,{"gamename":param1},"NK Login");
         this.addAPIListeners();
      }
      
      private function addAPIListeners() : void
      {
         _api.addEventListener(Msg.CONNECT_ERROR,this.connectErrorMsgHandler);
         _api.addEventListener(Msg.CONNECTED,this.connectedMsgHandler);
         _api.addEventListener(Msg.LOGGED_IN,this.loggedInMsgHandler);
         _api.addEventListener(Msg.LOGGED_OUT,this.loggedOutMsgHandler);
      }
      
      private function connectErrorMsgHandler(param1:Event) : void
      {
         _state.receive(Msg.CONNECT_ERROR);
      }
      
      private function connectedMsgHandler(param1:Event) : void
      {
         _state.receive(Msg.CONNECTED);
      }
      
      private function loggedInMsgHandler(param1:Event) : void
      {
         _state.receive(Msg.LOGGED_IN);
      }
      
      private function loggedOutMsgHandler(param1:Event) : void
      {
         _state.receive(Msg.LOGGED_OUT);
      }
   }
}

