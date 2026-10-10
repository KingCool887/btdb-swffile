package §0$§
{
   import §"?§.§2D§;
   import §"?§.§9X§;
   import §3@§.§7A§;
   import §>$§.§10§;
   import assets.sound.MusicTowerSelect;
   import assets.sound.PlayerReady;
   import assets.sound.Tick;
   import assets.sound.TimeOut;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.Timer;
   import game.§6$§;
   import game.Balance;
   import sound.§%'§;
   import sound.§^5§;
   
   public class §@%§ extends §`A§
   {
      
      private var §-#§:§%'§;
      
      private var §3P§:Boolean = false;
      
      private var §3?§:Boolean = false;
      
      private var §]J§:Boolean = false;
      
      private var §&;§:int = 0;
      
      private var §!&§:int = 0;
      
      private var seed:int = 0;
      
      private var §5+§:§9X§ = null;
      
      private var opponentPicker:§7A§ = null;
      
      private var playerPicker:§7A§ = null;
      
      private var §6,§:Number = 0;
      
      private var §5-§:Boolean = true;
      
      internal var §=%§:Boolean = false;
      
      public function §@%§()
      {
         super();
      }
      
      override public function §,B§(param1:MovieClip) : void
      {
         super.§,B§(param1);
         this.§-#§ = new §%'§(MusicTowerSelect);
         this.playerPicker = new §7A§();
         this.playerPicker.§,B§(mc.playerPicker);
         this.opponentPicker = new §7A§();
         this.opponentPicker.§,B§(mc.opponentPicker,true);
         mc.readyBtn.click = this.§&&§;
         mc.randomBtn.click = this.§ K§;
      }
      
      override public function show(param1:* = null) : void
      {
         super.show(param1);
         this.§-#§.play();
         this.§3P§ = false;
         this.§3?§ = false;
         this.§]J§ = false;
         this.§=%§ = false;
         mc.opponentStatus.gotoAndStop("Waiting");
         mc.readyBtn.checked = false;
         mc.readyBtn.valid = false;
         mc.randomBtn.valid = true;
         this.§<N§();
         §10§.instance.§%=§();
         while(mc.portraitHolder0.numChildren > 0)
         {
            mc.portraitHolder0.removeChildAt(0);
         }
         while(mc.portraitHolder1.numChildren > 0)
         {
            mc.portraitHolder1.removeChildAt(0);
         }
         this.seed = param1.seed;
         this.§5+§ = §2D§.§<6§[param1.mapNum];
         this.§!&§ = §10§.instance.§?$§.side;
         this.§&;§ = §10§.instance.§=3§.side;
         §10§.instance.§?$§.§6Q§();
         §10§.instance.§=3§.§6Q§();
         if(this.§&;§ == 0)
         {
            mc.player_name0.text = §10§.instance.§=3§.name;
            mc.player_name1.text = §10§.instance.§?$§.name;
            mc.battlescore0.text = String(§10§.instance.§=3§.battleScore);
            mc.battlescore1.text = String(§10§.instance.§?$§.battleScore);
            mc.wins0.text = String(§10§.instance.§=3§.wins);
            mc.wins1.text = String(§10§.instance.§?$§.wins);
            mc.losses0.text = String(§10§.instance.§=3§.losses);
            mc.losses1.text = String(§10§.instance.§?$§.losses);
            mc.playerPicker.x = 24;
            mc.readyBtn.x = 23;
            mc.randomBtn.x = 240;
            mc.opponentPicker.x = 404;
            mc.opponentStatus.x = 585;
         }
         else
         {
            mc.player_name1.text = §10§.instance.§=3§.name;
            mc.player_name0.text = §10§.instance.§?$§.name;
            mc.battlescore1.text = String(§10§.instance.§=3§.battleScore);
            mc.battlescore0.text = String(§10§.instance.§?$§.battleScore);
            mc.wins1.text = String(§10§.instance.§=3§.wins);
            mc.wins0.text = String(§10§.instance.§?$§.wins);
            mc.losses1.text = String(§10§.instance.§=3§.losses);
            mc.losses0.text = String(§10§.instance.§?$§.losses);
            mc.playerPicker.x = 404;
            mc.readyBtn.x = 403;
            mc.randomBtn.x = 621;
            mc.opponentPicker.x = 24;
            mc.opponentStatus.x = 205;
         }
         this.§8B§();
         this.playerPicker.reset();
         this.playerPicker.setup(§?V§.instance.§+>§.§-4§());
         this.playerPicker.§5H§.add(this.§+E§);
         this.playerPicker.§2,§(true);
         this.opponentPicker.reset();
         this.opponentPicker.§?N§.add(this.§<#§);
         while(mc.mapPreview.holder_mc.numChildren > 0)
         {
            mc.mapPreview.holder_mc.removeChildAt(0);
         }
         mc.mapPreview.holder_mc.addChild(this.§5+§.§[E§);
         mc.mapPreview.tooltip = this.§5+§.name;
         this.§6,§ = Balance.instance.PREMATCH_SCREEN_TIME.value;
         this.§5-§ = false;
         §?V§.instance.profila.createBattleHistory(§10§.instance.§?$§.id,§10§.instance.§?$§.battleScore);
      }
      
      private function §8B§() : void
      {
         var _loc3_:Loader = null;
         var _loc4_:LoaderContext = null;
         var _loc1_:String = §10§.instance.§=3§.§9!§;
         var _loc2_:String = §10§.instance.§?$§.§9!§;
         if(_loc1_)
         {
            _loc3_ = new Loader();
            _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§;0§);
            _loc3_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§23§);
            _loc4_ = new LoaderContext();
            _loc4_.checkPolicyFile = true;
            _loc3_.load(new URLRequest(_loc1_),_loc4_);
         }
         if(_loc2_)
         {
            _loc3_ = new Loader();
            _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§?-§);
            _loc3_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.§23§);
            _loc4_ = new LoaderContext();
            _loc4_.checkPolicyFile = true;
            _loc3_.load(new URLRequest(_loc2_),_loc4_);
         }
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
      
      override public function hide(param1:* = null) : void
      {
         this.playerPicker.§5H§.remove(this.§+E§);
         this.§=1§();
         super.hide(param1);
      }
      
      private function §;2§() : void
      {
         §10§.instance.§05§();
      }
      
      private function §<N§() : void
      {
         §10§.instance.§;@§.add(this.disconnected);
         §10§.instance.§0@§.add(this.§!E§);
         §10§.instance.§!0§.add(this.§%4§);
         §10§.instance.§[K§.add(this.§>J§);
         §10§.instance.§2N§.add(this.§,<§);
         §10§.instance.§11§.add(this.§%#§);
         §10§.instance.§8>§.add(this.§>"§);
      }
      
      private function §=1§() : void
      {
         §10§.instance.§;@§.remove(this.disconnected);
         §10§.instance.§0@§.remove(this.§!E§);
         §10§.instance.§!0§.remove(this.§%4§);
         §10§.instance.§[K§.remove(this.§>J§);
         §10§.instance.§2N§.remove(this.§,<§);
         §10§.instance.§11§.remove(this.§%#§);
         §10§.instance.§8>§.remove(this.§>"§);
      }
      
      private function disconnected() : void
      {
         §?V§.instance.profila.modBattleHistoryWL(false);
         this.§;2§();
         this.§=1§();
         §&K§.instance.§^<§.show(§31§.§!H§);
      }
      
      public function §!W§() : void
      {
         §?V§.instance.profila.modBattleHistoryWL(false);
         §10§.instance.§<O§();
         §10§.instance.§05§();
      }
      
      private function §!E§() : void
      {
         §?V§.instance.profila.modBattleHistoryWL(true);
         this.§;2§();
         this.§=1§();
         §&K§.instance.§^<§.show(§31§.§%C§);
      }
      
      private function §%4§() : void
      {
         §?V§.instance.profila.modBattleHistoryWL(true);
         this.§;2§();
         this.§=1§();
         §&K§.instance.§^<§.show(§31§.§9J§);
      }
      
      private function §>J§(param1:Boolean) : void
      {
         this.§3?§ = param1;
         if(this.§3?§)
         {
            mc.opponentStatus.gotoAndStop("Ready");
         }
         else
         {
            mc.opponentStatus.gotoAndStop("Waiting");
         }
         new §^5§(PlayerReady).play();
         this.§08§();
      }
      
      private function §&&§(param1:Event) : void
      {
         this.§3P§ = true;
         mc.readyBtn.checked = this.§3P§;
         mc.readyBtn.valid = !this.§3P§;
         mc.randomBtn.valid = !this.§3P§;
         this.playerPicker.§2,§(!this.§3P§);
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
            this.§6,§ = 0;
         }
      }
      
      public function §3I§() : void
      {
         §?V§.instance.profila.modBattleHistoryRL(this.§=%§);
         this.hide();
         §&K§.instance.§;S§.show("Loading...");
         var _loc1_:Timer = new Timer(1000,1);
         _loc1_.addEventListener(TimerEvent.TIMER,this.§ "§);
         _loc1_.start();
      }
      
      private function § "§(param1:TimerEvent) : void
      {
         (param1.target as Timer).removeEventListener(TimerEvent.TIMER,this.§ "§);
         §?V§.instance.§"0§.§3J§(§6$§.§>;§,this.seed,this.playerPicker.§2V§,this.§5+§);
      }
      
      private function §+E§() : void
      {
         mc.readyBtn.valid = this.playerPicker.§2V§.length == this.playerPicker.§=O§;
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
         this.§=%§ = true;
         this.§&&§(null);
      }
      
      override public function process(param1:Number) : void
      {
         var _loc2_:Number = this.§6,§;
         this.§6,§ -= param1;
         if(this.§6,§ <= 0 && !this.§5-§)
         {
            mc.readyBtn.valid = false;
            mc.randomBtn.valid = false;
            this.playerPicker.§2,§(false);
            this.§5-§ = true;
            if(this.§=%§ == false)
            {
               this.§=%§ = !this.playerPicker.§ C§();
               this.playerPicker.§8Q§(this.§5+§.§<9§);
            }
         }
         if(this.§6,§ <= -2)
         {
            if(this.§]J§)
            {
               this.§3I§();
            }
            else
            {
               §&K§.instance.§;S§.show("Loading Balance Info...");
            }
         }
         if(_loc2_ >= 5 && this.§6,§ < 5)
         {
            new §^5§(Tick).play();
         }
         else if(_loc2_ >= 4 && this.§6,§ < 4)
         {
            new §^5§(Tick).play();
         }
         else if(_loc2_ >= 3 && this.§6,§ < 3)
         {
            new §^5§(Tick).play();
         }
         else if(_loc2_ >= 2 && this.§6,§ < 2)
         {
            new §^5§(Tick).play();
         }
         else if(_loc2_ >= 1 && this.§6,§ < 1)
         {
            new §^5§(Tick).play();
         }
         else if(_loc2_ >= 0 && this.§6,§ < 0)
         {
            new §^5§(TimeOut).play();
         }
         var _loc3_:Number = this.§6,§;
         if(_loc3_ <= 0)
         {
            _loc3_ = 0;
         }
         mc.pickTimeTxt.text = String(Math.ceil(_loc3_));
      }
      
      public function §>9§() : void
      {
         var _loc1_:int = Balance.instance.ENERGY_COST_PER_GAME.value;
         if(this.playerPicker.§^4§)
         {
            _loc1_ += Balance.instance.ENERGY_COST_SPY.value;
         }
         if(this.playerPicker.§7S§)
         {
            _loc1_ += Balance.instance.ENERGY_COST_EXTRA_TOWER.value;
         }
         §?V§.instance.profila.addEnergy(_loc1_);
      }
   }
}

