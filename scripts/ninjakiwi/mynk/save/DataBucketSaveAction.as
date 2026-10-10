package ninjakiwi.mynk.save
{
   import flash.events.EventDispatcher;
   import ninjakiwi.mynk.MyNK;
   import ninjakiwi.mynk.events.DataBucketEvent;
   import ninjakiwi.mynk.nk.NK_Gateway;
   import ninjakiwi.mynk.sharedDefinitions.ArgumentPlaceholder;
   
   public class DataBucketSaveAction extends EventDispatcher
   {
      
      private var _dataBucket:DataBucket;
      
      private var _transID:int;
      
      private var _callback:Function;
      
      public function DataBucketSaveAction(param1:DataBucket, param2:int, param3:Function = null)
      {
         super();
         this._dataBucket = param1;
         this._transID = param2;
         this._callback = param3;
         this.saveBucket();
      }
      
      public function saveBucket() : void
      {
         var _loc1_:Object = this._dataBucket.writeObject();
         NK_Gateway(MyNK.ey).callServer("game.save_additional_data",this.saveCallback,ArgumentPlaceholder.USER_ID,ArgumentPlaceholder.USER_TOKEN,ArgumentPlaceholder.GAME_NAME,_loc1_);
      }
      
      private function saveCallback(param1:Object) : void
      {
         var _loc5_:int = 0;
         var _loc2_:Boolean = param1 is Array && param1.length >= 2;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:* = param1[1];
         var _loc4_:Boolean = _loc3_ is int;
         if(_loc4_)
         {
            _loc5_ = _loc3_;
            if(this._dataBucket.transID_LastOK < _loc5_)
            {
               this._dataBucket.transID_LastOK = _loc5_;
            }
            dispatchEvent(new DataBucketEvent(DataBucketEvent.SAVE,this._dataBucket,this._dataBucket.id));
            this.processCallback(true);
         }
         else if(this._dataBucket.transID_LastOK > this._transID)
         {
            dispatchEvent(new DataBucketEvent(DataBucketEvent.SAVE,this._dataBucket,this._dataBucket.id));
            this.processCallback(true);
         }
         else
         {
            this._dataBucket.transID = this._dataBucket.transID_LastOK;
            dispatchEvent(new DataBucketEvent(DataBucketEvent.SAVE_ERROR,this._dataBucket,this._dataBucket.id));
            this.processCallback(false);
         }
      }
      
      private function processCallback(param1:Boolean) : void
      {
         if(this._callback !== null)
         {
            CallbackValidator.applyCallback(this._callback,[param1,this._dataBucket],"Please use function signature: onBucketSavedCallback( success:Boolean, bucket:DataBucket )");
         }
      }
   }
}

