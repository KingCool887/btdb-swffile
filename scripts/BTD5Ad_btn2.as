package
{
   import display.ui.Button;
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3030")]
   public dynamic class BTD5Ad_btn2 extends Button
   {
      
      public var img_cont:MovieClip;
      
      public function BTD5Ad_btn2()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame2() : *
      {
         stop();
      }
      
      internal function frame3() : *
      {
         stop();
      }
   }
}

