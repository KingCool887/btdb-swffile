package weapons
{
   import §8U§.§52§;
   import §;M§.§"L§;
   import events.PropertyModEvent;
   import towers.Tower;
   
   public class SingleNailGun extends Single
   {
      
      private var index_:int = 0;
      
      public function SingleNailGun(param1:String = null)
      {
         super(param1);
      }
      
      public function set index(param1:int) : void
      {
         if(this.index_ != param1)
         {
            this.index_ = param1;
            dispatchEvent(new PropertyModEvent("index"));
         }
      }
      
      public function get index() : int
      {
         return this.index_;
      }
      
      public function Index(param1:int) : SingleNailGun
      {
         this.index = param1;
         return this;
      }
      
      override public function execute(param1:Tower, param2:§"L§, param3:§"L§, param4:§52§ = null) : void
      {
         if(param1.def.id == "CleansingFoam" || param1.def.id == "BloonTrap")
         {
            param1.addonClips[this.index].gotoAndPlay(1);
         }
         super.execute(param1,param2,param3,param4);
      }
   }
}

