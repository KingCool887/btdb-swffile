package §0$§
{
   import §>$§.§10§;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   
   public class §=C§ extends §`A§
   {
      
      private var battleID:String = "MATCHRAH";
      
      private var side:int = 0;
      
      private var §;K§:Boolean = false;
      
      internal var §47§:Object = {};
      
      public function §=C§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         mc.close_btn.click = this.§!B§;
         mc.join_btn.click = this.join;
         mc.create_btn.click = this.create;
         mc.serverStatus.close_btn.click = this.cancel;
         mc.connectFail_mc.ok_btn.click = this.§&2§;
         mc.matchID_txt.restrict = "A-Z 0-9";
         mc.matchID_txt.maxChars = 15;
      }
      
      override public function show(param1:* = null) : void
      {
         mc.serverStatus.visible = false;
         mc.join_btn.valid = false;
         mc.connectFail_mc.visible = false;
         mc.matchID_txt.text = "Enter Battle ID";
         mc.matchID_txt.addEventListener(MouseEvent.CLICK,this.§^L§);
         mc.matchID_txt.addEventListener(KeyboardEvent.KEY_DOWN,this.§2G§);
         mc.matchID_txt.addEventListener(TextEvent.TEXT_INPUT,this.§2G§);
         mc.matchID_txt.addEventListener(Event.CHANGE,this.§2G§);
         this.§<N§();
         if(§&K§.instance.§+&§(§&K§.instance.§?U§) == false)
         {
            §&K§.instance.§?U§.show();
         }
         super.show(param1);
      }
      
      override public function hide(param1:* = null) : void
      {
         this.§=1§();
         this.§;K§ = false;
         super.hide(param1);
      }
      
      private function §!B§(param1:Event) : void
      {
         this.hide();
         §&K§.instance.§?U§.show();
      }
      
      private function create(param1:Event) : void
      {
         this.side = 0;
         this.battleID = null;
         this.§;K§ = true;
         this.find();
      }
      
      private function join(param1:Event) : void
      {
         if(mc.matchID_txt.text == "" || mc.matchID_txt.text == "Enter Battle ID")
         {
            return;
         }
         this.side = 1;
         this.battleID = mc.matchID_txt.text;
         this.§;K§ = true;
         this.find();
      }
      
      private function find() : void
      {
         if(!this.§;K§)
         {
            return;
         }
         mc.serverStatus.visible = true;
         mc.serverStatus.finding_ico.msg_txt.text = "Contacting Server...";
         mc.serverStatus.finding_ico.throbber.play();
         §10§.instance.connect();
         if(§10§.instance.isConnected())
         {
            if(this.battleID == null)
            {
               §10§.instance.§#2§();
            }
            else
            {
               §10§.instance.§@M§(this.battleID);
            }
         }
      }
      
      private function cancel(param1:Event) : void
      {
         §10§.instance.§05§();
         mc.serverStatus.visible = false;
      }
      
      private function §&2§(param1:Event) : void
      {
         mc.connectFail_mc.visible = false;
         mc.serverStatus.visible = false;
      }
      
      private function §^L§(param1:Event) : void
      {
         mc.matchID_txt.text = "";
         mc.matchID_txt.removeEventListener(MouseEvent.CLICK,this.§^L§);
      }
      
      private function §2G§(param1:Event) : void
      {
         if(mc.matchID_txt.text.length > 0)
         {
            mc.join_btn.valid = true;
         }
         else
         {
            mc.join_btn.valid = false;
         }
      }
      
      private function §<N§() : void
      {
         §10§.instance.§=4§.add(this.§6L§);
         §10§.instance.§"#§.add(this.§@#§);
         §10§.instance.§ #§.add(this.§@D§);
         §10§.instance.§!F§.add(this.§>W§);
         §10§.instance.§0+§.add(this.§ B§);
      }
      
      private function §=1§() : void
      {
         §10§.instance.§=4§.remove(this.§6L§);
         §10§.instance.§"#§.remove(this.§@#§);
         §10§.instance.§ #§.remove(this.§@D§);
         §10§.instance.§!F§.remove(this.§>W§);
      }
      
      private function §6L§() : void
      {
         if(this.§;K§)
         {
            this.find();
         }
      }
      
      private function §@#§() : void
      {
         mc.serverStatus.finding_ico.msg_txt.text = "Disconnected from the Main Server.";
         mc.serverStatus.finding_ico.throbber.stop();
      }
      
      private function §@D§() : void
      {
         mc.serverStatus.finding_ico.msg_txt.text = "Sending Player Info...";
      }
      
      private function §>W§(param1:String) : void
      {
         var _loc2_:Object = new Object();
         _loc2_.side = this.side;
         _loc2_.battleID = param1;
         this.hide();
         §&K§.instance.§?U§.hide();
         §&K§.instance.§^F§.show(_loc2_);
      }
      
      private function § B§() : void
      {
         mc.connectFail_mc.visible = true;
         mc.serverStatus.visible = false;
      }
   }
}

