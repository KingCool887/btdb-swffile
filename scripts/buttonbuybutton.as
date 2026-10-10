package
{
   import display.ui.Button;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3759")]
   public dynamic class buttonbuybutton extends Button
   {
      
      public var sellLabel:TextField;
      
      public function buttonbuybutton()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,19,this.frame20);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame10() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         stop();
      }
   }
}

