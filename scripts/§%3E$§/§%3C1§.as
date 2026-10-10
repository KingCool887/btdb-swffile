package §>$§
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.Socket;
   import flash.system.Security;
   import org.osflash.signals.Signal;
   
   public class §<1§
   {
      
      private static const §'7§:String = "\r";
      
      private static const §'U§:String = "\n";
      
      private var §^S§:Socket;
      
      private var §+B§:String;
      
      private var §>8§:int;
      
      private var §&5§:int;
      
      private var §#I§:Boolean;
      
      public const connected:Signal = new Signal(String);
      
      public const receive:Signal = new Signal(String);
      
      public const error:Signal = new Signal(String);
      
      public const §4U§:Signal = new Signal(String);
      
      public const disconnected:Signal = new Signal(String);
      
      private var §[R§:String = "";
      
      public function §<1§(param1:String, param2:int, param3:int = 0)
      {
         super();
         this.§+B§ = param1;
         this.§>8§ = param2;
         this.§&5§ = param3;
         this.§^S§ = new Socket();
         this.§^S§.addEventListener(Event.CONNECT,this.§;A§);
         this.§^S§.addEventListener(ProgressEvent.SOCKET_DATA,this.§%O§);
         this.§^S§.addEventListener(IOErrorEvent.IO_ERROR,this.§=A§);
         this.§^S§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.§>Q§);
         this.§^S§.addEventListener(Event.CLOSE,this.§4J§);
         if(param3 > 0)
         {
            Security.loadPolicyFile("xmlsocket://" + param1 + ":" + param3);
         }
      }
      
      public function connect() : void
      {
         trace("SOCKET_connect called: " + this.§+B§ + ":" + this.§>8§);
         this.§#I§ = true;
         this.§^S§.connect(this.§+B§,this.§>8§);
      }
      
      public function §@U§() : void
      {
         this.§#I§ = false;
         this.§^S§.close();
      }
      
      public function get isConnected() : Boolean
      {
         return this.§^S§.connected;
      }
      
      public function get §%S§() : Boolean
      {
         return !this.§^S§.connected && this.§#I§;
      }
      
      public function §96§(param1:String) : void
      {
         trace("SOCKET_SEND: connected=" + this.§^S§.connected + " data=" + param1);
         if(this.§^S§.connected)
         {
            this.§^S§.writeUTFBytes(param1 + §'U§);
            this.§^S§.flush();
            trace("SOCKET_SEND flushed");
         }
         else
         {
            trace("SOCKET_SEND bailed (not connected)");
            this.§4U§.dispatch(this.toString() + " tried to send before connected: " + param1);
         }
      }
      
      private function §%O§(param1:Event) : void
      {
         var _loc4_:String = null;
         var _loc2_:String = this.§^S§.readUTFBytes(this.§^S§.bytesAvailable);
         trace("SOCKET_DATA: " + _loc2_);
         _loc2_ = _loc2_.split(§'7§).join("");
         this.§[R§ += _loc2_;
         var _loc3_:Array = this.§[R§.split(§'U§);
         this.§[R§ = _loc3_.pop();
         for each(_loc4_ in _loc3_)
         {
            this.receive.dispatch(_loc4_);
         }
      }
      
      private function §;A§(param1:Event) : void
      {
         trace("A1: handler entered");
         this.§^S§.writeUTFBytes("Hello,250831.01" + §'U§);
         trace("A2: after writeUTFBytes");
         this.§^S§.flush();
         trace("A3: after flush");
         this.connected.dispatch(this.toString() + " connected");
         trace("A4: after dispatch");
      }
      
      private function §4J§(param1:Event) : void
      {
         trace("SOCKET_CLOSED");
         this.§#I§ = false;
         this.disconnected.dispatch(this.toString() + " disconnected");
      }
      
      private function §=A§(param1:IOErrorEvent) : void
      {
         trace("SOCKET_IO_ERROR: " + param1);
         this.§#I§ = false;
         this.disconnected.dispatch(this.toString() + " IO error" + §'U§ + param1);
         this.error.dispatch(this.toString() + " IO error" + §'U§ + param1);
      }
      
      private function §>Q§(param1:SecurityErrorEvent) : void
      {
         this.§#I§ = false;
         this.error.dispatch(this.toString() + " security error" + §'U§ + param1);
      }
      
      public function toString() : String
      {
         return "SocketConnection (" + this.§+B§ + ":" + this.§>8§ + ")";
      }
   }
}

