package assets.gui
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol16")]
   public dynamic class Tooltip extends MovieClip
   {
      
      public var bg:MovieClip;
      
      public var label:TextField;
      
      public function Tooltip()
      {
         super();
      }
   }
}

