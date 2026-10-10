package
{
   import display.ui.Button;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3822")]
   public dynamic class buttonbankbutton extends Button
   {
      
      public var balance_txt:TextField;
      
      public function buttonbankbutton()
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

