package §8K§
{
   import §0$§.§&K§;
   import §3S§.§,-§;
   import §3S§.§,O§;
   import §3S§.§-"§;
   import §3S§.§<Y§;
   import §3S§.§^-§;
   import §8U§.§52§;
   import §>$§.§10§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import assets.effects.Select;
   import assets.effects.SelectedEffect;
   import assets.gui.InGameUI;
   import assets.sound.NewRound;
   import entities.§5F§;
   import events.LevelEvent;
   import events.TowerChangedEvent;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import game.§6$§;
   import game.Balance;
   import ninjakiwi.mynk.MyNK;
   import profile.Profile;
   import sound.§%'§;
   import sound.§^5§;
   import state.§01§;
   import towers.Tower;
   import towers.behavior.roundStart.BananaEmitter;
   import towers.def.TowerDef;
   import utils.§+7§;
   import weapons.FireAtReticle;
   
   public class §!<§ extends MovieClip
   {
      
      public static var §,F§:String = "#4444FF";
      
      public static var §%A§:String = "#FF4444";
      
      public static var §@B§:String = "#FFFFFF";
      
      public var instance:§!<§ = null;
      
      public var mc:InGameUI = null;
      
      public var §"0§:§6$§;
      
      public var §!,§:Profile;
      
      public var range:§0"§ = null;
      
      public var §33§:§0"§ = null;
      
      public var §;O§:§9O§ = null;
      
      public var §&Y§:§9O§ = null;
      
      public var §4R§:§01§;
      
      public var §+%§:§-"§ = null;
      
      public var §-I§:§^-§ = null;
      
      public var §@J§:§,-§ = null;
      
      public var §@!§:§,O§ = null;
      
      public var §,"§:§98§;
      
      public var §-,§:§#G§;
      
      public var incomeBoostMenu:§`N§;
      
      public var §]1§:§5F§;
      
      public var §;H§:§5F§;
      
      public var §%+§:§@<§;
      
      private var bloonSendBar:§`P§;
      
      private var playerDisplay:MovieClip = null;
      
      private var §[6§:MovieClip = null;
      
      private var subMenu:MovieClip = null;
      
      public var §7>§:InGameChatBox;
      
      private var § V§:Timer;
      
      public var §9#§:Boolean = false;
      
      public var §8<§:Boolean = false;
      
      public var §37§:§<<§;
      
      private const §4C§:Rectangle;
      
      public const §1&§:Rectangle;
      
      public const §5$§:Rectangle;
      
      public var §@3§:Rectangle;
      
      public var §95§:Rectangle;
      
      private var §44§:Boolean = false;
      
      public function §!<§()
      {
         this.§"0§ = §?V§.instance.§"0§;
         this.§!,§ = §?V§.instance.profila;
         this.§4R§ = new §01§();
         this.§]1§ = new §5F§(Select);
         this.§;H§ = new §5F§(SelectedEffect);
         this.§%+§ = new §@<§();
         this.bloonSendBar = new §`P§();
         this.§7>§ = new InGameChatBox();
         this.§37§ = §-A§.§]H§(0.7);
         this.§4C§ = new Rectangle(0,500,800,100);
         this.§1&§ = new Rectangle(0,25,390,475);
         this.§5$§ = new Rectangle(410,25,390,475);
         this.§@3§ = this.§1&§;
         this.§95§ = this.§5$§;
         super();
         this.instance = this;
         this.mc = new InGameUI();
         addChild(this.mc);
         this.§[6§ = this.mc.topBar.waveCounter;
         this.§[6§.mouseEnabled = false;
         this.§[6§.mouseChildren = false;
         this.subMenu = this.mc.bottomPannel.subMenu;
         this.playerDisplay = this.mc.topBar.playerDisplay;
         this.§,"§ = new §98§();
         this.§,"§.§,B§(this.mc.bottomPannel.buildPanel.towerBuild);
         this.§-,§ = new §#G§();
         this.§-,§.§,B§(this.mc.bottomPannel.buildPanel.bloonsSend);
         this.incomeBoostMenu = new §`N§();
         this.incomeBoostMenu.§,B§(this.mc.bottomPannel.buildPanel.incomeBoostMenu);
         this.mc.invalid.alpha = 0;
         this.mc.invalid.visible = false;
         this.§%+§.§,B§(this.mc.bottomPannel.abilityContainer);
         this.bloonSendBar.§,B§(this.mc.bottomPannel.bloonSendBar);
         this.§7>§.§,B§(this.mc.§^7§);
         this.§7>§.mc.muteChat1.addEventListener(MouseEvent.CLICK,this.§[F§);
         this.§-I§ = new §^-§(this);
         this.§@J§ = new §,-§(this);
         this.§@!§ = new §,O§(this);
         this.§+%§ = new §-"§(this);
         this.§"0§.addEventListener(LevelEvent.ROUND_OVER,this.roundOver);
         this.§"0§.addEventListener(LevelEvent.ROUND_START,this.roundStart);
         this.mc.bottomPannel.cancel_btn.visible = false;
         this.mc.bottomPannel.cancel_btn.click = function(param1:MouseEvent):void
         {
            §4R§.message(new §<Y§(§<Y§.§@P§));
         };
         this.subMenu.surrender.tooltip = "Surrender this Battle.";
         this.subMenu.surrender.click = function(param1:Event):void
         {
            §&K§.instance.§>1§.show({
               "yesFunction":§24§,
               "msg":"Are you sure you want to surrender this battle?"
            });
         };
         this.subMenu.soundEffects.tooltip = "Toggle sound effects on/off.";
         this.subMenu.soundEffects.click = function(param1:Event):void
         {
            §^5§.§]K§();
         };
         §^5§.§53§.add(function():void
         {
            subMenu.soundEffects.checked = !§^5§.§27§;
         });
         this.subMenu.music.tooltip = "Toggle music on/off.";
         this.subMenu.music.click = function(param1:Event):void
         {
            §%'§.§]K§();
         };
         §%'§.§9S§.add(function():void
         {
            subMenu.music.checked = !§%'§.§27§;
         });
      }
      
      private function §24§() : void
      {
         §&K§.instance.§>1§.hide();
         this.§"0§.§24§();
      }
      
      public function §3I§(param1:Vector.<§ E§>) : void
      {
         this.§44§ = false;
         this.§4R§.§^W§(this.§+%§,null);
         this.§=$§(true);
         this.§"0§.§-W§.addEventListener("TOWER_ADDED",this.§5J§);
         this.§"0§.§-W§.addEventListener("TOWER_REMOVED",this.§>U§);
         this.§[6§.wave_mc.wave_txt.text = "-";
         this.§?M§(this.§"0§.§8§.§#+§.value);
         this.§<%§(this.§"0§.§&M§.§#+§.value);
         this.§"0§.§8§.§<A§.add(this.§?M§);
         this.§"0§.§&M§.§<A§.add(this.§<%§);
         this.§,"§.§3I§(param1);
         if(this.§"0§.§`E§ == §6$§.§8!§)
         {
            this.§-,§.§3I§();
            this.§-,§.visible = true;
            this.incomeBoostMenu.visible = false;
         }
         else if(this.§"0§.§`E§ == §6$§.§5B§)
         {
            this.incomeBoostMenu.§3I§();
            this.incomeBoostMenu.visible = true;
            this.§-,§.visible = false;
         }
         this.range = new §0"§();
         this.§33§ = new §0"§();
         this.range.visible = false;
         this.§33§.visible = false;
         this.§"0§.§-W§.§?3§(this.§]1§);
         this.subMenu.cash.label_txt.text = int(this.§"0§.§-W§.cash.value).toString();
         this.§"0§.§-W§.addEventListener(LevelEvent.CASH_CHANGE,this.§93§);
         this.§0N§(this.§"0§.§#3§.value);
         this.§"0§.§7$§.add(this.§0N§);
         this.playerDisplay.left_player_txt.text = §10§.instance.§?1§.name;
         this.playerDisplay.right_player_txt.text = §10§.instance.§2K§.name;
         this.§%+§.§6+§(this.§"0§.§-W§.§?0§);
         this.bloonSendBar.§3I§(this.§"0§.§9@§);
         if(§10§.instance.§=3§.side == 0)
         {
            this.§@3§ = this.§1&§;
            this.§95§ = this.§5$§;
            this.§%+§.x = 0;
            this.mc.bottomPannel.cancel_btn.x = 210;
            this.§,"§.x = 29;
            this.§-,§.x = 471;
            this.incomeBoostMenu.x = 470;
            this.bloonSendBar.x = 410;
         }
         else
         {
            this.§@3§ = this.§5$§;
            this.§95§ = this.§1&§;
            this.§%+§.x = 410;
            this.mc.bottomPannel.cancel_btn.x = 654;
            this.§,"§.x = 471;
            this.§-,§.x = 29;
            this.incomeBoostMenu.x = 28;
            this.bloonSendBar.x = 0;
         }
         this.mc.invalid.x = this.§95§.x;
         this.§ V§ = new Timer(1000);
         this.§ V§.addEventListener(TimerEvent.TIMER,this.§16§);
         this.§ V§.start();
         this.mc.invalid.alpha = 0;
         this.mc.invalid.visible = false;
         this.mc.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.§;B§);
         this.§7>§.§"J§(MyNK.ey.user.name,§,F§);
         this.§7>§.visible = true;
         this.§7>§.reset();
      }
      
      public function §<E§() : void
      {
         if(this.§44§)
         {
            return;
         }
         this.§44§ = true;
         BananaEmitter.clear();
         this.§=$§(false);
         this.§"0§.§-W§.removeEventListener("TOWER_ADDED",this.§5J§);
         this.§"0§.§-W§.removeEventListener("TOWER_REMOVED",this.§>U§);
         this.§"0§.§8§.§<A§.remove(this.§?M§);
         this.§"0§.§&M§.§<A§.remove(this.§<%§);
         this.§"0§.§-W§.removeEventListener(LevelEvent.CASH_CHANGE,this.§93§);
         this.§"0§.§7$§.remove(this.§0N§);
         this.§,"§.§<E§();
         this.§-,§.§<E§();
         if(this.§"0§.§`E§ == §6$§.§8!§)
         {
            this.§-,§.§<E§();
         }
         else if(this.§"0§.§`E§ == §6$§.§5B§)
         {
            this.incomeBoostMenu.§<E§();
         }
         this.§%+§.reset();
         this.bloonSendBar.§<E§();
         this.§4R§.§>+§.exit();
         this.§ V§.removeEventListener(TimerEvent.TIMER,this.§16§);
         this.mc.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.§;B§);
         this.§7>§.§!C§();
      }
      
      public function process(param1:Number) : void
      {
         this.§%+§.§4M§();
         if(this.§8<§)
         {
            this.mc.invalid.visible = true;
            this.mc.invalid.alpha += 0.066;
            if(this.mc.invalid.alpha > 1)
            {
               this.mc.invalid.alpha = 1;
            }
         }
         else if(this.mc.invalid.visible == true)
         {
            this.mc.invalid.alpha -= 0.066;
            if(this.mc.invalid.alpha < 0)
            {
               this.mc.invalid.alpha = 0;
               this.mc.invalid.visible = false;
            }
         }
         if(this.§"0§.§`E§ == §6$§.§5B§)
         {
            this.incomeBoostMenu.process(param1);
         }
         this.§7>§.process(param1);
      }
      
      public function §16§(param1:Event) : *
      {
         var _loc2_:Number = this.§"0§.§`;§() - Balance.instance.FIRST_ROUND_START_TIME.value;
         if(_loc2_ < 0)
         {
            _loc2_ -= 0.999999;
         }
         this.subMenu.timer_txt.text = this.§1F§(Math.abs(_loc2_));
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
      
      private function §93§(param1:Event) : void
      {
         this.subMenu.cash.label_txt.text = int(this.§"0§.§-W§.cash.value).toString();
         this.subMenu.ticker_txt.text = "+" + int(this.§"0§.§#3§.value).toString();
         if(this.§"0§.§`E§ == §6$§.§8!§)
         {
            this.subMenu.money_cover.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Current Cash: $" + int(this.§"0§.§-W§.cash.value).toString() + "</font>" + "\nCurrent Income: $" + this.§"0§.§#3§.value.toFixed(0) + " every " + Balance.instance.GIVE_CASH_TIME.value + " seconds." + "\nYou can increase your income by sending bloons at your opponent.";
         }
         else if(this.§"0§.§`E§ == §6$§.§5B§)
         {
            this.subMenu.money_cover.tooltip = "<font color=\'#E0CDB6\' face=\'Oetztype\'>Current Cash: $" + int(this.§"0§.§-W§.cash.value).toString() + "</font>" + "\nCurrent Income: $" + this.§"0§.§#3§.value.toFixed(0) + " every " + Balance.instance.GIVE_CASH_TIME.value + " seconds." + "\nYou can increase your income by purchasing income boosters.";
         }
      }
      
      private function §0N§(param1:Number) : void
      {
         this.§93§(null);
      }
      
      private function §?M§(param1:int) : void
      {
         this.playerDisplay.leftHealthBar.gotoAndPlay(1);
         this.playerDisplay.leftHealthBar.inner.scaleX = param1 / Balance.instance.STARTING_HEALTH.value;
         this.playerDisplay.leftHealthBar.masky.scaleX = param1 / Balance.instance.STARTING_HEALTH.value;
         this.playerDisplay.left_label_txt.text = param1.toString();
      }
      
      private function §<%§(param1:int) : void
      {
         this.playerDisplay.rightHealthBar.gotoAndPlay(1);
         this.playerDisplay.rightHealthBar.inner.scaleX = param1 / Balance.instance.STARTING_HEALTH.value;
         this.playerDisplay.rightHealthBar.masky.scaleX = param1 / Balance.instance.STARTING_HEALTH.value;
         this.playerDisplay.right_label_txt.text = param1.toString();
      }
      
      private function §5J§(param1:TowerChangedEvent) : void
      {
         this.§%+§.addTower(param1.tower);
      }
      
      private function §>U§(param1:TowerChangedEvent) : void
      {
         this.§%+§.removeTower(param1.tower);
      }
      
      public function §=$§(param1:Boolean) : void
      {
         this.mc.mouseEnabled = param1;
         this.mc.mouseChildren = param1;
         if(param1)
         {
            §?V§.instance.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§;§);
            §?V§.instance.stage.addEventListener(KeyboardEvent.KEY_UP,this.§#B§);
         }
         else
         {
            §?V§.instance.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§;§);
            §?V§.instance.stage.addEventListener(KeyboardEvent.KEY_UP,this.§#B§);
            if(this.§4R§.§>+§ == this.§@J§)
            {
               this.§@J§.exit();
            }
         }
      }
      
      private function roundStart(param1:Event) : void
      {
         this.§[6§.wave_mc.wave_txt.text = this.§"0§.§+O§ + 1;
         this.§[6§.gotoAndPlay("Animate");
         new §^5§(NewRound).play();
      }
      
      private function roundOver(param1:Event) : void
      {
      }
      
      public function §#B§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 16)
         {
            this.§9#§ = false;
         }
      }
      
      public function §;§(param1:KeyboardEvent) : void
      {
         var _loc2_:String = null;
         if(param1.keyCode == 16)
         {
            this.§9#§ = true;
         }
         if(param1.keyCode == 13)
         {
            if(this.§7>§.§'Q§ == false)
            {
               this.§4R§.message(new §<Y§(§<Y§.§@P§));
               this.§7>§.§""§();
            }
            else
            {
               this.§7>§.close();
               if(!this.§7>§.§"9§)
               {
                  _loc2_ = this.§7>§.§0R§();
                  if(_loc2_ != "")
                  {
                     if(_loc2_ == "-ping" || _loc2_ == "/ping")
                     {
                        this.§7>§.§2!§(int(§?V§.instance.§"0§.§,;§ * 1000 / 2).toString() + "ms","Ping",§@B§);
                     }
                     else if(this.§7>§.§"S§)
                     {
                        this.§7>§.§2!§("Your opponent has muted you.","MSG:",§@B§);
                     }
                     else
                     {
                        _loc2_ = §+7§.§?W§(_loc2_);
                        this.§7>§.§2!§(_loc2_,MyNK.ey.user.name,§,F§);
                        §10§.instance.§!;§(_loc2_);
                     }
                  }
               }
            }
         }
         if(param1.keyCode == 119)
         {
            this.§"0§.§-W§.§4>§(100000);
         }
         if(param1.keyCode == 27)
         {
            if(this.§7>§.§'Q§)
            {
               this.§7>§.close();
            }
            this.§4R§.message(new §<Y§(§<Y§.§@P§));
         }
      }
      
      public function §,U§(param1:TowerDef) : Boolean
      {
         if(param1.id == "RoadSpikes" || param1.id == "ExplodingPineapple")
         {
            return false;
         }
         return true;
      }
      
      public function cancel() : *
      {
         this.§4R§.message(new §<Y§(§<Y§.§@P§));
      }
      
      public function §+R§(param1:§ E§) : *
      {
         this.cancel();
         this.mc.addEventListener(MouseEvent.CLICK,this.§2F§,true);
         var _loc2_:§<Y§ = new §<Y§(§<Y§.§`J§);
         _loc2_.towerPickerDef = param1;
         this.§4R§.message(_loc2_);
      }
      
      public function §7&§(param1:Tower) : void
      {
         this.mc.removeEventListener(MouseEvent.CLICK,this.§2F§,true);
         var _loc2_:§<Y§ = new §<Y§(§<Y§.§@>§);
         _loc2_.tower = param1;
         this.§4R§.message(_loc2_);
      }
      
      public function §2O§() : void
      {
         this.mc.removeEventListener(MouseEvent.CLICK,this.§2F§,true);
      }
      
      private function §2F§(param1:MouseEvent) : void
      {
         var _loc2_:Number = §?V§.instance.mouseX;
         var _loc3_:Number = §?V§.instance.mouseY;
         if(this.§4C§.containsPoint(new Point(_loc2_,_loc3_)))
         {
            this.cancel();
         }
      }
      
      private function §;B§(param1:MouseEvent) : void
      {
         var _loc2_:Number = §?V§.instance.mouseX;
         var _loc3_:Number = §?V§.instance.mouseY;
         if(this.§4R§.§>+§ == this.§-I§ && this.§95§.containsPoint(new Point(_loc2_,_loc3_)))
         {
            this.§8<§ = true;
         }
         else
         {
            this.§8<§ = false;
         }
      }
      
      public function §"=§() : Boolean
      {
         return this.§@3§.containsPoint(new Point(§?V§.instance.mouseX,§?V§.instance.mouseY));
      }
      
      public function §6=§() : Boolean
      {
         return this.§4C§.containsPoint(new Point(§?V§.instance.mouseX,§?V§.instance.mouseY));
      }
      
      public function §%2§(param1:Tower) : void
      {
         var _loc2_:§52§ = null;
         if(this.§;O§)
         {
            this.§;O§.destroy();
         }
         if(this.§&Y§)
         {
            this.§&Y§.destroy();
         }
         if(param1.targetingSystem == TowerDef.TARGETS_RETICLE)
         {
            _loc2_ = FireAtReticle.GetLocation(param1);
            this.§;O§ = new §9O§();
            this.§;O§.initialise(param1,true);
            this.§;O§.x = _loc2_.x;
            this.§;O§.y = _loc2_.y;
            this.§"0§.§-W§.§?3§(this.§;O§);
            this.§&Y§ = new §9O§();
            this.§&Y§.initialise(param1,false);
            this.§&Y§.x = _loc2_.x;
            this.§&Y§.y = _loc2_.y;
            this.§"0§.§-W§.§?3§(this.§&Y§);
         }
      }
      
      public function §&$§() : void
      {
         this.§"0§.§-W§.§3C§(this.§;O§.tower,this.§;O§.x,this.§;O§.y);
         this.§&Y§.x = this.§;O§.x;
         this.§&Y§.y = this.§;O§.y;
         this.§;O§.destroy();
         this.§;O§ = null;
      }
      
      public function §&X§() : void
      {
         if(this.§;O§)
         {
            this.§;O§.destroy();
            this.§;O§ = null;
         }
         if(this.§&Y§)
         {
            this.§&Y§.destroy();
            this.§&Y§ = null;
         }
      }
      
      private function §[F§(param1:MouseEvent) : void
      {
         this.§7>§.§[F§();
         if(this.§7>§.§"9§)
         {
            §10§.instance.§!;§("Chat$$$$Muted$$$$");
         }
         else
         {
            §10§.instance.§!;§("Chat$$$$UnMuted$$$$");
         }
      }
      
      public function §<J§(param1:String) : void
      {
         if(param1 == "Chat$$$$Muted$$$$")
         {
            this.§7>§.§"S§ = true;
         }
         else if(param1 == "Chat$$$$UnMuted$$$$")
         {
            this.§7>§.§"S§ = false;
         }
         else
         {
            this.§7>§.§2!§(param1,§10§.instance.§?$§.name,§%A§);
         }
      }
   }
}

