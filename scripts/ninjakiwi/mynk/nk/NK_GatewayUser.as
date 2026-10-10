package ninjakiwi.mynk.nk
{
   import flash.events.Event;
   import ninjakiwi.mynk.IGatewayUser;
   import ninjakiwi.mynk.net.RemoteLoginSystem;
   import ninjakiwi.mynk.save.BucketAccess;
   import ninjakiwi.mynk.save.SaveBoss;
   import ninjakiwi.mynk.save.UserData;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   
   public class NK_GatewayUser implements IGatewayUser
   {
      
      private var _login:RemoteLoginSystem;
      
      private var _saveBoss:SaveBoss;
      
      private var _inGameCurrency:int;
      
      private var _bucketAccess:BucketAccess;
      
      public function NK_GatewayUser(param1:RemoteLoginSystem)
      {
         super();
         this._login = param1;
         this._saveBoss = new SaveBoss(param1);
         this._bucketAccess = new BucketAccess(param1);
         this._login.api.addEventListener(Msg.CURR_BALANCE_UPDATE,this.inGameCurrencyBalanceHandler);
      }
      
      public function get bucketAccess() : BucketAccess
      {
         return this._bucketAccess;
      }
      
      public function get name() : String
      {
         return "Player";
      }
      
      public function get id() : String
      {
         return "1";
      }
      
      public function get token() : String
      {
         return "devtoken";
      }
      
      public function isLoggedIn() : Boolean
      {
         return true;
      }
      
      public function enforceLogin() : void
      {
         this._login.api.call("enforcedLogin");
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
         this._saveBoss.saveData(param1);
      }
      
      public function get dataWasChanged() : Boolean
      {
         return this._saveBoss.dataWasChanged;
      }
      
      public function get saveBoss() : SaveBoss
      {
         return this._saveBoss;
      }
      
      public function track(param1:String, param2:String, param3:Number, param4:String, param5:String, param6:Boolean = false) : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("track",param1,param2,param3,param4,param5,param6);
         }
      }
      
      public function showLeaderboard(param1:*) : void
      {
         this._login.api.call("showLeaderboard",param1);
      }
      
      public function saveScore(param1:Number, param2:Function, param3:Boolean, param4:*) : void
      {
         if(isNaN(param1))
         {
            param1 = 0;
         }
         if(this.isLoggedIn())
         {
            this._login.api.call("setScore",param1,param2,param3,int(param4));
         }
      }
      
      public function showAchievements() : void
      {
         this._login.api.call("showAchievements");
      }
      
      public function setAchievement(param1:int, param2:int) : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("setAchievement",param1,param2);
         }
      }
      
      public function addAwesome(param1:int) : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("addAwesome",param1);
         }
      }
      
      public function checkReward(param1:String) : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("checkReward",param1);
         }
      }
      
      public function claimReward(param1:String) : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("claimReward",param1);
         }
      }
      
      public function redeemCode(param1:String) : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("redeemCode",param1);
         }
      }
      
      public function getConsecutiveLoginDaysCount() : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("getConsecutiveLoginDaysCount");
         }
      }
      
      public function get currencyBalance() : int
      {
         return this._inGameCurrency;
      }
      
      public function updateCurrencyBalance() : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("getCurrencyBalance");
         }
      }
      
      public function buyCurrencyItems(param1:Array) : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("buyCurrencyItems",param1);
         }
      }
      
      public function getCurrency(param1:int, param2:int, param3:String) : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("getCurrency",param1,param2,param3);
         }
      }
      
      public function getCurrencyInventory() : void
      {
         if(this.isLoggedIn())
         {
            this._login.api.call("getPremiumCurrencyInventoryForGame");
         }
      }
      
      private function inGameCurrencyBalanceHandler(param1:Event) : void
      {
         this._inGameCurrency = int(param1["payload"]);
      }
   }
}

