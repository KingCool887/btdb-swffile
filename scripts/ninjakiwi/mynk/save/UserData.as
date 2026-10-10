package ninjakiwi.mynk.save
{
   public class UserData extends SerialisableData
   {
      
      private static const PROPERTIES:Vector.<EncodingDef> = new <EncodingDef>[new EncodingDef("gxp","xp",false),new EncodingDef("gcash","cash",false),new EncodingDef("glevel","level",false),new EncodingDef("gnum","number",false),new EncodingDef("data","stuff",true)];
      
      public var xp:Number = 0;
      
      public var cash:int = 0;
      
      public var level:int = 0;
      
      public var number:Number = 0;
      
      public var stuff:Object = {};
      
      public function UserData(param1:Object = null)
      {
         super(PROPERTIES,param1);
      }
      
      public function isBlank() : Boolean
      {
         return equals(new UserData());
      }
   }
}

