package ninjakiwi.mynk.nk
{
   import ninjakiwi.mynk.IStore;
   import ninjakiwi.mynk.net.RemoteLoginSystem;
   
   public class NK_Store implements IStore
   {
      
      private var _login:RemoteLoginSystem;
      
      public function NK_Store(param1:RemoteLoginSystem)
      {
         super();
         this._login = param1;
      }
      
      public function showItem(param1:*) : void
      {
         this._login.api.call("showItem",param1);
      }
      
      public function showItems(param1:Array) : void
      {
         this._login.api.call("showItems",param1);
      }
      
      public function showStore(param1:Boolean = false) : void
      {
         this._login.api.call("showStoreShop",param1);
      }
      
      public function showSpecials() : void
      {
         this._login.api.call("showSpecials");
      }
      
      public function getItemInfo(param1:Array = null) : Array
      {
         return this._login.api.call("getItemInfo",param1);
      }
   }
}

