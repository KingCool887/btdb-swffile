package state
{
   public class §01§
   {
      
      public var §>+§:State = null;
      
      public function §01§()
      {
         super();
      }
      
      public function message(param1:§9M§) : *
      {
         var _loc2_:State = null;
         if(this.§>+§ != null)
         {
            _loc2_ = this.§>+§.message(param1);
            if(_loc2_ != null)
            {
               this.§^W§(_loc2_,param1);
            }
         }
      }
      
      public function §^W§(param1:State, param2:§9M§) : *
      {
         if(this.§>+§ != null)
         {
            this.§>+§.exit();
         }
         this.§>+§ = param1;
         this.§>+§.§!Y§ = this;
         this.§>+§.enter(param2);
      }
   }
}

