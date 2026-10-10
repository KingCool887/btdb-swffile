package game
{
   import §"?§.§9X§;
   import §+C§.§0>§;
   import §0$§.§&K§;
   import §0$§.§31§;
   import §8K§.§ E§;
   import §8K§.§!<§;
   import §8U§.§52§;
   import §;M§.§-!§;
   import §>$§.§10§;
   import §>@§.§-A§;
   import §>@§.§<<§;
   import display.BloonClip;
   import entities.Banana;
   import events.LevelEvent;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import ninjakiwi.mynk.MyNK;
   import org.osflash.signals.Signal;
   import sound.§%'§;
   import towers.Tower;
   import towers.def.TowerDef;
   import utils.§-B§;
   import utils.Rndm;
   import weapons.SpikeSpread;
   
   public class §6$§ extends §-!§
   {
      
      public static const §>;§:int = 0;
      
      public static const §&§:int = 1;
      
      public static const §8!§:int = 0;
      
      public static const §5B§:int = 1;
      
      private static const §<5§:Number = 0.1;
      
      private static const §2E§:Number = 4;
      
      private static const §2R§:int = 3;
      
      private var type:int = 0;
      
      private var §2&§:int = 0;
      
      public var §"-§:§!<§;
      
      protected var §0I§:Vector.<§0>§> = new Vector.<§0>§>();
      
      private var §5+§:§9X§ = null;
      
      private var §2V§:Vector.<§ E§> = null;
      
      public var §3G§:Number = 0;
      
      private var §?G§:§<<§ = §-A§.§]H§(-1);
      
      private var §^K§:uint = 0;
      
      private var §,6§:Number = 0;
      
      private var §=6§:Number = 1;
      
      public var §^@§:Boolean = false;
      
      private var §&;§:uint = 0;
      
      public var §#3§:§<<§ = §-A§.§]H§();
      
      private var §'8§:§52§ = new §52§(0,0);
      
      private var §0-§:§52§ = new §52§(0,0);
      
      private var §>#§:Timer;
      
      private var §[Y§:Timer;
      
      private var § O§:§-B§;
      
      public var §7$§:Signal = new Signal();
      
      private var §@H§:Vector.<String>;
      
      private const §?&§:int = 10;
      
      private var §8O§:Boolean = true;
      
      private var §?C§:int = 4;
      
      internal var § ;§:Boolean = false;
      
      internal var §,3§:§-B§;
      
      private var §]'§:int = 0;
      
      private var §+"§:int = 0;
      
      private var §%8§:Boolean = false;
      
      private var §48§:Boolean = false;
      
      private var §%F§:Number = 0;
      
      internal var §!9§:int = 0;
      
      private var §@&§:Vector.<Number> = new Vector.<Number>();
      
      private var §%@§:Number = 0;
      
      public var §,;§:Number = 0;
      
      private var §&J§:int;
      
      public function §6$§()
      {
         super();
      }
      
      public function get §',§() : int
      {
         return this.§?C§;
      }
      
      public function set §',§(param1:int) : void
      {
         this.§?C§ = param1;
      }
      
      public function get § 2§() : §!<§
      {
         return this.§"-§;
      }
      
      public function get §+O§() : int
      {
         return this.§?G§.value;
      }
      
      public function §,B§() : void
      {
         this.§"-§ = new §!<§();
      }
      
      public function §3J§(param1:int, param2:int, param3:Vector.<§ E§>, param4:§9X§, param5:int = -10) : void
      {
         this.§0I§ = new Vector.<§0>§>();
         try
         {
            §?V§.instance.stage.addEventListener(MouseEvent.RIGHT_CLICK,this.§^$§);
         }
         catch(e:Error)
         {
         }
         §&K§.instance.§#<§.hide();
         this.type = param1;
         this.§5+§ = param4;
         this.§2V§ = param3;
         this.§,6§ = 0;
         this.§%F§ = 0;
         this.§&J§ = 0;
         this.§@&§ = new Vector.<Number>();
         this.§%@§ = 0;
         this.§&;§ = §10§.instance.§=3§.side;
         Rndm.seed = uint(param2);
         Banana.§9N§.seed = param2;
         this.§0I§.push(new §0>§());
         this.§0I§.push(new §0>§());
         var _loc6_:int = 0;
         while(_loc6_ < 2)
         {
            this.§0I§[_loc6_].§,B§(this,param4,_loc6_);
            this.§0I§[_loc6_].§<$§.add(this.§<§);
            this.§0I§[_loc6_].§ W§(Balance.instance.STARTING_HEALTH.value);
            this.§0I§[_loc6_].§2#§(Balance.instance.STARTING_CASH.value);
            _loc6_++;
         }
         this.§-W§.§<A§.add(this.§49§);
         this.§-W§.§=#§.add(this.§^;§);
         this.§-W§.§-K§.add(this.§]T§);
         this.§-W§.§,§.add(this.§&P§);
         this.§-W§.§!T§.add(this.§=§);
         this.§-W§.§`U§.add(this.§?L§);
         this.§-W§.§"B§.add(this.§<I§);
         this.§-W§.§4B§.add(this.§-<§);
         this.§9@§.§`9§.add(this.§50§);
         this.§9@§.§^=§.add(this.§>4§);
         this.§?G§.value = -1;
         if(param5 != -10)
         {
            this.§?G§.value = param5;
         }
         switch(this.§`E§)
         {
            case §5B§:
               this.§#3§.value = Balance.instance.CASH_PER_TICK_STARTING_DEFEND.value;
               break;
            default:
               this.§#3§.value = Balance.instance.CASH_PER_TICK_STARTING.value;
         }
         if(this.§&;§ == 0)
         {
            BloonClip.setDecalFrames(§10§.instance.§?$§.§`F§,§10§.instance.§=3§.§`F§);
         }
         else
         {
            BloonClip.setDecalFrames(§10§.instance.§=3§.§`F§,§10§.instance.§?$§.§`F§);
         }
         if(param4.music != null)
         {
            new §%'§(param4.music).play();
         }
         if(this.§&;§ == 0)
         {
            Tower.§20§ = 0;
            §-3§.§20§ = 0;
         }
         else
         {
            Tower.§20§ = int.MAX_VALUE / 2;
            §-3§.§20§ = int.MAX_VALUE / 2;
         }
         §?V§.instance.§7G§.addChild(this.§"-§);
         this.§"-§.§3I§(param3);
         this.§<N§();
         this.§<U§();
         §10§.instance.§1E§();
         §&K§.instance.§;S§.§1#§("Waiting for opponent to load...");
         this.§ ;§ = false;
         this.§8O§ = false;
         this.§@H§ = new Vector.<String>();
         if(§?V§.§00§)
         {
            this.§3I§();
         }
      }
      
      private function §]X§() : void
      {
         this.§3I§();
      }
      
      private function §3I§() : void
      {
         if(this.§ ;§ == true)
         {
            return;
         }
         this.§ ;§ = true;
         this.§!9§ = 0;
         this.§>#§ = new Timer(§<5§ * 1000);
         this.§>#§.addEventListener(TimerEvent.TIMER,this.§22§);
         this.§>#§.start();
         this.§[Y§ = new Timer(§2E§ * 1000,0);
         this.§[Y§.addEventListener(TimerEvent.TIMER,this.§?9§);
         this.§ O§ = new §-B§(Balance.instance.GIVE_CASH_TIME.value,-1);
         this.§ O§.addEventListener(§-B§.TIMER,this.§=Q§);
         this.§ O§.start();
         this.§%8§ = false;
         this.§48§ = false;
         this.§,3§ = new §-B§(Balance.instance.FIRST_ROUND_START_TIME.value,1);
         this.§,3§.addEventListener(§-B§.COMPLETE,this.§@,§);
         this.§,3§.start();
         this.§69§(1);
         this.§^@§ = true;
         §&K§.instance.§;S§.hide();
      }
      
      public function §<E§(param1:Boolean = false) : void
      {
         if(this.§>#§)
         {
            this.§>#§.removeEventListener(TimerEvent.TIMER,this.§22§);
         }
         this.§>#§ = null;
         if(this.§[Y§)
         {
            this.§[Y§.removeEventListener(TimerEvent.TIMER,this.§?9§);
         }
         this.§[Y§ = null;
         if(this.§ O§)
         {
            this.§ O§.removeEventListener(TimerEvent.TIMER,this.§=Q§);
         }
         this.§ O§ = null;
         if(this.§,3§)
         {
            this.§,3§.removeEventListener(§-B§.COMPLETE,this.§@,§);
         }
         this.§,3§ = null;
         this.§^@§ = false;
         this.§"-§.§<E§();
         if(this.§-W§)
         {
            this.§-W§.§<A§.remove(this.§49§);
            this.§-W§.§=#§.remove(this.§^;§);
            this.§-W§.§-K§.remove(this.§]T§);
            this.§-W§.§,§.remove(this.§&P§);
            this.§-W§.§!T§.remove(this.§=§);
            this.§-W§.§`U§.remove(this.§?L§);
            this.§-W§.§"B§.remove(this.§<I§);
            this.§-W§.§4B§.remove(this.§-<§);
         }
         if(this.§9@§)
         {
            this.§9@§.§`9§.remove(this.§50§);
            this.§9@§.§^=§.remove(this.§>4§);
         }
         this.§=1§();
         if(param1 == false)
         {
            this.endGame2();
         }
      }
      
      private function endGame2() : void
      {
         this.§2;§();
         var _loc1_:int = 0;
         while(_loc1_ < this.§0I§.length)
         {
            this.§0I§[_loc1_].§<$§.remove(this.§<§);
            this.§0I§[_loc1_].§<E§();
            _loc1_++;
         }
         this.§0I§ = new Vector.<§0>§>();
         super.clear();
         try
         {
            §?V§.instance.stage.removeEventListener(MouseEvent.RIGHT_CLICK,this.§^$§);
         }
         catch(e:Error)
         {
         }
      }
      
      public function §&6§() : void
      {
         §?V§.instance.§7G§.removeChild(this.§"-§);
         §10§.instance.§05§();
         SpikeSpread.fullTrackPoints = new Dictionary();
      }
      
      public function §<K§() : void
      {
         if(this.type == §>;§)
         {
            §?V§.instance.profila.modBattleHistoryWL(true);
         }
         this.§&6§();
      }
      
      public function §%R§() : void
      {
         this.§<E§();
         if(this.type == §>;§)
         {
            §?V§.instance.profila.disconnects += 1;
            §?V§.instance.profila.modBattleHistoryWL(false);
         }
         this.§&6§();
      }
      
      public function §,,§() : void
      {
         this.§<E§();
         if(this.type == §>;§)
         {
            §?V§.instance.profila.disconnects += 1;
            §?V§.instance.profila.modBattleHistoryWL(false);
         }
         this.§&6§();
      }
      
      public function §24§() : void
      {
         §10§.instance.§76§();
         this.§<E§();
         this.§;1§(true,true);
      }
      
      public function §!W§() : void
      {
         §10§.instance.§<O§();
         this.§<E§();
         if(this.type == §>;§)
         {
            §?V§.instance.profila.modBattleHistoryWL(false);
         }
         §10§.instance.§05§();
      }
      
      public function §;1§(param1:Boolean, param2:Boolean = false) : void
      {
         var _loc3_:int = 0;
         if(this.type == §>;§ && this.§8O§ == false)
         {
            this.§8O§ = true;
            if(param1)
            {
               if(param2 && this.§+O§ < Balance.instance.SURRENDER_ROUND_REWARD.value)
               {
                  §?V§.instance.profila.losses += 1;
               }
               else
               {
                  MyNK.ey.user.getCurrency(Balance.instance.MEDS_FOR_LOSS.value,101,"ThisGStarGotSumMedsForLosing");
                  _loc3_ = Balance.instance.MEDS_FOR_LOSS.value;
                  §?V§.instance.profila.losses += 1;
               }
            }
            else
            {
               MyNK.ey.user.getCurrency(Balance.instance.MEDS_FOR_WIN.value,101,"ThisBossPlayaGotSumMedsForWinning");
               _loc3_ = Balance.instance.MEDS_FOR_WIN.value;
               §?V§.instance.profila.wins += 1;
            }
            §?V§.instance.profila.save();
            MyNK.ey.user.saveScore(§?V§.instance.profila.battleScore,null,false,305);
            this.§8%§(param1);
            §?V§.instance.profila.modBattleHistoryWL(!param1);
         }
         §&K§.instance.§?H§.show({
            "playerLose":param1,
            "medsEarnt":_loc3_
         });
         §&K§.instance.§^<§.hide();
      }
      
      private function §8%§(param1:Boolean) : void
      {
         var _loc4_:String = null;
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < this.§2V§.length)
         {
            _loc2_ += this.§2V§[_loc3_].id + ",";
            _loc3_++;
         }
         MyNK.ey.user.track("Loadout",this.§5+§.id,this.§,6§,_loc2_,param1 == true ? "true" : "false",true);
         if(!param1)
         {
            _loc4_ = this.§@H§.join(",");
            MyNK.ey.user.track("Bloonsends",this.§5+§.id,this.§+O§ + 1,_loc4_,int(§?V§.instance.profila.battleScore).toString(),true);
         }
      }
      
      override public function process(param1:Number) : void
      {
         param1 *= this.§=6§;
         this.§,6§ += param1;
         this.§3G§ += param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.§0I§.length)
         {
            this.§0I§[_loc2_].process(param1);
            _loc2_++;
         }
         super.process(param1);
         this.§"-§.process(param1);
         ++this.§]'§;
         if(this.§]'§ >= 5)
         {
            this.§]'§ = 0;
            this.§,K§();
         }
         if(this.§+"§ > 0)
         {
            this.§'8§.x += 1 / this.§+"§ * (this.§0-§.x - this.§'8§.x);
            this.§'8§.y += 1 / this.§+"§ * (this.§0-§.y - this.§'8§.y);
            --this.§+"§;
         }
      }
      
      public function §78§(param1:BitmapData, param2:BitmapData) : void
      {
         this.§0I§[0].draw(param1);
         this.§0I§[1].draw(param2);
      }
      
      private function §@,§(param1:Event = null) : void
      {
         if(this.§,3§)
         {
            this.§,3§.stop();
         }
         if(§?V§.§00§)
         {
            this.§=>§(Math.random() * uint.MAX_VALUE);
         }
         if(this.§%8§ == true)
         {
            return;
         }
         this.§%8§ = true;
         §10§.instance.§@,§();
      }
      
      private function §=>§(param1:uint) : void
      {
         this.§?;§();
         this.§"6§(param1);
         this.§%8§ = false;
         this.§48§ = false;
         var _loc2_:Number = this.§0I§[0].§+#§.§9A§;
         this.§,3§.reset(_loc2_ + Balance.instance.ROUND_EXPIRY_TIME_BASE.value);
      }
      
      private function §"6§(param1:uint) : void
      {
         this.§3G§ = 0;
         ++this.§?G§.value;
         var _loc2_:int = 0;
         while(_loc2_ < this.§0I§.length)
         {
            this.§0I§[_loc2_].§"6§(this.§+O§,param1);
            _loc2_++;
         }
         dispatchEvent(new LevelEvent(LevelEvent.ROUND_START));
      }
      
      private function §?;§() : void
      {
         dispatchEvent(new LevelEvent(LevelEvent.ROUND_OVER));
      }
      
      private function §<§() : void
      {
         if(this.§48§)
         {
            return;
         }
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         while(_loc2_ < this.§0I§.length)
         {
            if(this.§0I§[_loc2_].§0=§() == false)
            {
               _loc1_ = true;
               break;
            }
            _loc2_++;
         }
         if(_loc1_ == true)
         {
            this.§48§ = true;
            if(this.§,3§.delay - this.§,3§.current > Balance.instance.§+;§.value)
            {
               this.§,3§.reset(Balance.instance.§+;§.value);
            }
         }
      }
      
      private function §49§(param1:int) : void
      {
         if(§?V§.§00§)
         {
            return;
         }
         if(this.§-W§.§#+§.value <= 0)
         {
            this.§-W§.§<A§.remove(this.§49§);
            this.§%F§ = this.§,6§;
            this.§<E§(true);
            §10§.instance.§84§(this.§,6§);
         }
      }
      
      public function get §-W§() : §0>§
      {
         if(this.§0I§.length == 0)
         {
            return null;
         }
         return this.§0I§[this.§&;§];
      }
      
      public function get §9@§() : §0>§
      {
         if(this.§0I§.length == 0)
         {
            return null;
         }
         return this.§0I§[this.§0I§.length - 1 - this.§&;§];
      }
      
      public function get §8§() : §0>§
      {
         if(this.§0I§.length == 0)
         {
            return null;
         }
         return this.§0I§[0];
      }
      
      public function get §&M§() : §0>§
      {
         if(this.§0I§.length == 0)
         {
            return null;
         }
         return this.§0I§[1];
      }
      
      public function get §`E§() : int
      {
         return this.§2&§;
      }
      
      public function set §`E§(param1:int) : void
      {
         this.§2&§ = param1;
      }
      
      private function §^$§(param1:Event) : void
      {
      }
      
      private function §=Q§(param1:Event) : void
      {
         this.§-W§.§4>§(this.§#3§.value);
      }
      
      public function §0<§(param1:Number) : void
      {
         this.§#3§.value += param1;
         if(this.§#3§.value < 0)
         {
            this.§#3§.value = 0;
         }
         this.§7$§.dispatch(this.§#3§.value);
      }
      
      public function §`;§() : Number
      {
         return this.§,6§;
      }
      
      public function §&Q§(param1:§0>§) : §52§
      {
         if(param1 == this.§-W§)
         {
            return new §52§(§?V§.instance.mouseX,§?V§.instance.mouseY);
         }
         return this.§'8§;
      }
      
      public function §[C§(param1:§0>§) : Boolean
      {
         return param1 == this.§-W§;
      }
      
      private function §<N§() : void
      {
         §10§.instance.§7Y§.add(this.§0H§);
         §10§.instance.§3R§.add(this.§>?§);
         §10§.instance.§^&§.add(this.§6B§);
         §10§.instance.§#X§.add(this.§]X§);
         §10§.instance.§2C§.add(this.§=>§);
         §10§.instance.§%N§.add(this.§?4§);
         §10§.instance.§ A§.add(this.§7@§);
         §10§.instance.§,Q§.add(this.§`8§);
         §10§.instance.§[<§.add(this.§%J§);
         §10§.instance.§?R§.add(this.§3Q§);
         §10§.instance.§94§.add(this.§&D§);
         §10§.instance.§=J§.add(this.§+=§);
         §10§.instance.§ T§.add(this.§"7§);
         §10§.instance.§%V§.add(this.§^'§);
         §10§.instance.§+G§.add(this.§9Q§);
         §10§.instance.§?'§.add(this.§=5§);
         §10§.instance.§<Q§.add(this.§>,§);
         §10§.instance.§##§.add(this.§1!§);
         §10§.instance.§!0§.add(this.§%4§);
      }
      
      private function §=1§() : void
      {
         §10§.instance.§7Y§.remove(this.§0H§);
         §10§.instance.§3R§.remove(this.§>?§);
         §10§.instance.§^&§.remove(this.§6B§);
         §10§.instance.§#X§.remove(this.§]X§);
         §10§.instance.§2C§.remove(this.§=>§);
         §10§.instance.§%N§.remove(this.§?4§);
         §10§.instance.§ A§.remove(this.§7@§);
         §10§.instance.§,Q§.remove(this.§`8§);
         §10§.instance.§[<§.remove(this.§%J§);
         §10§.instance.§?R§.remove(this.§3Q§);
         §10§.instance.§94§.remove(this.§&D§);
         §10§.instance.§=J§.remove(this.§+=§);
         §10§.instance.§ T§.remove(this.§"7§);
         §10§.instance.§%V§.remove(this.§^'§);
         §10§.instance.§+G§.remove(this.§9Q§);
         §10§.instance.§?'§.remove(this.§=5§);
         §10§.instance.§<Q§.remove(this.§>,§);
         §10§.instance.§##§.remove(this.§1!§);
         §10§.instance.§!0§.remove(this.§%4§);
      }
      
      private function §<U§() : void
      {
         §10§.instance.§;@§.add(this.disconnected);
         §10§.instance.§0@§.add(this.§!E§);
         §10§.instance.§->§.add(this.§'E§);
         §10§.instance.§4"§.add(this.§3O§);
         §10§.instance.§2Q§.add(this.§-=§);
      }
      
      private function §2;§() : void
      {
         §10§.instance.§;@§.remove(this.disconnected);
         §10§.instance.§0@§.remove(this.§!E§);
         §10§.instance.§->§.remove(this.§'E§);
         §10§.instance.§4"§.remove(this.§3O§);
         §10§.instance.§2Q§.remove(this.§-=§);
      }
      
      private function disconnected() : void
      {
         §&K§.instance.§^<§.show(§31§.§[B§);
      }
      
      private function §3O§() : void
      {
         this.endGame2();
         this.§;1§(true);
      }
      
      private function §-=§(param1:Number) : void
      {
         this.§9@§.§ W§(0);
         this.§<E§();
         if(this.§%F§ != 0)
         {
            if(this.§%F§ < param1)
            {
               this.§;1§(true);
            }
            else
            {
               this.§;1§(false);
            }
         }
         else
         {
            §10§.instance.§7U§();
            this.§;1§(false);
         }
      }
      
      private function §&D§() : void
      {
         this.§<E§();
         §&K§.instance.§^<§.show(§31§.§ L§);
      }
      
      private function §22§(param1:TimerEvent) : void
      {
         §10§.instance.§]A§();
         this.§!9§ = getTimer();
         this.§>#§.stop();
         if(!§?V§.§00§ && !this.§[Y§.running)
         {
            this.§[Y§.start();
         }
      }
      
      private function §0H§(param1:Number, param2:int) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(this.§[Y§.running)
         {
            §&K§.instance.§^<§.hide();
         }
         this.§&J§ = 0;
         this.§[Y§.reset();
         this.§[Y§.stop();
         var _loc3_:Number = (getTimer() - this.§!9§) / 1000;
         if(this.§@&§.length > 10)
         {
            _loc5_ = this.§@&§.shift();
            this.§%@§ -= _loc5_;
         }
         this.§@&§.push(_loc3_);
         this.§%@§ += _loc3_;
         this.§,;§ = this.§%@§ / this.§@&§.length;
         var _loc4_:Number = this.§,6§ - this.§,;§ / 2 - param1;
         if(_loc4_ > 1.5)
         {
            _loc6_ = Math.min(_loc4_,4);
            this.§69§(1 - 1 * _loc6_ * _loc6_ / 16);
         }
         else
         {
            this.§69§(1);
         }
         this.§9@§.§ W§(param2);
         this.§>#§.reset();
         this.§>#§.start();
      }
      
      public function §69§(param1:Number) : void
      {
         this.§=6§ = param1;
      }
      
      private function §>?§() : void
      {
         §10§.instance.§>?§(this.§,6§,this.§-W§.§#+§.value);
      }
      
      private function §,K§() : void
      {
         §10§.instance.§,K§(§?V§.instance.mouseX,§?V§.instance.mouseY);
      }
      
      private function §1!§(param1:int, param2:int) : void
      {
         this.§+"§ = 5;
         this.§0-§.x = param1;
         this.§0-§.y = param2;
      }
      
      private function §?9§(param1:TimerEvent) : void
      {
         if(§?V§.§00§)
         {
            return;
         }
         if(this.§&J§ == 0)
         {
            this.§69§(0);
            §&K§.instance.§^<§.show(§31§.§&8§);
         }
         if(this.§&J§ < §2R§)
         {
            §10§.instance.§]&§();
         }
         else
         {
            this.§=5§();
         }
         ++this.§&J§;
      }
      
      private function §6B§() : void
      {
         this.§&J§ = 1;
      }
      
      private function §'E§() : void
      {
         this.§<E§();
         §&K§.instance.§^<§.show(§31§.§?5§);
      }
      
      private function §!E§() : void
      {
         this.§<E§();
         if(this.§ ;§)
         {
            §&K§.instance.§^<§.show(§31§.§,A§);
         }
         else
         {
            §&K§.instance.§^<§.show(§31§.§+P§);
         }
      }
      
      private function §%4§() : void
      {
         this.§<E§();
         §&K§.instance.§^<§.show(§31§.§`G§);
      }
      
      private function §^;§(param1:§9=§) : void
      {
         §10§.instance.§<S§(param1);
         MyNK.ey.user.track("PlaceTower",param1.type,this.§+O§ + 1,this.§5+§.id,int(§?V§.instance.profila.battleScore).toString(),true);
      }
      
      private function §?4§(param1:§9=§) : void
      {
         var _loc2_:TowerDef = §?V§.instance.§=K§.§4§(param1.type);
         this.§9@§.§`'§(param1.id,_loc2_,param1.x,param1.y,param1.rotation,param1.seed);
      }
      
      private function §]T§(param1:String) : void
      {
         §10§.instance.§39§(param1);
      }
      
      private function §7@§(param1:String) : void
      {
         this.§9@§.§&U§(this.§9@§.§<W§(param1));
      }
      
      private function §&P§(param1:String, param2:int) : void
      {
         §10§.instance.§<2§(param1,param2);
      }
      
      private function §`8§(param1:String, param2:int) : void
      {
         this.§9@§.§-T§(this.§9@§.§<W§(param1),param2);
      }
      
      private function §50§(param1:int, param2:String, param3:Boolean, param4:Boolean) : void
      {
         §10§.instance.§-L§(param1,param2,param3,param4);
         if(this.§@H§.length >= 10)
         {
            this.§@H§.splice(0,1);
         }
         this.§@H§.push(param2 + param4 == true ? "-r" : ("--" + param3 == true ? "-c" : "--"));
      }
      
      private function §%J§(param1:int, param2:String, param3:Boolean, param4:Boolean) : void
      {
         var _loc5_:BloonSendDef = §?V§.instance.§7?§.§2W§(param2);
         this.§-W§.§%,§(param1,_loc5_,param3,param4);
      }
      
      private function §>4§(param1:int) : void
      {
         §10§.instance.§]#§(param1);
      }
      
      private function §3Q§(param1:int) : void
      {
         this.§-W§.§[4§(param1);
      }
      
      private function §=§(param1:String, param2:int) : void
      {
         §10§.instance.§"G§(param1,param2);
      }
      
      private function §+=§(param1:String, param2:int) : void
      {
         this.§9@§.§90§(this.§9@§.§<W§(param1),param2);
      }
      
      private function §?L§(param1:String, param2:int) : void
      {
         §10§.instance.§8A§(param1,param2);
      }
      
      private function §"7§(param1:String, param2:int) : void
      {
         this.§9@§.setAceFlightPath(this.§9@§.§<W§(param1),param2);
      }
      
      private function §<I§(param1:String, param2:String) : void
      {
         §10§.instance.§62§(param1,param2);
      }
      
      private function §^'§(param1:String, param2:String) : void
      {
         this.§9@§.§6@§(this.§9@§.§<W§(param1),param2);
      }
      
      private function §-<§(param1:String, param2:Number, param3:Number) : void
      {
         §10§.instance.§`X§(param1,param2,param3);
      }
      
      private function §9Q§(param1:String, param2:Number, param3:Number) : void
      {
         this.§9@§.§3C§(this.§9@§.§<W§(param1),param2,param3);
      }
      
      private function §=5§() : void
      {
         this.§<E§();
         §&K§.instance.§^<§.show(§31§.§`W§);
      }
      
      private function §>,§(param1:String) : void
      {
         this.§"-§.§<J§(param1);
      }
   }
}

