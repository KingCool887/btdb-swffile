package profile
{
   import §0$§.§&K§;
   import §8K§.§ E§;
   import flash.events.EventDispatcher;
   import game.Balance;
   import ninjakiwi.mynk.MyNK;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   import org.osflash.signals.Signal;
   import premium.§6-§;
   import sound.§%'§;
   import sound.§^5§;
   import utils.ObjectHelper;
   
   public class Profile extends EventDispatcher
   {
      
      private var currentEnergy_:CryptScoreInt = new CryptScoreInt();
      
      private var maxEnergy_:CryptScoreInt = new CryptScoreInt();
      
      private var lastEnergyGainTime_:CryptScore = new CryptScore();
      
      private var medallions_:CryptScoreInt = new CryptScoreInt();
      
      private var battleScore_:CryptScoreInt = new CryptScoreInt();
      
      private var wins_:CryptScoreInt = new CryptScoreInt();
      
      private var losses_:CryptScoreInt = new CryptScoreInt();
      
      private var disconnects_:CryptScoreInt = new CryptScoreInt();
      
      private var battleHistory_:Vector.<BattleHistory> = new Vector.<BattleHistory>();
      
      private var randLoadoutWins_:CryptScoreInt = new CryptScoreInt();
      
      private var towersUnlocked_:Vector.<CryptScoreInt> = new Vector.<CryptScoreInt>();
      
      private var towerTier4sUnlocked_:Vector.<CryptScoreInt> = new Vector.<CryptScoreInt>();
      
      private var shopItemUses_:Vector.<CryptScoreInt> = new Vector.<CryptScoreInt>();
      
      private var decalsUnlocked_:Vector.<CryptScoreInt> = new Vector.<CryptScoreInt>();
      
      private var activeDecal_:CryptScoreInt = new CryptScoreInt();
      
      private var orc_:CryptScoreInt = new CryptScoreInt();
      
      private var bgmOn_:Boolean = true;
      
      private var sfxOn_:Boolean = true;
      
      private const BATTLE_HISTORY_LENGTH:int = 50;
      
      private var sigProfileReloaded:Signal = new Signal();
      
      private var sigBattleScoreChanged:Signal = new Signal();
      
      private var sigMedallionsChanged:Signal = new Signal();
      
      private var sigEnergyChanged:Signal = new Signal();
      
      private var sigMaxEnergyChanged:Signal = new Signal();
      
      private var sigShopItemUsesChanged:Signal = new Signal();
      
      private var sigWinsChanged:Signal = new Signal();
      
      private var sigLossesChanged:Signal = new Signal();
      
      private var needsToSave:Boolean = false;
      
      private var allowSave_:Boolean = true;
      
      private var maxEnergyShuldBe:int = 0;
      
      private var applyPurchasedItemQue:Vector.<int> = new Vector.<int>();
      
      private var applyAPrevPurchasedItemQue:Vector.<int> = new Vector.<int>();
      
      private var profileLoaded:Boolean = false;
      
      private var currentTime:Number = 0;
      
      private var addingEnergy:Boolean = false;
      
      private var settingGainTime:Boolean = false;
      
      private var energyInitzed:Boolean = false;
      
      public function Profile()
      {
         super();
         this.currentEnergy_ = new CryptScoreInt(100);
         this.maxEnergy_ = new CryptScoreInt(100);
         this.lastEnergyGainTime_ = new CryptScore(-1);
         this.wins_ = new CryptScoreInt();
         this.losses_ = new CryptScoreInt();
         this.orc_ = new CryptScoreInt();
      }
      
      public function resetDefault() : void
      {
         this.currentEnergy_ = new CryptScoreInt();
         this.maxEnergy_ = new CryptScoreInt();
         this.maxEnergy_.value = Balance.instance.STARTING_ENERGY.value;
         this.currentEnergy_.value = this.maxEnergy_.value;
         this.lastEnergyGainTime_ = new CryptScore(-1);
         this.wins_ = new CryptScoreInt();
         this.losses_ = new CryptScoreInt();
         this.disconnects_ = new CryptScoreInt();
         this.battleHistory_ = new Vector.<BattleHistory>();
         this.randLoadoutWins_ = new CryptScoreInt();
         this.medallions_ = new CryptScoreInt();
         this.towersUnlocked_ = new Vector.<CryptScoreInt>();
         this.towerTier4sUnlocked_ = new Vector.<CryptScoreInt>();
         this.shopItemUses_ = new Vector.<CryptScoreInt>();
         var _loc1_:int = 0;
         while(_loc1_ <= §?V§.instance.§0J§.§'K§.length)
         {
            this.shopItemUses_.push(new CryptScoreInt(0));
            _loc1_++;
         }
         this.decalsUnlocked_ = new Vector.<CryptScoreInt>();
         this.activeDecal_ = new CryptScoreInt();
         this.orc_ = new CryptScoreInt();
         this.bgmOn_ = true;
         this.sfxOn_ = true;
         §&K§.instance.§ Q§.orc = 0;
      }
      
      public function load(param1:String) : void
      {
         var i:int = 0;
         var json:String = param1;
         try
         {
            json = ObjectHelper.§#0§(json,"Infinity","0");
            this.resetDefault();
            ObjectHelper.§1P§(json,this);
            this.clearNKItemUses();
            this.profileLoaded = true;
            i = 0;
            while(i < this.applyPurchasedItemQue.length)
            {
               this.applyPurchasedItem(this.applyPurchasedItemQue[i]);
               i++;
            }
            this.applyPurchasedItemQue.splice(0,uint.MAX_VALUE);
            i = 0;
            while(i < this.applyAPrevPurchasedItemQue.length)
            {
               this.applyAPrevPurchasedItem(this.applyAPrevPurchasedItemQue[i]);
               i++;
            }
            this.applyAPrevPurchasedItemQue.splice(0,uint.MAX_VALUE);
            this.maxEnergyShuldBe = Balance.instance.STARTING_ENERGY.value + this.shopItemUses_[5].value * 10;
            this.initialiseEnergyConductors();
            this.updateSoundButtons();
            §&K§.instance.§#<§.§"M§();
            this.needsToSave = false;
            §&K§.instance.§ Q§.orc = this.orc.value;
            this.sigProfileReloaded.dispatch();
         }
         catch(e:Error)
         {
            MyNK.ey.user.track("COULDNTREADPROFILE","null",1,"null","null",true);
         }
      }
      
      public function save() : void
      {
         if(this.allowSave_ == false)
         {
            return;
         }
         if(MyNK.ey.user.data == null)
         {
            return;
         }
         MyNK.ey.user.data.stuff = ObjectHelper.§@O§(this);
         MyNK.ey.user.saveData(true);
      }
      
      public function saveDefaults() : void
      {
         this.resetDefault();
         this.save();
      }
      
      public function allowSave(param1:Boolean) : void
      {
         this.allowSave_ = param1;
      }
      
      public function isTowerUnlocked(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.towersUnlocked.length)
         {
            if(param1 == this.towersUnlocked[_loc2_].value)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function unlockTower(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.towersUnlocked.length)
         {
            if(param1 == this.towersUnlocked[_loc2_].value)
            {
               return;
            }
            _loc2_++;
         }
         this.towersUnlocked.push(new CryptScoreInt(param1));
         this.needsToSave = true;
      }
      
      public function isTowerTier4Unlocked(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.towerTier4sUnlocked.length)
         {
            if(param1 == this.towerTier4sUnlocked[_loc2_].value)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function unlockTowerTier4(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.towerTier4sUnlocked.length)
         {
            if(param1 == this.towerTier4sUnlocked[_loc2_].value)
            {
               return;
            }
            _loc2_++;
         }
         this.towerTier4sUnlocked.push(new CryptScoreInt(param1));
         this.needsToSave = true;
      }
      
      public function isDecalUnlocked(param1:int) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.decalsUnlocked.length)
         {
            if(param1 == this.decalsUnlocked[_loc2_].value)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function unlockDecal(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.decalsUnlocked.length)
         {
            if(param1 == this.decalsUnlocked[_loc2_].value)
            {
               return;
            }
            _loc2_++;
         }
         this.decalsUnlocked.push(new CryptScoreInt(param1));
         this.needsToSave = true;
      }
      
      public function setActiveDecal(param1:int) : void
      {
         this.activeDecal = param1;
         this.needsToSave = true;
      }
      
      public function initialiseEnergyConductors() : void
      {
         MyNK.ey.addEventListener(Msg.SERVER_TIME,this.updateEnergyLevels);
         MyNK.ey.getServerTime();
      }
      
      private function updateEnergyLevels(param1:*) : void
      {
         MyNK.ey.removeEventListener(Msg.SERVER_TIME,this.updateEnergyLevels);
         this.currentTime = param1.payload;
         if(this.lastEnergyGainTime == -1)
         {
            this.lastEnergyGainTime = this.currentTime;
         }
         var _loc2_:int = int((this.currentTime - this.lastEnergyGainTime) / Balance.instance.ENERGY_REGEN_TIME.value);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         this.currentEnergy += _loc2_;
         if(this.currentEnergy >= this.maxEnergy)
         {
            this.currentEnergy = this.maxEnergy;
            this.lastEnergyGainTime = -1;
         }
         else
         {
            this.lastEnergyGainTime += _loc2_ * Balance.instance.ENERGY_REGEN_TIME.value;
         }
         this.needsToSave = true;
         this.energyInitzed = true;
      }
      
      public function process(param1:Number) : void
      {
         if(this.needsToSave)
         {
            this.save();
            this.needsToSave = false;
         }
         if(!this.energyInitzed)
         {
            return;
         }
         if(this.currentEnergy > this.maxEnergy)
         {
            this.currentEnergy = this.maxEnergy;
            this.lastEnergyGainTime = -1;
            this.needsToSave = true;
         }
         else if(this.currentEnergy < this.maxEnergy)
         {
            if(this.lastEnergyGainTime == -1 && !this.settingGainTime)
            {
               MyNK.ey.addEventListener(Msg.SERVER_TIME,this.setEnergyGainTime);
               MyNK.ey.getServerTime();
               this.settingGainTime = true;
            }
            else
            {
               this.currentTime += param1;
               if(this.addingEnergy)
               {
                  return;
               }
               if(this.currentTime - this.lastEnergyGainTime > Balance.instance.ENERGY_REGEN_TIME.value)
               {
                  MyNK.ey.addEventListener(Msg.SERVER_TIME,this.confirmAddEnergy);
                  MyNK.ey.getServerTime();
                  this.addingEnergy = true;
               }
            }
         }
      }
      
      private function confirmAddEnergy(param1:*) : void
      {
         this.addingEnergy = false;
         MyNK.ey.removeEventListener(Msg.SERVER_TIME,this.confirmAddEnergy);
         this.currentTime = param1.payload;
         if(this.currentTime - this.lastEnergyGainTime > Balance.instance.ENERGY_REGEN_TIME.value)
         {
            this.currentEnergy += 1;
            this.lastEnergyGainTime = this.currentTime;
            if(this.currentEnergy == this.maxEnergy)
            {
               this.lastEnergyGainTime = -1;
            }
            this.needsToSave = true;
         }
      }
      
      public function useEnergy(param1:int) : void
      {
         this.currentEnergy -= param1;
         this.needsToSave = true;
      }
      
      public function addEnergy(param1:int) : void
      {
         this.currentEnergy += param1;
         if(this.currentEnergy >= this.maxEnergy)
         {
            this.currentEnergy = this.maxEnergy;
            this.lastEnergyGainTime = -1;
         }
         this.needsToSave = true;
      }
      
      private function setEnergyGainTime(param1:*) : void
      {
         this.settingGainTime = false;
         MyNK.ey.removeEventListener(Msg.SERVER_TIME,this.setEnergyGainTime);
         this.currentTime = param1.payload;
         this.lastEnergyGainTime = this.currentTime;
         this.needsToSave = true;
      }
      
      public function increaseMaxEnergyBy(param1:int) : void
      {
         this.maxEnergy += param1;
         this.currentEnergy += param1;
         this.needsToSave = true;
      }
      
      public function getSecondsUntilEnergyIncrement() : Number
      {
         if(this.lastEnergyGainTime == -1)
         {
            return 0;
         }
         return this.lastEnergyGainTime + Balance.instance.ENERGY_REGEN_TIME.value - this.currentTime;
      }
      
      private function updateSoundButtons() : void
      {
         §^5§.§27§ = this.sfxOn_;
         §%'§.§27§ = this.bgmOn_;
      }
      
      public function applyPurchasedItem(param1:int) : void
      {
         var _loc2_:§ E§ = null;
         if(!this.profileLoaded)
         {
            this.applyPurchasedItemQue.push(param1);
            return;
         }
         switch(param1)
         {
            case 1:
               this.addEnergy(50);
               break;
            case 2:
               this.addEnergy(100);
               break;
            case 3:
               this.addEnergy(500);
               break;
            case 4:
               this.addEnergy(1000);
               break;
            case 5:
               this.increaseMaxEnergyBy(10);
               break;
            case 6:
               this.increaseMaxEnergyBy(10);
               break;
            case 7:
               this.increaseMaxEnergyBy(500);
               break;
            case 8:
               MyNK.ey.user.updateCurrencyBalance();
               break;
            case 9:
               MyNK.ey.user.updateCurrencyBalance();
               break;
            case 10:
               MyNK.ey.user.updateCurrencyBalance();
               break;
            case 11:
               this.towersUnlocked_ = new Vector.<CryptScoreInt>();
               this.towerTier4sUnlocked_ = new Vector.<CryptScoreInt>();
               for each(_loc2_ in §?V§.instance.§+>§.towersInMenu)
               {
                  this.towersUnlocked.push(new CryptScoreInt(_loc2_.id));
                  this.towerTier4sUnlocked.push(new CryptScoreInt(_loc2_.id));
                  this.checkForTowerAchievements();
               }
         }
         ++this.shopItemUses[param1].value;
         this.sigShopItemUsesChanged.dispatch();
         this.needsToSave = true;
      }
      
      public function applyAPrevPurchasedItem(param1:int) : void
      {
         var _loc2_:§ E§ = null;
         if(!this.profileLoaded)
         {
            this.applyAPrevPurchasedItemQue.push(param1);
            return;
         }
         switch(param1)
         {
            case 5:
               this.maxEnergyShuldBe += 10;
               if(this.maxEnergyShuldBe > this.maxEnergy)
               {
                  this.maxEnergy = this.maxEnergyShuldBe;
               }
               break;
            case 6:
               this.maxEnergyShuldBe += 10;
               if(this.maxEnergyShuldBe > this.maxEnergy)
               {
                  this.maxEnergy = this.maxEnergyShuldBe;
               }
               break;
            case 7:
               this.maxEnergyShuldBe += 10;
               if(this.maxEnergyShuldBe > this.maxEnergy)
               {
                  this.maxEnergy = this.maxEnergyShuldBe;
               }
               break;
            case 11:
               this.towersUnlocked_ = new Vector.<CryptScoreInt>();
               this.towerTier4sUnlocked_ = new Vector.<CryptScoreInt>();
               for each(_loc2_ in §?V§.instance.§+>§.towersInMenu)
               {
                  this.towersUnlocked.push(new CryptScoreInt(_loc2_.id));
                  this.towerTier4sUnlocked.push(new CryptScoreInt(_loc2_.id));
                  this.checkForTowerAchievements();
               }
         }
         ++this.shopItemUses[param1].value;
         this.sigShopItemUsesChanged.dispatch();
         this.needsToSave = true;
      }
      
      private function clearNKItemUses() : void
      {
         var _loc2_:§6-§ = null;
         var _loc1_:int = 0;
         while(_loc1_ < §?V§.instance.§0J§.§'K§.length)
         {
            _loc2_ = §?V§.instance.§0J§.§'K§[_loc1_];
            if(_loc2_.§+5§ == §6-§.§^9§)
            {
               this.shopItemUses[_loc2_.id].value = 0;
            }
            _loc1_++;
         }
      }
      
      public function createBattleHistory(param1:String, param2:int) : void
      {
         var _loc3_:BattleHistory = new BattleHistory();
         _loc3_.opponentID = param1;
         _loc3_.opponentBattleScore = param2;
         this.battleHistory_.push(_loc3_);
         this.needsToSave = true;
      }
      
      public function modBattleHistoryRL(param1:Boolean) : void
      {
         var _loc2_:BattleHistory = this.battleHistory_[this.battleHistory_.length - 1];
         _loc2_.randomLoadout = param1;
         this.needsToSave = true;
      }
      
      public function modBattleHistoryWL(param1:Boolean) : void
      {
         var _loc2_:BattleHistory = this.battleHistory_[this.battleHistory_.length - 1];
         _loc2_.won = param1;
         this.checkForAchievements();
         this.needsToSave = true;
      }
      
      private function checkForAchievements() : void
      {
         var _loc6_:BattleHistory = null;
         var _loc1_:BattleHistory = this.battleHistory_[this.battleHistory_.length - 1];
         MyNK.ey.user.setAchievement(210,this.battleScore / §?V§.instance.§+>§.§#M§[1] * 100);
         MyNK.ey.user.setAchievement(211,this.battleScore / §?V§.instance.§+>§.§#M§[2] * 100);
         MyNK.ey.user.setAchievement(212,this.battleScore / §?V§.instance.§+>§.§#M§[3] * 100);
         if(_loc1_.won == true)
         {
            MyNK.ey.user.setAchievement(213,100);
         }
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<BattleHistory> = this.battleHistory_.length <= 100 ? this.battleHistory_ : this.battleHistory_.slice(this.battleHistory_.length - 100);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = _loc4_[_loc5_];
            if(_loc6_.won == true)
            {
               if(++_loc2_ > _loc3_)
               {
                  _loc3_ = _loc2_;
               }
               if(_loc3_ >= 5)
               {
                  break;
               }
            }
            else
            {
               _loc2_ = 0;
            }
            _loc5_++;
         }
         MyNK.ey.user.setAchievement(214,_loc3_ / 5 * 100);
         _loc2_ = 0;
         _loc3_ = 0;
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = _loc4_[_loc5_];
            if(_loc6_.won == true)
            {
               if(++_loc2_ > _loc3_)
               {
                  _loc3_ = _loc2_;
               }
               if(_loc3_ >= 20)
               {
                  break;
               }
            }
            else
            {
               _loc2_ = 0;
            }
            _loc5_++;
         }
         MyNK.ey.user.setAchievement(215,_loc3_ / 20 * 100);
         if(_loc1_.won == true && _loc1_.opponentBattleScore < this.battleScore)
         {
            MyNK.ey.user.setAchievement(216,100);
         }
         if(_loc1_.won == true && _loc1_.opponentBattleScore > this.battleScore)
         {
            MyNK.ey.user.setAchievement(217,100);
         }
         if(_loc1_.won == true && _loc1_.opponentBattleScore > 250)
         {
            MyNK.ey.user.setAchievement(218,100);
         }
         if(_loc1_.won == true && _loc1_.randomLoadout == true)
         {
            MyNK.ey.user.setAchievement(219,100);
            ++this.randLoadoutWins_.value;
            MyNK.ey.user.setAchievement(220,this.randLoadoutWins / 25 * 100);
         }
         if(this.battleHistory_.length > 50)
         {
            this.battleHistory_.splice(0,this.battleHistory_.length - 50);
         }
      }
      
      public function checkForTowerAchievements() : void
      {
         var _loc4_:§ E§ = null;
         var _loc5_:int = 0;
         var _loc1_:int = 0;
         var _loc2_:int = int(§?V§.instance.§+>§.towersInMenu.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = §?V§.instance.§+>§.towersInMenu[_loc3_];
            _loc5_ = 0;
            while(_loc5_ < this.towerTier4sUnlocked.length)
            {
               if(this.towerTier4sUnlocked[_loc5_].value == _loc4_.id)
               {
                  _loc1_++;
               }
               _loc5_++;
            }
            _loc3_++;
         }
         MyNK.ey.user.setAchievement(221,_loc1_ / _loc2_ * 100);
      }
      
      public function get currentEnergy() : int
      {
         return this.currentEnergy_.value;
      }
      
      public function set currentEnergy(param1:int) : void
      {
         if(this.currentEnergy_.value == param1)
         {
            return;
         }
         this.currentEnergy_.value = param1;
         this.sigEnergyChanged.dispatch(param1);
      }
      
      public function get maxEnergy() : int
      {
         return this.maxEnergy_.value;
      }
      
      public function set maxEnergy(param1:int) : void
      {
         if(this.maxEnergy_.value == param1)
         {
            return;
         }
         this.maxEnergy_.value = param1;
         this.sigMaxEnergyChanged.dispatch(param1);
      }
      
      public function get lastEnergyGainTime() : Number
      {
         return this.lastEnergyGainTime_.value;
      }
      
      public function set lastEnergyGainTime(param1:Number) : void
      {
         this.lastEnergyGainTime_.value = param1;
      }
      
      public function get medallions() : int
      {
         return this.medallions_.value;
      }
      
      public function set medallions(param1:int) : void
      {
         if(this.medallions_.value == param1)
         {
            return;
         }
         this.medallions_.value = param1;
         this.sigMedallionsChanged.dispatch(param1);
         this.needsToSave = true;
      }
      
      public function get battleScore() : int
      {
         return this.wins * Balance.instance.BATTLESCORE_FOR_WIN.value + this.losses * Balance.instance.BATTLESCORE_FOR_LOSS.value;
      }
      
      public function set battleScore(param1:int) : void
      {
      }
      
      public function get wins() : int
      {
         return this.wins_.value;
      }
      
      public function set wins(param1:int) : void
      {
         if(this.wins_.value == param1)
         {
            return;
         }
         this.wins_.value = param1;
         this.sigBattleScoreChanged.dispatch(param1);
         this.sigWinsChanged.dispatch(param1);
         this.needsToSave = true;
         this.save();
      }
      
      public function get losses() : int
      {
         return this.losses_.value;
      }
      
      public function set losses(param1:int) : void
      {
         if(this.losses_.value == param1)
         {
            return;
         }
         this.losses_.value = param1;
         this.sigBattleScoreChanged.dispatch(param1);
         this.sigLossesChanged.dispatch(param1);
         this.needsToSave = true;
         this.save();
      }
      
      public function get disconnects() : int
      {
         return this.disconnects_.value;
      }
      
      public function set disconnects(param1:int) : void
      {
         this.disconnects_.value = param1;
         this.needsToSave = true;
      }
      
      public function get battleHistory() : Vector.<BattleHistory>
      {
         return this.battleHistory_;
      }
      
      public function set battleHistory(param1:Vector.<BattleHistory>) : void
      {
         this.battleHistory_ = param1;
      }
      
      public function get randLoadoutWins() : int
      {
         return this.randLoadoutWins_.value;
      }
      
      public function set randLoadoutWins(param1:int) : void
      {
         this.randLoadoutWins_.value = param1;
      }
      
      public function get towersUnlocked() : Vector.<CryptScoreInt>
      {
         return this.towersUnlocked_;
      }
      
      public function set towersUnlocked(param1:Vector.<CryptScoreInt>) : void
      {
         this.towersUnlocked_ = param1;
      }
      
      public function get towerTier4sUnlocked() : Vector.<CryptScoreInt>
      {
         return this.towerTier4sUnlocked_;
      }
      
      public function set towerTier4sUnlocked(param1:Vector.<CryptScoreInt>) : void
      {
         this.towerTier4sUnlocked_ = param1;
      }
      
      public function get shopItemUses() : Vector.<CryptScoreInt>
      {
         return this.shopItemUses_;
      }
      
      public function set shopItemUses(param1:Vector.<CryptScoreInt>) : void
      {
         this.shopItemUses_ = param1;
      }
      
      public function get decalsUnlocked() : Vector.<CryptScoreInt>
      {
         return this.decalsUnlocked_;
      }
      
      public function set decalsUnlocked(param1:Vector.<CryptScoreInt>) : void
      {
         this.decalsUnlocked_ = param1;
      }
      
      public function get activeDecal() : int
      {
         return this.activeDecal_.value;
      }
      
      public function set activeDecal(param1:int) : void
      {
         this.activeDecal_.value = param1;
      }
      
      public function get bgmOn() : Boolean
      {
         return this.bgmOn_;
      }
      
      public function set bgmOn(param1:Boolean) : void
      {
         this.bgmOn_ = param1;
         this.needsToSave = true;
      }
      
      public function get sfxOn() : Boolean
      {
         return this.sfxOn_;
      }
      
      public function set sfxOn(param1:Boolean) : void
      {
         this.sfxOn_ = param1;
         this.needsToSave = true;
      }
      
      public function get orc() : CryptScoreInt
      {
         return this.orc_;
      }
      
      public function set orc(param1:CryptScoreInt) : void
      {
         this.orc_.value = param1.value;
      }
      
      public function SigProfileReloaded() : Signal
      {
         return this.sigProfileReloaded;
      }
      
      public function SigBattleScoreChanged() : Signal
      {
         return this.sigBattleScoreChanged;
      }
      
      public function SigMedallionsChanged() : Signal
      {
         return this.sigMedallionsChanged;
      }
      
      public function SigEnergyChanged() : Signal
      {
         return this.sigEnergyChanged;
      }
      
      public function SigMaxEnergyChanged() : Signal
      {
         return this.sigMaxEnergyChanged;
      }
      
      public function SigShopItemUsesChanged() : Signal
      {
         return this.sigShopItemUsesChanged;
      }
      
      public function SigWinsChanged() : Signal
      {
         return this.sigWinsChanged;
      }
      
      public function SigLossesChanged() : Signal
      {
         return this.sigLossesChanged;
      }
   }
}

