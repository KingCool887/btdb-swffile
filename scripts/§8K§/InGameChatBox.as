package §8K§
{
   import flash.display.MovieClip;
   import flash.events.FocusEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   
   public class InGameChatBox
   {
      
      private const §7D§:Number = -10;
      
      public var mc:MovieClip;
      
      public var §'Q§:Boolean = false;
      
      public var §>F§:Boolean = false;
      
      public var §"9§:Boolean = false;
      
      public var §"S§:Boolean = false;
      
      private var §9L§:Vector.<FadingTextField> = new Vector.<FadingTextField>();
      
      private var §+,§:TextFormat;
      
      private var §1Y§:TextField;
      
      private var name_txt:TextField;
      
      public function InGameChatBox()
      {
         super();
      }
      
      public function §,B§(param1:MovieClip) : void
      {
         this.mc = param1;
         this.§+,§ = new TextFormat("Calibri",16,16777215,true);
         var _loc2_:GlowFilter = new GlowFilter(0,1,1.5,1.5,1000,2);
         this.name_txt = new TextField();
         this.name_txt.defaultTextFormat = this.§+,§;
         this.name_txt.height = 5;
         this.name_txt.multiline = false;
         this.name_txt.autoSize = TextFieldAutoSize.LEFT;
         this.name_txt.wordWrap = false;
         this.name_txt.selectable = false;
         this.name_txt.y = param1.container.y + 4;
         this.name_txt.filters = [_loc2_];
         this.§1Y§ = new TextField();
         this.§1Y§.defaultTextFormat = this.§+,§;
         this.§1Y§.height = 26;
         this.§1Y§.selectable = true;
         this.§1Y§.multiline = false;
         this.§1Y§.autoSize = TextFieldAutoSize.NONE;
         this.§1Y§.wordWrap = false;
         this.§1Y§.type = TextFieldType.INPUT;
         this.§1Y§.y = param1.container.y + 4;
         this.§1Y§.filters = [_loc2_];
         this.§1Y§.maxChars = 150;
         param1.addChild(this.name_txt);
         param1.addChild(this.§1Y§);
         param1.mouseEnabled = false;
      }
      
      public function reset() : void
      {
         while(this.mc.container.numChildren > 0)
         {
            this.mc.container.removeChildAt(0);
         }
         this.§9L§ = new Vector.<FadingTextField>();
         this.§"9§ = false;
         this.§"S§ = false;
         this.mc.muteChat1.visible = false;
         this.mc.muteChat1.checked = false;
         this.§!C§();
      }
      
      public function §[F§() : void
      {
         this.§"9§ = !this.§"9§;
         this.mc.muteChat1.checked = this.§"9§;
         if(this.§"9§)
         {
            this.name_txt.visible = false;
            this.§1Y§.visible = false;
            this.mc.container.visible = false;
            this.mc.scroll_bar.visible = false;
            if(this.§>F§)
            {
               this.§!C§();
            }
         }
         else
         {
            this.name_txt.visible = true;
            this.§1Y§.visible = true;
            this.mc.container.visible = true;
            this.mc.scroll_bar.visible = true;
            if(!this.§>F§)
            {
               this.§>T§();
            }
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.mc.visible = param1;
      }
      
      public function §""§() : void
      {
         this.§'Q§ = true;
         this.mc.muteChat1.visible = true;
         if(this.§"9§)
         {
            return;
         }
         if(!this.§>F§)
         {
            this.§>T§();
         }
      }
      
      public function close() : void
      {
         this.§'Q§ = false;
         this.mc.muteChat1.visible = false;
         if(this.§"9§)
         {
            return;
         }
         if(this.§>F§)
         {
            this.§!C§();
         }
      }
      
      public function §!C§() : void
      {
         this.§>F§ = false;
         this.mc.container.mouseChildren = false;
         this.mc.container.mouseEnabled = false;
         this.mc.scroll_bar.SetPosition(1);
         this.mc.scroll_bar.visible = false;
         this.§1Y§.visible = false;
         this.name_txt.visible = false;
         this.§1Y§.removeEventListener(FocusEvent.FOCUS_OUT,this.§`Q§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§9L§.length)
         {
            this.§9L§[_loc1_].forceVis = false;
            _loc1_++;
         }
      }
      
      public function §>T§() : void
      {
         this.§>F§ = true;
         this.mc.container.mouseChildren = true;
         this.mc.container.mouseEnabled = true;
         this.mc.scroll_bar.SetScrollableObject(this.mc.container,this.mc.mask_mc);
         this.mc.scroll_bar.SetPosition(1);
         this.mc.scroll_bar.visible = true;
         this.§1Y§.visible = true;
         this.name_txt.visible = true;
         this.§1Y§.text = "";
         this.mc.stage.focus = this.§1Y§;
         this.§1Y§.addEventListener(FocusEvent.FOCUS_OUT,this.§`Q§);
         var _loc1_:int = 0;
         while(_loc1_ < this.§9L§.length)
         {
            this.§9L§[_loc1_].forceVis = true;
            _loc1_++;
         }
      }
      
      private function §`Q§(param1:FocusEvent) : void
      {
         this.mc.stage.focus = this.§1Y§;
      }
      
      public function §"J§(param1:String, param2:String) : void
      {
         this.name_txt.htmlText = "<font color=\'" + param2 + "\'><b>" + param1 + "</b></font>" + ": ";
         this.§1Y§.x = this.name_txt.x + this.name_txt.width - 4;
         this.§1Y§.width = this.mc.mask_mc.width - this.name_txt.width;
      }
      
      public function §0R§() : String
      {
         return this.§1Y§.text;
      }
      
      public function §2!§(param1:String, param2:String, param3:String) : void
      {
         if(param1 == null || param1 == "")
         {
            return;
         }
         param1 = param1.split("<").join("&lt;").split(">").join("&gt;");
         var _loc4_:String = "<font color=\'" + param3 + "\'>" + param2 + "</font>" + ": " + param1;
         var _loc5_:FadingTextField = new FadingTextField(_loc4_,this.mc.mask_mc.width - 5,this.§+,§,5,4,this.§>F§);
         _loc5_.textField.y = this.mc.container.height + -10;
         var _loc6_:Boolean = this.mc.scroll_bar.GetPosition() != 1;
         this.§9L§.push(_loc5_);
         this.mc.container.addChild(_loc5_.textField);
         this.mc.scroll_bar.SetScrollableObject(this.mc.container,this.mc.mask_mc);
         if(!_loc6_)
         {
            this.mc.scroll_bar.SetPosition(1);
         }
      }
      
      public function process(param1:Number) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.§9L§.length)
         {
            this.§9L§[_loc2_].process(param1);
            _loc2_++;
         }
      }
   }
}

import flash.filters.GlowFilter;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

class FadingTextField
{
   
   public var textField:TextField;
   
   private var stayTimer:Number = 0;
   
   private var stayTime:Number = 0;
   
   private var fadeTimer:Number = 0;
   
   private var fadeTime:Number = 0;
   
   public var forceVis:Boolean = false;
   
   public function FadingTextField(param1:String, param2:Number, param3:TextFormat, param4:Number, param5:Number, param6:Boolean)
   {
      super();
      this.forceVis = param6;
      this.textField = new TextField();
      this.textField.defaultTextFormat = param3;
      this.textField.height = 5;
      this.textField.width = param2;
      this.textField.multiline = true;
      this.textField.autoSize = TextFieldAutoSize.LEFT;
      this.textField.wordWrap = true;
      this.textField.selectable = false;
      this.textField.htmlText = param1;
      this.textField.mouseEnabled = false;
      var _loc7_:GlowFilter = new GlowFilter(0,1,1.5,1.5,10000,2);
      this.textField.filters = [_loc7_];
      this.stayTime = param4;
      this.fadeTime = param5;
   }
   
   public function process(param1:Number) : void
   {
      if(this.stayTimer < this.stayTime)
      {
         this.stayTimer += param1;
      }
      else if(this.fadeTimer < this.fadeTime)
      {
         this.fadeTimer += param1;
         this.textField.alpha = 1 - this.fadeTimer / this.fadeTime;
      }
      else
      {
         this.textField.visible = false;
      }
      if(this.forceVis)
      {
         this.textField.visible = true;
         this.textField.alpha = 1;
      }
   }
}
