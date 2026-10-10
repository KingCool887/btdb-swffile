package ninjakiwi.mynk.kongregate
{
   import flash.events.Event;
   import ninjakiwi.mynk.IGatewayUser;
   import ninjakiwi.mynk.IStore;
   import ninjakiwi.mynk.NKEvent;
   import ninjakiwi.mynk.net.RemoteLoginSystem;
   import ninjakiwi.mynk.sharedDefinitions.Msg;
   
   public class Kong_Store implements IStore
   {
      
      private var _login:RemoteLoginSystem;
      
      private var _user:IGatewayUser;
      
      public function Kong_Store(param1:RemoteLoginSystem, param2:IGatewayUser)
      {
         super();
         this._login = param1;
         this._user = param2;
         this._user.saveBoss.addEventListener(Msg.DATA_READY,this.dataReadyHandler);
      }
      
      public function showItem(param1:*) : void
      {
         var itemID:* = param1;
         this._login.api.callNested("mtx.purchaseItems",[String(itemID)],function(param1:Object):void
         {
            purchaseResultHandler(itemID,param1);
         });
      }
      
      public function showItems(param1:Array) : void
      {
         var id:String = null;
         var quan:int = 0;
         var j:int = 0;
         var itemTuples:Array = param1;
         var itemIDs:Array = [];
         var i:int = 0;
         while(i < itemTuples.length)
         {
            id = itemTuples[i][0];
            quan = int(itemTuples[i][1]);
            j = 0;
            while(j < quan)
            {
               itemIDs.push(id);
               j++;
            }
            i++;
         }
         this._login.api.callNested("mtx.purchaseItems",itemIDs,function(param1:Object):void
         {
            purchaseMultiResultHandler(itemTuples,param1);
         });
      }
      
      private function purchaseResultHandler(param1:String, param2:Object) : void
      {
         var _loc3_:String = null;
         if(param2.success)
         {
            this._login.api.dispatchEvent(new NKEvent(Msg.NEW_ITEM,{
               "id":param1,
               "quantity":1
            }));
         }
         else
         {
            _loc3_ = param2.error;
            if(_loc3_ != null)
            {
            }
         }
      }
      
      private function purchaseMultiResultHandler(param1:Array, param2:Object) : void
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         if(param2.success)
         {
            for each(_loc3_ in param1)
            {
               this._login.api.dispatchEvent(new NKEvent(Msg.NEW_ITEM,{
                  "id":_loc3_[0],
                  "quantity":_loc3_[1]
               }));
            }
         }
         else
         {
            _loc4_ = param2.error;
            if(_loc4_ != null)
            {
            }
         }
      }
      
      public function showStore(param1:Boolean = false) : void
      {
      }
      
      public function showSpecials() : void
      {
      }
      
      public function getItemInfo(param1:Array = null) : Array
      {
         return [];
      }
      
      private function dataReadyHandler(param1:Event) : void
      {
         this._login.api.callNested("mtx.requestUserItemList",null,this.userInventoryHandler);
      }
      
      private function loggedInEnterHandler(param1:Event) : void
      {
         this._login.api.callNested("mtx.requestUserItemList",null,this.userInventoryHandler);
      }
      
      private function userInventoryHandler(param1:Object) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:Object = null;
         var _loc5_:NKEvent = null;
         var _loc6_:String = null;
         var _loc7_:NKEvent = null;
         var _loc8_:int = 0;
         if(param1.success)
         {
            _loc2_ = param1.data;
            _loc3_ = {};
            for each(_loc4_ in _loc2_)
            {
               _loc6_ = _loc4_.identifier;
               _loc7_ = _loc3_[_loc6_];
               if(_loc7_ == null)
               {
                  _loc7_ = new NKEvent(Msg.OLD_ITEM,{
                     "id":_loc4_.identifier,
                     "quantity":0
                  });
               }
               _loc8_ = int(_loc7_.payload.quantity);
               _loc7_.payload.quantity = _loc8_ + 1;
               _loc3_[_loc6_] = _loc7_;
            }
            for each(_loc5_ in _loc3_)
            {
               this._login.api.dispatchEvent(_loc5_);
            }
         }
      }
   }
}

