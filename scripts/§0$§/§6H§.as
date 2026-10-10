package §0$§
{
   import §>$§.§10§;
   import com.adobe.serialization.json.JSON;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.Timer;
   import game.Balance;
   import ninjakiwi.mynk.MyNK;
   import profile.Profile;
   import sound.§%'§;
   import sound.§^5§;
   
   public class §6H§
   {
      
      private var mc:MovieClip = null;
      
      private var profila:Profile = null;
      
      private var §66§:Timer = new Timer(1000);
      
      public function §6H§()
      {
         super();
      }
      
      public function §,B§(param1:MovieClip) : void
      {
         var mc:MovieClip = param1;
         this.mc = mc;
         var _temp_1:* = mc;
         mc.y = 0;
         _temp_1.x = 0;
         mc.visible = false;
         mc.energy_cover.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Battle Energy</font>\nGoverns how many matches can be played back to back. Recharges ? Energy every ? minutes.";
         mc.meds_cover.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Medallions</font>\nYour rewards for playing and winning. Used to unlock towers and Tier 4 abilities.";
         mc.score_cover.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Battle Score</font>\nYour score based on wins, losses, and challenge factors. Used for matchmaking and leaderboards.";
         mc.wins_cover.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Wins</font>\nThe number of battles you have won.";
         mc.losses_cover.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Losses</font>\nThe number of battles you have lost.";
         this.profila = §?V§.instance.profila;
         mc.medal_txt.text = "0";
         mc.score_txt.text = "0";
         mc.wins_txt.text = "0";
         mc.losses_txt.text = "0";
         this.profila.SigMedallionsChanged().add(this.§^8§);
         this.profila.SigBattleScoreChanged().add(this.§`2§);
         this.profila.SigWinsChanged().add(this.§5W§);
         this.profila.SigLossesChanged().add(this.§=<§);
         mc.soundEffects.tooltip = "Toggle sound effects on/off.";
         mc.soundEffects.click = function(param1:Event):*
         {
            §^5§.§]K§();
         };
         §^5§.§53§.add(function():*
         {
            mc.soundEffects.checked = !§^5§.§27§;
         });
         mc.music.tooltip = "Toggle music on/off.";
         mc.music.click = function(param1:Event):*
         {
            §%'§.§]K§();
         };
         §%'§.§9S§.add(function():*
         {
            mc.music.checked = !§%'§.§27§;
         });
         mc.connect_ico.gotoAndStop("Disconnected");
         mc.connect_cover.tooltip = "Disconnected from server.\nClick to try connecting";
         mc.connect_cover.valid = false;
         mc.connect_cover.click = this.§=+§;
         §10§.instance.§=4§.add(this.§0&§);
         §10§.instance.§"#§.add(this.§5X§);
         §10§.instance.§-6§.add(this.§5X§);
      }
      
      public function show() : void
      {
         this.mc.visible = true;
         this.§66§.addEventListener(TimerEvent.TIMER,this.§4M§);
         this.§66§.start();
         this.mc.energy_cover.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Battle Energy</font>\nGoverns how many matches can be played back to back. Recharges 1 Energy every " + this.§1F§(Balance.instance.ENERGY_REGEN_TIME.value) + " minutes.";
         this.§^8§(this.profila.medallions);
         this.§`2§(this.profila.battleScore);
         §10§.instance.§6O§.add(this.§6E§);
      }
      
      public function hide() : void
      {
         this.mc.visible = false;
         this.§66§.removeEventListener(TimerEvent.TIMER,this.§4M§);
         this.§66§.stop();
         §10§.instance.§6O§.remove(this.§6E§);
      }
      
      private function §^8§(param1:int) : void
      {
         this.mc.medal_txt.text = param1.toString();
      }
      
      private function §`2§(param1:int) : void
      {
         this.mc.score_txt.text = param1.toString();
      }
      
      private function §5W§(param1:int) : void
      {
         this.mc.wins_txt.text = param1.toString();
      }
      
      private function §=<§(param1:int) : void
      {
         this.mc.losses_txt.text = param1.toString();
      }
      
      private function §4M§(param1:TimerEvent) : void
      {
         this.mc.energy_txt.text = this.profila.currentEnergy.toString() + "/" + this.profila.maxEnergy.toString();
         var _loc2_:Number = this.profila.getSecondsUntilEnergyIncrement();
         if(_loc2_ == 0)
         {
            this.mc.energy_time_txt.text = "";
         }
         else
         {
            this.mc.energy_time_txt.text = this.§1F§(_loc2_ + 0.9);
         }
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
      
      private function §0&§() : void
      {
         this.mc.connect_ico.gotoAndStop("Connected");
         this.mc.connect_cover.tooltip = "Connected to the server";
         this.mc.connect_cover.valid = false;
      }
      
      private function §5X§() : void
      {
         this.mc.connect_ico.gotoAndStop("Disconnected");
         this.mc.connect_cover.tooltip = "Disconnected from server.\nClick to try connecting";
         this.mc.connect_cover.valid = true;
      }
      
      public function §=+§(param1:Event) : void
      {
         this.mc.connect_ico.gotoAndStop("Connecting");
         this.mc.connect_cover.tooltip = "Trying to connect to the server...";
         this.mc.connect_cover.valid = false;
         §10§.instance.connect();
      }
      
      public function §"M§() : void
      {
         var _loc1_:String = "https://mynk.ninjakiwi.com/get_multiplayer_data";
         _loc1_ += "?userid=" + MyNK.ey.user.id;
         _loc1_ += "&token=" + Math.random() * 10000;
         _loc1_ += "&dataset=Battles";
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener(Event.COMPLETE,this.§+1§);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.§3!§);
         _loc2_.load(new URLRequest(_loc1_));
      }
      
      private function §+1§(param1:Event) : void
      {
         var _loc2_:URLLoader = URLLoader(param1.target);
         _loc2_.removeEventListener(Event.COMPLETE,this.§+1§);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.§3!§);
         var _loc3_:Object = com.adobe.serialization.json.JSON.decode(_loc2_.data);
         if(_loc3_.data == "NONE")
         {
            this.profila.wins = 0;
            this.profila.losses = 0;
         }
         else
         {
            this.profila.wins = int(_loc3_.data.wins);
            this.profila.losses = int(_loc3_.data.losses);
         }
      }
      
      private function §3!§(param1:Event) : void
      {
      }
      
      private function §6E§() : void
      {
         §&K§.instance.§26§.show({
            "msg":"Your game version is out of date, please refresh your browser window to get the latest version.",
            "showBtn":false
         });
      }
   }
}

