package §0$§
{
   import §"?§.§2D§;
   import §"?§.§9X§;
   import §3@§.§7A§;
   import §>$§.§10§;
   import assets.sound.MusicTowerSelect;
   import assets.sound.PlayerFound;
   import assets.sound.PlayerReady;
   import display.ui.Button;
   import display.ui.CheckButton;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.system.System;
   import flash.utils.Timer;
   import game.§6$§;
   import game.Balance;
   import sound.§%'§;
   import sound.§^5§;
   
   public class §#7§ extends §`A§
   {
      
      private var §-#§:§%'§;
      
      private var §3P§:Boolean = false;
      
      private var §3?§:Boolean = false;
      
      private var §]J§:Boolean = false;
      
      private var §7!§:Boolean = false;
      
      private var §"D§:Boolean = false;
      
      private var §[@§:Number = 2;
      
      private var §&;§:int = 0;
      
      private var seed:int = 0;
      
      private var §5+§:§9X§ = null;
      
      private var §0%§:int = 0;
      
      private var playerPicker0:§7A§ = null;
      
      private var playerPicker1:§7A§ = null;
      
      private var opponentPicker0:§7A§ = null;
      
      private var opponentPicker1:§7A§ = null;
      
      private var readyBtn:CheckButton = null;
      
      private var randomBtn:Button = null;
      
      private var playerPicker:§7A§ = null;
      
      private var opponentPicker:§7A§ = null;
      
      private var opponentStatus:MovieClip = null;
      
      private var §2-§:Timer;
      
      public function §#7§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         this.§-#§ = new §%'§(MusicTowerSelect);
         this.playerPicker0 = new §7A§();
         this.playerPicker0.§,B§(mc.playerPicker0);
         this.playerPicker1 = new §7A§();
         this.playerPicker1.§,B§(mc.playerPicker1);
         this.opponentPicker0 = new §7A§();
         this.opponentPicker0.§,B§(mc.opponentPicker0,true);
         this.opponentPicker1 = new §7A§();
         this.opponentPicker1.§,B§(mc.opponentPicker1,true);
         mc.close_btn.click = this.§!B§;
         mc.prev_map.click = this.§<D§;
         mc.next_map.click = this.§#§;
         mc.mapPreview.click = this.§#§;
         mc.assault_chk.click = this.§2$§;
         mc.defend_chk.click = this.§'@§;
         mc.copyMatchID_mc.ok_btn.click = this.§6!§;
         mc.copyID_btn.click = this.§%3§;
         mc.copyMatchID_mc.clipBoard_btn.addEventListener(MouseEvent.CLICK,this.§%3§);
         mc.copyMatchID_mc.clipBoard_btn.buttonMode = true;
      }
      
      override public function show(param1:* = null) : void
      {
         this.§"D§ = false;
         this.§-#§.play();
         mc.close_btn.valid = true;
         while(mc.portraitHolder0.numChildren > 0)
         {
            mc.portraitHolder0.removeChildAt(0);
         }
         while(mc.portraitHolder1.numChildren > 0)
         {
            mc.portraitHolder1.removeChildAt(0);
         }
         this.§3P§ = false;
         this.§3?§ = false;
         this.§]J§ = false;
         this.§7!§ = false;
         this.§[@§ = 2;
         mc.assault_chk.checked = true;
         mc.defend_chk.checked = false;
         mc.copyID_btn.matchID_txt.text = param1.battleID;
         mc.copyMatchID_mc.matchID_txt.text = param1.battleID;
         this.§<N§();
         this.§&;§ = param1.side;
         if(this.§&;§ == 0)
         {
            this.§@R§();
            this.§25§();
         }
         else
         {
            this.§21§();
            this.§ F§();
         }
         this.opponentPicker.§2,§(false);
         this.§;6§(this.§0%§);
         mc.copyMatchID_mc.visible = this.§&;§ == 0;
         this.§2-§ = new Timer(5000,60 / 5 * 20);
         this.§2-§.addEventListener(TimerEvent.TIMER,this.§,8§);
         this.§2-§.start();
         super.show(param1);
      }
      
      private function §,8§(param1:Event) : void
      {
         §10§.instance.§[J§();
      }
      
      public function §!B§(param1:Event) : void
      {
         §10§.instance.§05§();
         this.§>9§();
         this.hide();
         §&K§.instance.§3E§.show();
      }
      
      private function §@R§() : void
      {
         var _loc2_:Loader = null;
         var _loc3_:LoaderContext = null;
         mc.readyBtn0.click = this.§&&§;
         mc.readyBtn0.checked = false;
         mc.readyBtn0.valid = false;
         mc.readyBtn0.visible = true;
         mc.readyBtn1.visible = false;
         mc.randomBtn0.click = this.§ K§;
         mc.randomBtn0.visible = true;
         mc.randomBtn0.valid = true;
         mc.randomBtn1.visible = false;
         mc.player_name0.text = §10§.instance.§=3§.name;
         mc.battlescore0.text = String(§10§.instance.§=3§.battleScore);
         mc.wins0.text = String(§10§.instance.§=3§.wins);
         mc.losses0.text = String(§10§.instance.§=3§.losses);
         var _loc1_:String = §10§.instance.§=3§.§9!§;
         if(_loc1_)
         {
            _loc2_ = new Loader();
            _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§;0§);
            _loc2_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§23§);
            _loc3_ = new LoaderContext();
            _loc3_.checkPolicyFile = true;
            _loc2_.load(new URLRequest(_loc1_),_loc3_);
         }
         mc.prev_map.valid = true;
         mc.next_map.valid = true;
         mc.mapPreview.valid = true;
         mc.assault_chk.valid = true;
         mc.defend_chk.valid = true;
         this.playerPicker0.reset();
         this.playerPicker0.setup(§?V§.instance.§+>§.§-4§());
         this.playerPicker0.§5H§.add(this.§+E§);
         this.playerPicker0.§2,§(true);
         this.playerPicker0.visible = true;
         this.playerPicker1.visible = false;
         this.readyBtn = mc.readyBtn0;
         this.randomBtn = mc.randomBtn0;
         this.playerPicker = this.playerPicker0;
      }
      
      private function §21§() : void
      {
         var _loc2_:Loader = null;
         var _loc3_:LoaderContext = null;
         mc.readyBtn1.click = this.§&&§;
         mc.readyBtn1.checked = false;
         mc.readyBtn1.valid = false;
         mc.readyBtn1.visible = true;
         mc.readyBtn0.visible = false;
         mc.randomBtn1.click = this.§ K§;
         mc.randomBtn1.visible = true;
         mc.randomBtn1.valid = true;
         mc.randomBtn0.visible = false;
         mc.player_name1.text = §10§.instance.§=3§.name;
         mc.battlescore1.text = String(§10§.instance.§=3§.battleScore);
         mc.wins1.text = String(§10§.instance.§=3§.wins);
         mc.losses1.text = String(§10§.instance.§=3§.losses);
         var _loc1_:String = §10§.instance.§=3§.§9!§;
         if(_loc1_)
         {
            _loc2_ = new Loader();
            _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§;0§);
            _loc2_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§23§);
            _loc3_ = new LoaderContext();
            _loc3_.checkPolicyFile = true;
            _loc2_.load(new URLRequest(_loc1_),_loc3_);
         }
         mc.prev_map.valid = false;
         mc.next_map.valid = false;
         mc.mapPreview.valid = false;
         mc.assault_chk.valid = false;
         mc.defend_chk.valid = false;
         this.playerPicker1.reset();
         this.playerPicker1.setup(§?V§.instance.§+>§.§-4§());
         this.playerPicker1.§5H§.add(this.§+E§);
         this.playerPicker1.§2,§(true);
         this.playerPicker1.visible = true;
         this.playerPicker0.visible = false;
         this.readyBtn = mc.readyBtn1;
         this.randomBtn = mc.randomBtn1;
         this.playerPicker = this.playerPicker1;
      }
      
      private function § F§() : void
      {
         var _loc1_:String = null;
         var _loc2_:Loader = null;
         var _loc3_:LoaderContext = null;
         mc.opponentStatus0.gotoAndStop("Waiting");
         mc.opponentStatus0.visible = true;
         mc.opponentStatus1.visible = false;
         if(§10§.instance.§?$§ != null && this.§"D§)
         {
            mc.player_name0.text = §10§.instance.§?$§.name;
            mc.battlescore0.text = String(§10§.instance.§?$§.battleScore);
            mc.wins0.text = String(§10§.instance.§?$§.wins);
            mc.losses0.text = String(§10§.instance.§?$§.losses);
            _loc1_ = §10§.instance.§?$§.§9!§;
            if(_loc1_)
            {
               _loc2_ = new Loader();
               _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§?-§);
               _loc2_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§23§);
               _loc3_ = new LoaderContext();
               _loc3_.checkPolicyFile = true;
               _loc2_.load(new URLRequest(_loc1_),_loc3_);
            }
         }
         else
         {
            mc.player_name0.text = "-";
            mc.battlescore0.text = "-";
            mc.wins0.text = "-";
            mc.losses0.text = "-";
         }
         this.opponentPicker0.reset();
         this.opponentPicker0.visible = true;
         this.opponentPicker1.visible = false;
         this.opponentPicker = this.opponentPicker0;
         this.opponentStatus = mc.opponentStatus0;
      }
      
      private function §25§() : void
      {
         var _loc1_:String = null;
         var _loc2_:Loader = null;
         var _loc3_:LoaderContext = null;
         mc.opponentStatus1.gotoAndStop("Waiting");
         mc.opponentStatus1.visible = true;
         mc.opponentStatus0.visible = false;
         if(§10§.instance.§?$§ != null && this.§"D§)
         {
            mc.player_name1.text = §10§.instance.§?$§.name;
            mc.battlescore1.text = String(§10§.instance.§?$§.battleScore);
            mc.wins1.text = String(§10§.instance.§?$§.wins);
            mc.losses1.text = String(§10§.instance.§?$§.losses);
            _loc1_ = §10§.instance.§?$§.§9!§;
            if(_loc1_)
            {
               _loc2_ = new Loader();
               _loc2_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§?-§);
               _loc2_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§23§);
               _loc3_ = new LoaderContext();
               _loc3_.checkPolicyFile = true;
               _loc2_.load(new URLRequest(_loc1_),_loc3_);
            }
         }
         else
         {
            mc.player_name1.text = "-";
            mc.battlescore1.text = "-";
            mc.wins1.text = "-";
            mc.losses1.text = "-";
         }
         this.opponentPicker1.reset();
         this.opponentPicker1.visible = true;
         this.opponentPicker0.visible = false;
         this.opponentPicker = this.opponentPicker1;
         this.opponentStatus = mc.opponentStatus1;
      }
      
      private function §;0§(param1:Event) : void
      {
         var _loc2_:Loader = LoaderInfo(param1.target).loader;
         _loc2_.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.§;0§);
         _loc2_.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.§23§);
         if(this.§&;§ == 0)
         {
            mc.portraitHolder0.addChild(_loc2_);
         }
         else
         {
            mc.portraitHolder1.addChild(_loc2_);
         }
      }
      
      private function §?-§(param1:Event) : void
      {
         var _loc2_:Loader = LoaderInfo(param1.target).loader;
         _loc2_.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.§?-§);
         _loc2_.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.§23§);
         if(this.§&;§ == 0)
         {
            mc.portraitHolder1.addChild(_loc2_);
         }
         else
         {
            mc.portraitHolder0.addChild(_loc2_);
         }
      }
      
      private function §23§(param1:Event) : void
      {
      }
      
      private function §<D§(param1:Event) : void
      {
         --this.§0%§;
         this.§;6§(this.§0%§);
         this.§5O§();
      }
      
      private function §#§(param1:Event) : void
      {
         ++this.§0%§;
         this.§;6§(this.§0%§);
         this.§5O§();
      }
      
      private function §;6§(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = §2D§.§<6§.length - 1;
         }
         else if(param1 >= §2D§.§<6§.length)
         {
            param1 = 0;
         }
         this.§0%§ = param1;
         this.§5+§ = §2D§.§<6§[param1];
         while(mc.mapPreview.holder_mc.numChildren > 0)
         {
            mc.mapPreview.holder_mc.removeChildAt(0);
         }
         var _loc2_:Bitmap = this.§5+§.§[E§;
         if(_loc2_ != null)
         {
            mc.mapPreview.holder_mc.addChild(_loc2_);
         }
         if(this.§&;§ == 0)
         {
            mc.mapPreview.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Current Map: " + this.§5+§.name + "</font>\nClick to change the current map.";
         }
         else
         {
            mc.mapPreview.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Current Map: " + this.§5+§.name + "</font>";
         }
      }
      
      override public function hide(param1:* = null) : void
      {
         this.playerPicker.§5H§.remove(this.§+E§);
         this.§=1§();
         this.§2-§.removeEventListener(TimerEvent.TIMER,this.§,8§);
         super.hide(param1);
      }
      
      private function §6!§(param1:Event) : void
      {
         mc.copyMatchID_mc.visible = false;
      }
      
      private function §2%§(param1:int, param2:int, param3:int) : void
      {
         this.seed = param1;
         this.§&;§ = param2;
         this.§"D§ = true;
         if(this.§&;§ == 0)
         {
            this.§25§();
            mc.mapPreview.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Current Map: " + this.§5+§.name + "</font>\nClick to change the current map.";
         }
         else
         {
            this.§ F§();
            mc.mapPreview.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Current Map: " + this.§5+§.name + "</font>";
         }
         this.opponentPicker.§2,§(true);
         this.opponentPicker.§?N§.add(this.§<#§);
         new §^5§(PlayerFound).play();
         if(this.§&;§ == 0)
         {
            this.§5O§();
         }
         this.§+E§();
      }
      
      private function §;2§() : void
      {
         §10§.instance.§05§();
      }
      
      public function §!W§() : void
      {
         §10§.instance.§<O§();
         §10§.instance.§05§();
      }
      
      private function §<N§() : void
      {
         §10§.instance.§>&§.add(this.§2%§);
         §10§.instance.§]S§.add(this.connected);
         §10§.instance.§;@§.add(this.disconnected);
         §10§.instance.§0@§.add(this.§!E§);
         §10§.instance.§!0§.add(this.§%4§);
         §10§.instance.§[K§.add(this.§>J§);
         §10§.instance.§2N§.add(this.§,<§);
         §10§.instance.§5D§.add(this.§04§);
         §10§.instance.§11§.add(this.§%#§);
         §10§.instance.§8>§.add(this.§>"§);
      }
      
      private function §=1§() : void
      {
         §10§.instance.§>&§.remove(this.§2%§);
         §10§.instance.§]S§.remove(this.connected);
         §10§.instance.§;@§.remove(this.disconnected);
         §10§.instance.§0@§.remove(this.§!E§);
         §10§.instance.§!0§.remove(this.§%4§);
         §10§.instance.§[K§.remove(this.§>J§);
         §10§.instance.§2N§.remove(this.§,<§);
         §10§.instance.§5D§.remove(this.§04§);
         §10§.instance.§11§.remove(this.§%#§);
         §10§.instance.§8>§.remove(this.§>"§);
      }
      
      private function connected() : void
      {
         §10§.instance.§%=§();
      }
      
      private function disconnected() : void
      {
         this.§;2§();
         this.§=1§();
         §&K§.instance.§^<§.show(§31§.§@1§);
      }
      
      private function §!E§() : void
      {
         this.§;2§();
         this.§=1§();
         §&K§.instance.§^<§.show(§31§.§'F§);
      }
      
      private function §%4§() : void
      {
         this.§;2§();
         this.§=1§();
         §&K§.instance.§^<§.show(§31§.§@+§);
      }
      
      private function §>J§(param1:Boolean) : void
      {
         this.§3?§ = param1;
         if(this.§3?§)
         {
            this.opponentStatus.gotoAndStop("Ready");
            new §^5§(PlayerReady).play();
         }
         else
         {
            this.opponentStatus.gotoAndStop("Waiting");
         }
         this.§08§();
      }
      
      private function §&&§(param1:Event) : void
      {
         this.§3P§ = !this.§3P§;
         this.readyBtn.checked = this.§3P§;
         this.readyBtn.valid = !this.§3P§;
         this.randomBtn.valid = !this.§3P§;
         this.playerPicker.§2,§(!this.§3P§);
         mc.prev_map.valid = !this.§3P§;
         mc.next_map.valid = !this.§3P§;
         mc.mapPreview.valid = !this.§3P§;
         mc.close_btn.valid = !this.§3P§;
         new §^5§(PlayerReady).play();
         §10§.instance.§7-§(this.§3P§);
         this.§08§();
      }
      
      private function §,<§() : void
      {
         this.§]J§ = true;
      }
      
      private function §08§() : void
      {
         if(this.§3?§ && this.§3P§)
         {
            this.§7!§ = true;
         }
      }
      
      private function §5O§() : void
      {
         if(!this.§"D§)
         {
            return;
         }
         if(this.§3?§ == true)
         {
            this.§>J§(false);
         }
         §10§.instance.§5O§(this.§5+§.id,§?V§.instance.§"0§.§`E§);
      }
      
      private function §04§(param1:String, param2:int) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < §2D§.§<6§.length)
         {
            if(§2D§.§<6§[_loc3_].id == param1)
            {
               this.§0%§ = _loc3_;
               this.§;6§(this.§0%§);
               break;
            }
            _loc3_++;
         }
         §?V§.instance.§"0§.§`E§ = param2;
         mc.assault_chk.checked = false;
         mc.defend_chk.checked = false;
         if(param2 == §6$§.§8!§)
         {
            mc.assault_chk.checked = true;
         }
         else if(param2 == §6$§.§5B§)
         {
            mc.defend_chk.checked = true;
         }
         if(this.§3P§ == true)
         {
            this.§&&§(null);
         }
      }
      
      public function §3I§() : void
      {
         this.hide();
         §&K§.instance.§;S§.show("Loading...");
         var _loc1_:Timer = new Timer(1000,1);
         _loc1_.addEventListener(TimerEvent.TIMER,this.§ "§);
         _loc1_.start();
      }
      
      private function § "§(param1:TimerEvent) : void
      {
         (param1.target as Timer).removeEventListener(TimerEvent.TIMER,this.§ "§);
         §?V§.instance.§"0§.§3J§(§6$§.§&§,this.seed,this.playerPicker.§2V§,this.§5+§);
      }
      
      private function §+E§() : void
      {
         this.readyBtn.valid = this.playerPicker.§2V§.length == this.playerPicker.§=O§ && this.§"D§ == true;
         this.§?+§();
      }
      
      private function §?+§() : void
      {
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < this.playerPicker.§2V§.length)
         {
            _loc1_ += this.playerPicker.§2V§[_loc2_].id;
            if(_loc2_ + 1 != this.playerPicker.§2V§.length)
            {
               _loc1_ += ":";
            }
            _loc2_++;
         }
         §10§.instance.§+I§(_loc1_);
      }
      
      private function §%#§(param1:Array) : void
      {
         if(this.opponentPicker.§^4§ == true)
         {
            this.opponentPicker.§?@§(param1);
         }
      }
      
      private function §>"§() : void
      {
         this.§?+§();
      }
      
      private function §<#§() : void
      {
         §10§.instance.§]=§();
      }
      
      private function § K§(param1:Event) : void
      {
         this.playerPicker.§^A§(null);
         this.playerPicker.§8Q§(this.§5+§.§<9§);
      }
      
      override public function process(param1:Number) : void
      {
         if(this.§7!§)
         {
            this.§[@§ -= param1;
            if(this.§[@§ <= 0)
            {
               if(this.§]J§)
               {
                  this.§3I§();
               }
               else
               {
                  §&K§.instance.§;S§.show("Loading Balance Data...");
               }
            }
         }
      }
      
      private function §2$§(param1:Event) : void
      {
         mc.defend_chk.checked = !mc.assault_chk.checked;
         if(mc.assault_chk.checked == true)
         {
            §?V§.instance.§"0§.§`E§ = §6$§.§8!§;
         }
         else
         {
            §?V§.instance.§"0§.§`E§ = §6$§.§5B§;
         }
         this.§5O§();
      }
      
      private function §'@§(param1:Event) : void
      {
         mc.assault_chk.checked = !mc.defend_chk.checked;
         if(mc.assault_chk.checked == true)
         {
            §?V§.instance.§"0§.§`E§ = §6$§.§8!§;
         }
         else
         {
            §?V§.instance.§"0§.§`E§ = §6$§.§5B§;
         }
         this.§5O§();
      }
      
      private function §%3§(param1:Event) : void
      {
         System.setClipboard(mc.copyMatchID_mc.matchID_txt.text);
         mc.copyMatchID_mc.clipBoard_btn.gotoAndPlay("Confirm");
      }
      
      public function §>9§() : void
      {
         var _loc1_:int = 0;
         if(this.playerPicker.§7S§)
         {
            _loc1_ += Balance.instance.ENERGY_COST_EXTRA_TOWER.value;
         }
         §?V§.instance.profila.addEnergy(_loc1_);
      }
   }
}

