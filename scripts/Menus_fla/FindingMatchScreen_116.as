package Menus_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3327")]
   public dynamic class FindingMatchScreen_116 extends MovieClip
   {
      
      public var time_box:MovieClip;
      
      public var finding_ico:MovieClip;
      
      public var cancel_btn:FindingMatchCancelBtn;
      
      public function FindingMatchScreen_116()
      {
         super();
         addFrameScript(24,this.frame25,45,this.frame46);
      }
      
      internal function frame25() : *
      {
         dispatchEvent(new Event("EnterFinished"));
         stop();
      }
      
      internal function frame46() : *
      {
         dispatchEvent(new Event("ExitFinished"));
         stop();
      }
   }
}

