package ninjakiwi.mynk.events
{
   import flash.events.Event;
   import ninjakiwi.mynk.save.DataBucket;
   
   public class DataBucketEvent extends Event
   {
      
      public static const OPEN:String = "DataBucketEvent::OPEN";
      
      public static const OPEN_ERROR:String = "DataBucketEvent::OPEN_ERROR";
      
      public static const SAVE:String = "DataBucketEvent::SAVE";
      
      public static const SAVE_ERROR:String = "DataBucketEvent::SAVE_ERROR";
      
      public var bucket:DataBucket;
      
      public var bucketNum:int;
      
      public function DataBucketEvent(param1:String, param2:DataBucket, param3:int)
      {
         this.bucket = param2;
         this.bucketNum = param3;
         super(param1);
      }
   }
}

