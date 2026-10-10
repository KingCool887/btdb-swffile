package Menus_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3476")]
   public dynamic class EndGameScreen_155 extends MovieClip
   {
      
      public var ok_btn:panelBack_btn;
      
      public var battlescore_txt:TextField;
      
      public var medallion_txt:TextField;
      
      public function EndGameScreen_155()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}

