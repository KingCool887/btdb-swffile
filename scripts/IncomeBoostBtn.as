package
{
   import display.ui.Button;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol3739")]
   public dynamic class IncomeBoostBtn extends Button
   {
      
      public var incomeBoost:TextField;
      
      public var cooldown_mc:MovieClip;
      
      public var cost:TextField;
      
      public function IncomeBoostBtn()
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

