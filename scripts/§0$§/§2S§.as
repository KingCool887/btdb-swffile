package §0$§
{
   import §>$§.§10§;
   import assets.sound.PlayerFound;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import game.Balance;
   import sound.§^5§;
   
   public class §2S§ extends §`A§
   {
      
      private var §1B§:Timer = new Timer(1000);
      
      private var §!4§:Number = 0;
      
      public function §2S§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         mc.cancel_btn.valid = false;
         mc.cancel_btn.click = this.§!B§;
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         mc.time_box.time_txt.text = "00:00";
         mc.cancel_btn.valid = false;
         mc.addEventListener("EnterFinished",this.§6J§);
         mc.gotoAndPlay("Enter");
      }
      
      private function §6J§(param1:Event) : void
      {
         mc.removeEventListener("EnterFinished",this.§6J§);
         this.§!4§ = 0;
         this.§1B§.addEventListener(TimerEvent.TIMER,this.§>0§);
         this.§1B§.start();
         mc.cancel_btn.valid = true;
         mc.stage.addEventListener(KeyboardEvent.KEY_UP,this.§?7§);
         this.§<N§();
         this.§^T§();
      }
      
      override public function hide(param1:* = null) : void
      {
         this.§1B§.removeEventListener(TimerEvent.TIMER,this.§>0§);
         this.§1B§.stop();
         mc.cancel_btn.valid = false;
         mc.stage.removeEventListener(KeyboardEvent.KEY_UP,this.§?7§);
         this.§=1§();
         mc.addEventListener("ExitFinished",this.§2<§);
         mc.gotoAndPlay("Exit");
      }
      
      private function §2<§(param1:Event) : void
      {
         mc.removeEventListener("ExitFinished",this.§2<§);
         super.hide(null);
      }
      
      private function §!B§(param1:Event) : void
      {
         §10§.instance.§05§();
         this.hide();
         §&K§.instance.§?U§.show();
      }
      
      private function §?7§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ESCAPE)
         {
            this.§!B§(null);
         }
      }
      
      private function §<N§() : void
      {
         §10§.instance.§=4§.add(this.§^T§);
         §10§.instance.§"#§.add(this.§@#§);
         §10§.instance.§ #§.add(this.§@D§);
         §10§.instance.§!F§.add(this.§>W§);
         §10§.instance.§]S§.add(this.§,=§);
         §10§.instance.§;@§.add(this.§-P§);
         §10§.instance.§>&§.add(this.§2%§);
      }
      
      private function §=1§() : void
      {
         §10§.instance.§=4§.remove(this.§^T§);
         §10§.instance.§"#§.remove(this.§@#§);
         §10§.instance.§ #§.remove(this.§@D§);
         §10§.instance.§!F§.remove(this.§>W§);
         §10§.instance.§]S§.remove(this.§,=§);
         §10§.instance.§;@§.remove(this.§-P§);
         §10§.instance.§>&§.remove(this.§2%§);
      }
      
      private function §@#§() : void
      {
         mc.finding_ico.msg_txt.text = "Disconnected from the Main Server.";
         mc.finding_ico.throbber.stop();
         this.§1B§.removeEventListener(TimerEvent.TIMER,this.§>0§);
         this.§1B§.stop();
      }
      
      private function §^T§() : void
      {
         mc.finding_ico.msg_txt.text = "Contacting Server...";
         mc.finding_ico.throbber.play();
         §10§.instance.connect();
         if(§10§.instance.isConnected())
         {
            §10§.instance.§ M§();
         }
      }
      
      private function §@D§() : void
      {
         mc.finding_ico.msg_txt.text = "Sending Player Info...";
      }
      
      private function §>W§(param1:String = null) : void
      {
         mc.finding_ico.msg_txt.text = "Finding a Match...";
      }
      
      private function §,=§() : void
      {
         mc.finding_ico.msg_txt.text = "Waiting for opponent...";
      }
      
      private function §-P§() : void
      {
         mc.finding_ico.msg_txt.text = "Disconnected from the Game Server.";
         mc.finding_ico.throbber.stop();
         this.§1B§.removeEventListener(TimerEvent.TIMER,this.§>0§);
         this.§1B§.stop();
      }
      
      private function §2%§(param1:int, param2:int, param3:int) : void
      {
         new §^5§(PlayerFound).play();
         mc.finding_ico.msg_txt.text = "Match Found!";
         mc.cancel_btn.valid = false;
         §?V§.instance.profila.useEnergy(Balance.instance.ENERGY_COST_PER_GAME.value);
         this.hide();
         var _loc4_:Object = new Object();
         _loc4_.seed = param1;
         _loc4_.side = param2;
         _loc4_.mapNum = param3;
         §&K§.instance.§0A§.show(_loc4_);
      }
      
      private function §-V§() : void
      {
         §&K§.instance.§>1§.hide();
         this.§^T§();
      }
      
      private function §]%§() : void
      {
         §&K§.instance.§>1§.hide();
         this.hide();
         §&K§.instance.§?U§.show();
      }
      
      private function §>0§(param1:TimerEvent) : void
      {
         this.§!4§ += 1;
         mc.time_box.time_txt.text = this.§1F§(this.§!4§);
      }
      
      private function §1F§(param1:int) : String
      {
         var _loc2_:String = "";
         if(int(param1 / 3600) > 0)
         {
            _loc2_ += int(param1 / 3600) + ":";
         }
         var _loc3_:String = String(int(param1 / 60 % 60));
         if(_loc3_.length != 2)
         {
            _loc3_ = "0" + _loc3_;
         }
         _loc2_ += _loc3_ + ":";
         var _loc4_:String = String(int(param1 % 60));
         if(_loc4_.length != 2)
         {
            _loc4_ = "0" + _loc4_;
         }
         return _loc2_ + _loc4_;
      }
   }
}

