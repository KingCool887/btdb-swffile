package
{
   import display.ui.Button;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3804")]
   public dynamic class buttonactivate extends Button
   {
      
      public var sellLabel:TextField;
      
      public function buttonactivate()
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

