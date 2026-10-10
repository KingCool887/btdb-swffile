package ninjakiwi.mynk.save
{
   import flash.events.EventDispatcher;
   import ninjakiwi.mynk.events.DataBucketEvent;
   import ninjakiwi.mynk.net.LoginSystem;
   
   public class BucketAccess extends EventDispatcher
   {
      
      private static const IS_OPENING:String = "isOpening";
      
      private var _loginSystem:LoginSystem;
      
      private var _buckets:Array = [];
      
      private var _accessActions:Array = [];
      
      public function BucketAccess(param1:LoginSystem)
      {
         super();
         this._loginSystem = param1;
      }
      
      public function bucketIsOpen(param1:int) : Boolean
      {
         return this._buckets[param1] != null;
      }
      
      public function getBucket(param1:int, param2:Function = null) : void
      {
         var _loc3_:AccessAction = null;
         if(this.bucketIsOpen(param1))
         {
            CallbackValidator.applyCallback(param2,[this._buckets[param1]],"openBucket() - Please use callback function signature: onGetBucket( bucket:DataBucket )");
            return;
         }
         _loc3_ = this._accessActions[param1];
         if(_loc3_ !== null)
         {
            _loc3_.addCallback(param2);
            return;
         }
         _loc3_ = this._accessActions[param1] = new AccessAction(param1,param2);
         _loc3_.addEventListener(DataBucketEvent.OPEN,this.bucketOpenHandler,false,0,true);
      }
      
      internal function bucketOpenHandler(param1:DataBucketEvent) : void
      {
         var _loc2_:DataBucket = param1.bucket;
         this._buckets[_loc2_.id] = _loc2_;
         this._accessActions[_loc2_.id] = null;
         var _loc3_:AccessAction = AccessAction(param1.currentTarget);
         _loc3_.removeEventListener(DataBucketEvent.OPEN,this.bucketOpenHandler,false);
      }
   }
}

import flash.events.EventDispatcher;
import ninjakiwi.mynk.MyNK;
import ninjakiwi.mynk.events.DataBucketEvent;
import ninjakiwi.mynk.nk.NK_Gateway;
import ninjakiwi.mynk.save.CallbackValidator;
import ninjakiwi.mynk.save.DataBucket;
import ninjakiwi.mynk.sharedDefinitions.ArgumentPlaceholder;

class AccessAction extends EventDispatcher
{
   
   private var _bucketNum:int;
   
   private var _callbacks:Array = [];
   
   public function AccessAction(param1:int, param2:Function)
   {
      super();
      this._bucketNum = param1;
      this._callbacks.push(param2);
      this.openBucket();
   }
   
   public function addCallback(param1:Function) : void
   {
      this._callbacks.push(param1);
   }
   
   private function openBucket() : void
   {
      NK_Gateway(MyNK.ey).callServer("game.get_additional_data",this.onOpen,ArgumentPlaceholder.USER_ID,ArgumentPlaceholder.GAME_NAME,this._bucketNum);
   }
   
   private function onOpen(param1:Object) : void
   {
      var _loc3_:Object = null;
      var _loc4_:DataBucket = null;
      if(param1 != null && param1[0] != null)
      {
         _loc3_ = param1[0];
         _loc4_ = new DataBucket(_loc3_);
         dispatchEvent(new DataBucketEvent(DataBucketEvent.OPEN,_loc4_,this._bucketNum));
         this.processCallbacks(_loc4_);
      }
      else
      {
         dispatchEvent(new DataBucketEvent(DataBucketEvent.OPEN_ERROR,null,this._bucketNum));
         this.processCallbacks(null);
      }
   }
   
   private function processCallbacks(param1:DataBucket) : void
   {
      var _loc2_:int = 0;
      var _loc3_:Function = null;
      _loc2_ = 0;
      while(_loc2_ < this._callbacks.length)
      {
         _loc3_ = this._callbacks[_loc2_];
         if(_loc3_ !== null)
         {
            CallbackValidator.applyCallback(_loc3_,[param1],"openBucket() - Please use callback function signature: onGetBucket( bucket:DataBucket )");
         }
         _loc2_++;
      }
   }
   
   public function get bucketNum() : int
   {
      return this._bucketNum;
   }
}
