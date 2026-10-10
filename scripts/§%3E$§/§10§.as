package §>$§
{
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   import game.§9=§;
   import game.Balance;
   import ninjakiwi.mynk.Base64;
   import ninjakiwi.mynk.MyNK;
   import ninjakiwi.utils.StandardStuff;
   import org.osflash.signals.Signal;
   
   public class §10§ extends EventDispatcher
   {
      
      private static const §7=§:String = "battlesflash.hydar.xyz";
      
      private static const §,+§:String = "battlesmain-staging.ninjakiwi.com";
      
      private static const § G§:int = 4480;
      
      private static const §&#§:String = ",";
      
      private static const §]L§:String = "QUIT";
      
      public static const instance:§10§ = new §10§();
      
      public static const §;R§:Array = ["Bob","Charlie","Dan","Bubble O\' Bill","George","Steve","Helen Clark","Stewert","Gangnam Style"];
      
      public var §=3§:§7W§;
      
      public var §?$§:§7W§;
      
      public var §-6§:Signal = new Signal();
      
      public var §=4§:Signal = new Signal();
      
      public var §"#§:Signal = new Signal();
      
      public var §'3§:Signal = new Signal();
      
      public var §]S§:Signal = new Signal();
      
      public var §;@§:Signal = new Signal();
      
      public var §2N§:Signal = new Signal();
      
      public var §!F§:Signal = new Signal(String);
      
      public var § #§:Signal = new Signal();
      
      public var §>&§:Signal = new Signal();
      
      public var §0+§:Signal = new Signal();
      
      public var §0@§:Signal = new Signal();
      
      public var §[K§:Signal = new Signal();
      
      public var §#X§:Signal = new Signal();
      
      public var §7Y§:Signal = new Signal();
      
      public var §^&§:Signal = new Signal();
      
      public var §->§:Signal = new Signal();
      
      public var §3R§:Signal = new Signal();
      
      public var §2C§:Signal = new Signal();
      
      public var §%N§:Signal = new Signal();
      
      public var § A§:Signal = new Signal();
      
      public var §,Q§:Signal = new Signal();
      
      public var §[<§:Signal = new Signal();
      
      public var §?R§:Signal = new Signal();
      
      public var §4"§:Signal = new Signal();
      
      public var §2Q§:Signal = new Signal();
      
      public var §94§:Signal = new Signal();
      
      public var §=J§:Signal = new Signal();
      
      public var § T§:Signal = new Signal();
      
      public var §%V§:Signal = new Signal();
      
      public var §+G§:Signal = new Signal();
      
      public var §?'§:Signal = new Signal();
      
      public var §<Q§:Signal = new Signal();
      
      public var §##§:Signal = new Signal();
      
      public var §!0§:Signal = new Signal();
      
      public var §6O§:Signal = new Signal();
      
      public var §5"§:Signal = new Signal(String);
      
      public var §5D§:Signal = new Signal(String,int);
      
      public var §11§:Signal = new Signal(Array);
      
      public var §8>§:Signal = new Signal();
      
      private var §<&§:§<1§;
      
      private var §?S§:§<1§;
      
      private var battleID:String;
      
      private var §[O§:Boolean;
      
      public function §10§()
      {
         super();
         trace("=== KINGCOOL BUILD: KC-TEST-001 ===");
      }
      
      public function §,B§(param1:Boolean) : void
      {
         this.§%§(param1);
      }
      
      public function connect() : void
      {
         if(!this.§<&§.isConnected && !this.§<&§.§%S§)
         {
            this.§<&§.connect();
         }
      }
      
      public function isConnected() : Boolean
      {
         return this.§<&§.isConnected;
      }
      
      private function §'0§() : void
      {
         trace("§\'0§ ENTERED");
         try
         {
            this.§=3§ = new §7W§();
            this.§=3§.id = MyNK.ey.user.id;
            this.§=3§.name = MyNK.ey.user.name;
            this.§=3§.battleScore = §?V§.instance.profila.battleScore;
            this.§=3§.§`F§ = §?V§.instance.profila.activeDecal;
            this.§=3§.wins = §?V§.instance.profila.wins;
            this.§=3§.losses = §?V§.instance.profila.losses;
            this.§=3§.orc = §?V§.instance.profila.orc.value;
            this.§=3§.§9!§ = "https://avatars.nkstatic.com/mega/1.png";
            §?V§.instance.§&G§(this.§,Y§);
            trace("§\'0§ EXIT ok; §=3§ = " + this.§=3§);
         }
         catch(e:Error)
         {
            trace("§\'0§ ERROR: " + e);
         }
      }
      
      private function §,Y§(param1:String) : void
      {
         this.§=3§.§9!§ = param1;
      }
      
      public function §'Y§(param1:Boolean) : void
      {
         this.§=3§ = new §7W§();
         this.§=3§.id = "0123";
         this.§=3§.name = "Tester Man";
         this.§=3§.side = param1 ? 0 : 1;
         this.§=3§.battleScore = §?V§.instance.profila.battleScore;
         this.§=3§.§`F§ = §?V§.instance.profila.activeDecal;
         this.§?$§ = new §7W§();
         this.§?$§.id = "0124";
         this.§?$§.name = §;R§[int(Math.random() * §;R§.length)];
         this.§?$§.side = param1 ? 1 : 0;
         this.§?$§.battleScore = 999;
         this.§?$§.§`F§ = 9;
      }
      
      public function get §?1§() : §7W§
      {
         if(this.§=3§.side == 0)
         {
            return this.§=3§;
         }
         return this.§?$§;
      }
      
      public function get §2K§() : §7W§
      {
         if(this.§=3§.side == 1)
         {
            return this.§=3§;
         }
         return this.§?$§;
      }
      
      public function §'5§() : void
      {
         this.§?$§ = null;
      }
      
      private function §%§(param1:Boolean) : void
      {
         if(param1)
         {
            this.§<&§ = new §<1§(§,+§,§ G§);
         }
         else
         {
            this.§<&§ = new §<1§(§7=§,§ G§);
         }
         this.§<&§.connected.add(this.§8D§);
         this.§<&§.receive.add(this.§1"§);
         this.§<&§.error.add(this.§`%§);
         this.§<&§.disconnected.add(this.§"F§);
      }
      
      private function §1M§(param1:String, param2:int, param3:int) : void
      {
         this.§?S§ = new §<1§(param1,param2,param3);
         this.§?S§.connected.add(this.§'N§);
         this.§?S§.receive.add(this.§8&§);
         this.§?S§.error.add(this.§^0§);
         this.§?S§.disconnected.add(this.§!O§);
      }
      
      private function §=7§() : void
      {
         if(this.§?S§ == null)
         {
            return;
         }
         this.§?S§.connected.removeAll();
         this.§?S§.receive.removeAll();
         this.§?S§.error.removeAll();
         this.§?S§.disconnected.removeAll();
         this.§?S§ = null;
      }
      
      private function §]E§(param1:String) : void
      {
         trace("TRACE: §]E§ sending: " + param1);
         trace("TRACE: §]E§ MAIN SOCKET §<&§ = " + this.§<&§);
         trace("TRACE: §]E§ GAME SOCKET §?S§ = " + this.§?S§);
         if(this.§<&§ != null)
         {
            trace("TRACE: §]E§ MAIN SOCKET connected = " + this.§<&§.isConnected);
            this.§<&§.§96§(param1);
            trace("TRACE: §]E§ MAIN SOCKET §96§ returned");
         }
         else
         {
            trace("TRACE: §]E§ MAIN SOCKET IS NULL");
         }
      }
      
      private function § 4§(param1:String) : void
      {
         if(this.§?S§ != null && this.§?S§.isConnected)
         {
            this.§?S§.§96§(param1);
         }
      }
      
      private function §1"§(param1:String) : void
      {
         trace("§1\"§ ENTERED: " + param1);
         var _loc2_:String = param1.split(§&#§)[0];
         switch(_loc2_)
         {
            case "GimmeUrPlayerInfo":
               trace("§1\"§ GimmeUrPlayerInfo case; §=3§ = " + this.§=3§);
               this.§ #§.dispatch();
               trace("§1\"§ about to call §]E§");
               this.§]E§("HeresMyPlayerInfo" + §&#§ + this.§=3§.§@O§());
               trace("§1\"§ §]E§ returned");
               break;
            case "FindingYouAMatch":
               this.§!R§(param1);
               this.§!F§.dispatch(this.battleID);
               break;
            case "HeresDaBalance":
               this.§?8§(param1);
               break;
            case "CouldntFindYourCustomBattle":
               this.§0+§.dispatch();
               break;
            case "FoundYouAGame":
               this.§+T§(param1);
               break;
            case "YourGameIsTooOld":
               this.§>C§();
               break;
            case "ServerMessage":
               this.§%U§(param1);
         }
         trace("§1\"§ EXIT");
      }
      
      private function §8&§(param1:String) : void
      {
         var _loc3_:Boolean = false;
         var _loc4_:String = null;
         var _loc5_:ByteArray = null;
         var _loc6_:String = null;
         var _loc2_:String = param1.split(§&#§)[0];
         switch(_loc2_)
         {
            case "GimmeUrPlayerInfo":
               this.§ 4§("HeresMyPlayerInfo" + §&#§ + this.§=3§.§@O§());
               break;
            case "HeresDaBalance":
               this.§?8§(param1);
               break;
            case "FoundYourGame":
               this.§9V§(param1);
               break;
            case "OpponentDisconnected":
               this.§0@§.dispatch();
               break;
            case "OpponentReadyStatus":
               _loc3_ = this.§7"§(param1,1) == "true";
               this.§[K§.dispatch(_loc3_);
               break;
            case "OpponentHasLoaded":
               this.§#X§.dispatch();
               break;
            case "OpponentSyncRetrieved":
               this.§0H§(param1);
               break;
            case "OpponentRequestsSync":
               this.§3R§.dispatch();
               break;
            case "ServerStartingARound":
               this.§2C§.dispatch(uint(this.§7"§(param1,1)));
               break;
            case "OpponentBuiltATower":
               this.§"C§(param1);
               break;
            case "OpponentSoldATower":
               this.§3§(param1);
               break;
            case "OpponentUpgradedATower":
               this.§?%§(param1);
               break;
            case "OpponentSentABloonWave":
               this.§9>§(param1);
               break;
            case "OpponentRemovedABloonWave":
               this.§,G§(param1);
               break;
            case "OpponentLived":
               this.§4"§.dispatch();
               break;
            case "OpponentDied":
               this.§&,§(param1);
               break;
            case "OpponentSurrendered":
               this.§94§.dispatch();
               break;
            case "OpponentTowerTargetChanged":
               this.§=Y§(param1);
               break;
            case "OpponentChangedAcePath":
               this.§8N§(param1);
               break;
            case "OpponentUsedAnAbility":
               this.§@2§(param1);
               break;
            case "OpponentChangedTargetReticle":
               this.§,J§(param1);
               break;
            case "OpponentStillSyncing":
               this.§^&§.dispatch();
               break;
            case "OpponentResponseless":
               this.§->§.dispatch();
               break;
            case "OpponentDidntGetMySyncResponses":
               this.§?'§.dispatch();
               break;
            case "OpponentChangedBattleOptions":
               this.§5D§.dispatch(this.§7"§(param1,1),int(this.§7"§(param1,2)));
               break;
            case "OpponentChangedTowerLoadout":
               this.§11§.dispatch(this.§7"§(param1,1).split(":"));
               break;
            case "OpponentRequestsMyTowerLoadout":
               this.§8>§.dispatch();
               break;
            case "ServerMessage":
               this.§%U§(param1);
               break;
            case "RelayMsg":
               _loc4_ = this.§7"§(param1,1);
               switch(_loc4_)
               {
                  case "SentChatMsg":
                     _loc5_ = Base64.decode(this.§7"§(param1,2));
                     _loc5_.uncompress();
                     _loc5_.position = 0;
                     _loc6_ = _loc5_.readUTF();
                     this.§<Q§.dispatch(_loc6_);
                     break;
                  case "SentMousePos":
                     this.§##§.dispatch(int(this.§7"§(param1,2)),int(this.§7"§(param1,3)));
                     break;
                  case "CaughtHackingMsg":
                     this.§!0§.dispatch();
               }
         }
      }
      
      private function §>S§(param1:String, param2:String) : Boolean
      {
         return param1.indexOf(param2) == 0;
      }
      
      private function §7"§(param1:String, param2:int) : String
      {
         return param1.split(§&#§)[param2];
      }
      
      private function §8D§(param1:String) : void
      {
         trace("§8D§ CALLED");
         this.§'0§();
         this.§45§();
         this.§=4§.dispatch();
      }
      
      private function §`%§(param1:String) : void
      {
         this.§-6§.dispatch();
      }
      
      private function §^0§(param1:String) : void
      {
         this.§=7§();
         this.§'3§.dispatch();
      }
      
      private function §"F§(param1:String) : void
      {
         this.§"#§.dispatch();
      }
      
      private function §!O§(param1:String) : void
      {
         this.§=7§();
         this.§;@§.dispatch();
      }
      
      public function § M§() : void
      {
         trace("QUICK BATTLE CLICKED");
         this.§[O§ = false;
         this.§7P§("FindMeAQuickBattle",null,§?V§.instance.§"0§.§`E§);
         trace("MATCHMAKING CALL SENT");
      }
      
      public function §#2§() : void
      {
         this.§[O§ = true;
         this.§7P§("CreateMeACustomBattle",null);
      }
      
      public function §@M§(param1:String) : void
      {
         this.§[O§ = false;
         this.§7P§("FindMyCustomBattle",param1);
      }
      
      private function §7P§(param1:String, param2:String, param3:int = -1) : void
      {
         trace("TRACE: §7P§ enter, socket=" + this.§?S§);
         if(this.§?S§ != null)
         {
            trace("TRACE: §7P§ bailed — socket already exists");
            return;
         }
         this.battleID = param2;
         this.§'0§();
         this.§]E§(param1 + §&#§ + StandardStuff.VERSION + §&#§ + param2 + §&#§ + param3);
         trace("TRACE: §7P§ completed send");
      }
      
      private function §!R§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         var _loc3_:String = _loc2_[1];
         if(_loc3_ != null && _loc3_ != "null" && _loc3_.length > 0)
         {
            this.battleID = _loc3_;
         }
         else
         {
            this.battleID = null;
         }
      }
      
      private function §+T§(param1:String) : void
      {
         trace("§+T§ SERVER SAID: " + param1);
         if(this.§?S§ != null)
         {
            return;
         }
         var _loc2_:Array = param1.split(§&#§);
         var _loc3_:String = _loc2_[1];
         var _loc4_:int = int(parseInt(_loc2_[2]));
         this.battleID = _loc2_[3];
         var _loc5_:int = int(parseInt(_loc2_[4]));
         trace("§+T§ NEW SOCKET to " + _loc3_ + ":" + _loc4_);
         this.§1M§(_loc3_,_loc4_,_loc5_);
         this.§?S§.connect();
      }
      
      private function §'N§(param1:String) : void
      {
         this.§]S§.dispatch();
         this.§ 4§("FindMyGame" + §&#§ + this.battleID + §&#§ + int(this.§[O§));
      }
      
      private function §9V§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§?$§ = new §7W§();
         this.§?$§.§1P§(param1);
         var _loc3_:int = int(_loc2_[6]);
         var _loc4_:int = int(_loc2_[7]);
         var _loc5_:int = int(_loc2_[8]);
         this.§=3§.side = _loc4_;
         this.§?$§.side = _loc4_ == 0 ? 1 : 0;
         this.§>&§.dispatch(_loc3_,_loc4_,_loc5_);
      }
      
      private function §45§() : void
      {
         trace("§45§ CALLED");
         this.§]E§("Hello" + §&#§ + StandardStuff.VERSION);
      }
      
      public function §[J§() : void
      {
         this.§]E§("ImStilHereHostingMyPrivateMatch");
      }
      
      public function §05§() : Boolean
      {
         try
         {
            this.battleID = null;
            if(this.§?S§ != null)
            {
               this.§ 4§(§]L§);
               this.§?S§.§@U§();
               this.§=7§();
            }
            this.§]E§("ILeftGame");
         }
         catch(e:Error)
         {
            if(§?S§)
            {
            }
            if(§<&§)
            {
            }
            return false;
         }
         return true;
      }
      
      public function §%=§() : void
      {
         this.§ 4§("GiveMeDaBalance");
      }
      
      public function §7-§(param1:Boolean) : void
      {
         this.§ 4§("MyReadyToPlayStatus" + §&#§ + param1);
      }
      
      public function §1E§() : void
      {
         this.§ 4§("MyGameIsLoaded");
      }
      
      public function §]A§() : void
      {
         this.§ 4§("GimmeOpponentSyncData");
      }
      
      public function §>?§(param1:Number, param2:int) : void
      {
         this.§ 4§("HeresMySyncData" + §&#§ + param1 + §&#§ + param2);
      }
      
      public function §@,§() : void
      {
         this.§ 4§("ImReadyToStartARound");
      }
      
      public function §<S§(param1:§9=§) : void
      {
         this.§ 4§("IBuiltATower" + §&#§ + param1.id + §&#§ + param1.type + §&#§ + param1.x + §&#§ + param1.y + §&#§ + param1.rotation + §&#§ + param1.seed);
      }
      
      public function §39§(param1:String) : void
      {
         this.§ 4§("ISoldATower" + §&#§ + param1);
      }
      
      public function §<2§(param1:String, param2:int) : void
      {
         this.§ 4§("IUpgradedATower" + §&#§ + param1 + §&#§ + param2);
      }
      
      public function §-L§(param1:int, param2:String, param3:Boolean, param4:Boolean) : void
      {
         this.§ 4§("ISentABloonWave" + §&#§ + param1 + §&#§ + param2 + §&#§ + param3 + §&#§ + param4);
      }
      
      public function §]#§(param1:int) : void
      {
         this.§ 4§("IRemovedABloonWave" + §&#§ + param1);
      }
      
      public function §7U§() : void
      {
         this.§ 4§("ILived");
      }
      
      public function §84§(param1:Number) : void
      {
         this.§ 4§("IDied" + §&#§ + param1);
      }
      
      public function §76§() : void
      {
         this.§ 4§("ISurrender");
      }
      
      public function §"G§(param1:String, param2:int) : void
      {
         this.§ 4§("IChangedATowerTarget" + §&#§ + param1 + §&#§ + param2);
      }
      
      public function §8A§(param1:String, param2:int) : void
      {
         this.§ 4§("IChangedAcePath" + §&#§ + param1 + §&#§ + param2);
      }
      
      public function §62§(param1:String, param2:String) : void
      {
         this.§ 4§("IUsedAnAbility" + §&#§ + param1 + §&#§ + param2);
      }
      
      public function §`X§(param1:String, param2:Number, param3:Number) : void
      {
         this.§ 4§("IChangedTargetReticle" + §&#§ + param1 + §&#§ + param2 + §&#§ + param3);
      }
      
      public function §]&§() : void
      {
         this.§ 4§("YouDidntRespondToMySyncs");
      }
      
      public function §5O§(param1:String, param2:int) : void
      {
         this.§ 4§("IChangedBattleOptions" + §&#§ + param1 + §&#§ + param2);
      }
      
      public function §+I§(param1:String) : void
      {
         this.§ 4§("IChangedMyTowerLoadout" + §&#§ + param1);
      }
      
      public function §]=§() : void
      {
         this.§ 4§("IRequestYourTowerLoadout");
      }
      
      public function §!;§(param1:String) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         _loc2_.compress();
         _loc2_.position = 0;
         var _loc3_:String = Base64.encode(_loc2_);
         this.§ 4§("RelayMsg" + §&#§ + "SentChatMsg" + §&#§ + _loc3_);
      }
      
      public function §,K§(param1:int, param2:int) : void
      {
         this.§ 4§("RelayMsg" + §&#§ + "SentMousePos" + §&#§ + param1 + §&#§ + param2);
      }
      
      public function §<O§() : void
      {
         this.§ 4§("RelayMsg" + §&#§ + "CaughtHackingMsg");
      }
      
      private function §0H§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§7Y§.dispatch(Number(_loc2_[1]),int(_loc2_[2]));
      }
      
      private function §"C§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         var _loc3_:§9=§ = new §9=§(_loc2_[1],_loc2_[2],Number(_loc2_[3]),Number(_loc2_[4]),Number(_loc2_[5]),uint(_loc2_[6]));
         this.§%N§.dispatch(_loc3_);
      }
      
      private function §3§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§ A§.dispatch(_loc2_[1]);
      }
      
      private function §?%§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§,Q§.dispatch(_loc2_[1],int(_loc2_[2]));
      }
      
      private function §9>§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         var _loc3_:Boolean = _loc2_[3] == "true";
         var _loc4_:Boolean = _loc2_[4] == "true";
         this.§[<§.dispatch(int(_loc2_[1]),_loc2_[2],_loc3_,_loc4_);
      }
      
      private function §,G§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§?R§.dispatch(int(_loc2_[1]));
      }
      
      private function §&,§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§2Q§.dispatch(_loc2_[1]);
      }
      
      private function §=Y§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§=J§.dispatch(_loc2_[1],int(_loc2_[2]));
      }
      
      private function §8N§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§ T§.dispatch(_loc2_[1],int(_loc2_[2]));
      }
      
      private function §@2§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§%V§.dispatch(_loc2_[1],_loc2_[2]);
      }
      
      private function §,J§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§+G§.dispatch(_loc2_[1],Number(_loc2_[2]),Number(_loc2_[3]));
      }
      
      private function §>C§() : void
      {
         this.§6O§.dispatch();
      }
      
      private function §%U§(param1:String) : void
      {
         var _loc2_:Array = param1.split(§&#§);
         this.§5"§.dispatch(_loc2_[1]);
      }
      
      private function §?8§(param1:String) : void
      {
         var _loc2_:String = param1.substring("HeresDaBalance".length);
         Balance.instance.applyBalanceData(_loc2_);
         this.§2N§.dispatch();
      }
   }
}

