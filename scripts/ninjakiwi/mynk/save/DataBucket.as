package ninjakiwi.mynk.save
{
   import ninjakiwi.mynk.events.DataBucketEvent;
   
   public class DataBucket extends SerialisableData
   {
      
      private static const PROPERTIES:Vector.<EncodingDef> = new <EncodingDef>[new EncodingDef("data","_contents",true),new EncodingDef("transid","transID",false),new EncodingDef("addint","_id",false)];
      
      internal var _contents:Object = {};
      
      internal var _id:int = -1;
      
      internal var transID:int;
      
      internal var transID_LastOK:int;
      
      private var _isModified:Boolean = false;
      
      public function DataBucket(param1:Object = null)
      {
         super(PROPERTIES,param1);
         this.transID_LastOK = this.transID;
         PROPERTIES.push();
         this._id = param1.addint;
      }
      
      public function read() : Object
      {
         return this._contents;
      }
      
      public function write(param1:Object) : void
      {
         this._contents = param1;
         this._isModified = true;
      }
      
      public function save(param1:Function = null) : void
      {
         if(!this._isModified)
         {
            if(param1 !== null)
            {
               param1.call(null,true,this);
            }
            return;
         }
         var _loc2_:DataBucketSaveAction = new DataBucketSaveAction(this,this.transID,param1);
         this.addListenersToSaveAction(_loc2_);
         this._isModified = false;
         ++this.transID;
      }
      
      private function addListenersToSaveAction(param1:DataBucketSaveAction) : void
      {
         param1.addEventListener(DataBucketEvent.SAVE,this.onBucketSaved);
         param1.addEventListener(DataBucketEvent.SAVE_ERROR,this.onBucketSaveError);
      }
      
      private function removeListenersFromSaveAction(param1:DataBucketSaveAction) : void
      {
         param1.removeEventListener(DataBucketEvent.SAVE,this.onBucketSaveError);
         param1.removeEventListener(DataBucketEvent.SAVE,this.onBucketSaved);
      }
      
      private function onBucketSaveError(param1:DataBucketEvent) : void
      {
         this.removeListenersFromSaveAction(DataBucketSaveAction(param1.currentTarget));
         this._isModified = true;
      }
      
      private function onBucketSaved(param1:DataBucketEvent) : void
      {
         this.removeListenersFromSaveAction(DataBucketSaveAction(param1.currentTarget));
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}

