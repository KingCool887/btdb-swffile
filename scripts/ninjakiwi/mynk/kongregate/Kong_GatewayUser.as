package ninjakiwi.mynk.kongregate
{
   import flash.events.Event;
   import ninjakiwi.mynk.IGatewayUser;
   import ninjakiwi.mynk.net.RemoteLoginSystem;
   import ninjakiwi.mynk.save.SaveBoss;
   import ninjakiwi.mynk.save.UserData;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   
   public class Kong_GatewayUser implements IGatewayUser
   {
      
      private var _kongLogin:RemoteLoginSystem;
      
      private var _nkLogin:RemoteLoginSystem;
      
      private var _saveBoss:SaveBoss;
      
      private var _inGameCurrency:int;
      
      public function Kong_GatewayUser(param1:RemoteLoginSystem, param2:RemoteLoginSystem)
      {
         super();
         this._kongLogin = param1;
         this._nkLogin = param2;
         this._saveBoss = new SaveBoss(param2);
         this._nkLogin.api.addEventListener(Msg.CURR_BALANCE_UPDATE,this.inGameCurrencyBalanceHandler);
      }
      
      public function get name() : String
      {
         var _loc1_:String = this._kongLogin.api.callNested("services.getUsername");
         if(_loc1_ == "" || _loc1_.indexOf("Guest") >= 0)
         {
            return null;
         }
         return _loc1_;
      }
      
      public function get id() : String
      {
         return this._kongLogin.api.callNested("services.getUserId");
      }
      
      public function get token() : String
      {
         return this._kongLogin.api.callNested("services.getGameAuthToken");
      }
      
      public function isLoggedIn() : Boolean
      {
         return this._kongLogin.state.isCurrently(this._kongLogin.state.LOGGED_IN);
      }
      
      public function enforceLogin() : void
      {
      }
      
      public function get data() : UserData
      {
         return this._saveBoss.data;
      }
      
      public function set data(param1:UserData) : void
      {
         this._saveBoss.data = param1;
      }
      
      public function saveData(param1:Boolean) : void
      {
         var _loc2_:Boolean = this._kongLogin.state.isCurrently(this._kongLogin.state.LOGGED_IN);
         var _loc3_:Boolean = this._nkLogin.state.isCurrently(this._nkLogin.state.LOGGED_IN);
         if(_loc2_ == _loc3_)
         {
            this._saveBoss.saveData(param1);
         }
         else
         {
            this.saveErrorMessage(_loc2_,_loc3_);
         }
      }
      
      public function get dataWasChanged() : Boolean
      {
         return this._saveBoss.dataWasChanged;
      }
      
      public function get saveBoss() : SaveBoss
      {
         return this._saveBoss;
      }
      
      private function saveErrorMessage(param1:Boolean, param2:Boolean) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(param1)
         {
            _loc3_ = "in";
         }
         else
         {
            _loc3_ = "out";
         }
         if(param2)
         {
            _loc4_ = "in";
         }
         else
         {
            _loc4_ = "out";
         }
      }
      
      public function track(param1:String, param2:String, param3:Number, param4:String, param5:String, param6:Boolean = false) : void
      {
         if(this.isLoggedIn())
         {
            this._nkLogin.api.call("track",param1,param2,param3,param4,param5,param6);
         }
      }
      
      public function showLeaderboard(param1:*) : void
      {
      }
      
      public function saveScore(param1:Number, param2:Function, param3:Boolean, param4:*) : void
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         if(this.isLoggedIn())
         {
            _loc5_ = param1;
            if(_loc5_ < 0)
            {
               _loc5_ = 0;
            }
            _loc6_ = param4;
            this._kongLogin.api.callNested("stats.submit",_loc6_,_loc5_);
         }
      }
      
      public function showAchievements() : void
      {
      }
      
      public function setAchievement(param1:int, param2:int) : void
      {
         if(this._nkLogin.state.isCurrently(this._nkLogin.state.LOGGED_IN))
         {
            this._nkLogin.api.call("setAchievement",param1,param2);
         }
      }
      
      public function addAwesome(param1:int) : void
      {
      }
      
      public function checkReward(param1:String) : void
      {
         if(this._nkLogin.state.isCurrently(this._nkLogin.state.LOGGED_IN))
         {
            this._nkLogin.api.call("checkReward",param1);
         }
      }
      
      public function claimReward(param1:String) : void
      {
         if(this._nkLogin.state.isCurrently(this._nkLogin.state.LOGGED_IN))
         {
            this._nkLogin.api.call("claimReward",param1);
         }
      }
      
      public function redeemCode(param1:String) : void
      {
         if(this._nkLogin.state.isCurrently(this._nkLogin.state.LOGGED_IN))
         {
            this._nkLogin.api.call("redeemCode",param1);
         }
      }
      
      public function getConsecutiveLoginDaysCount() : void
      {
         if(this._nkLogin.state.isCurrently(this._nkLogin.state.LOGGED_IN))
         {
            this._nkLogin.api.call("getConsecutiveLoginDaysCount");
         }
      }
      
      public function get currencyBalance() : int
      {
         return this._inGameCurrency;
      }
      
      public function updateCurrencyBalance() : void
      {
         if(this._nkLogin.state.isCurrently(this._nkLogin.state.LOGGED_IN))
         {
            this._nkLogin.api.call("getCurrencyBalance");
         }
      }
      
      public function buyCurrencyItems(param1:Array) : void
      {
         if(this._nkLogin.state.isCurrently(this._nkLogin.state.LOGGED_IN))
         {
            this._nkLogin.api.call("buyCurrencyItems",param1);
         }
      }
      
      public function getCurrency(param1:int, param2:int, param3:String) : void
      {
         if(this._nkLogin.state.isCurrently(this._nkLogin.state.LOGGED_IN))
         {
            this._nkLogin.api.call("getCurrency",param1,param2,param3);
         }
      }
      
      public function getCurrencyInventory() : void
      {
         if(this._nkLogin.state.isCurrently(this._nkLogin.state.LOGGED_IN))
         {
            this._nkLogin.api.call("getPremiumCurrencyInventoryForGame");
         }
      }
      
      private function inGameCurrencyBalanceHandler(param1:Event) : void
      {
         this._inGameCurrency = int(param1["payload"]);
      }
   }
}

