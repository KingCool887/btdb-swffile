package ninjakiwi.mynk.net
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   import ninjakiwi.state.State;
   
   public class RemoteLoginSystem extends LoginSystem
   {
      
      private var _remoteAPI:RemoteAPI;
      
      public function RemoteLoginSystem(param1:String, param2:Object, param3:String = null)
      {
         super(param3);
         this._remoteAPI = new RemoteAPI(param1,param2);
         this._remoteAPI.addEventListener(IOErrorEvent.IO_ERROR,this.connectErrorMsgHandler);
         _api = this._remoteAPI;
         _displayObject.addChild(this._remoteAPI.displayObject);
         _state.CONNECTING.addEventListener(State.ENTER,this.beginConnecting);
      }
      
      private function beginConnecting(param1:Event) : void
      {
         this._remoteAPI.load();
      }
      
      private function connectErrorMsgHandler(param1:Event) : void
      {
         _state.receive(Msg.CONNECT_ERROR);
      }
   }
}

