package § ,§
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.MovieClip;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class §#%§
   {
      
      public static const §2>§:Number = 0.25;
      
      private var §9T§:Number = 0.25;
      
      private var §8W§:Number = 0.25;
      
      public var testMap:BitmapData;
      
      public var inverseTestMap:BitmapData;
      
      private var §-5§:BitmapData;
      
      public function §#%§(param1:MovieClip)
      {
         super();
         this.testMap = new BitmapData(Math.ceil(§?V§.§-?§.width * §2>§),Math.ceil(§?V§.§-?§.height * §2>§),true,0);
         this.§9T§ = this.testMap.width / §?V§.§-?§.width;
         this.§8W§ = this.testMap.height / §?V§.§-?§.height;
         var _loc3_:Matrix = new Matrix();
         _loc3_.translate(param1.x,param1.y);
         _loc3_.scale(this.§9T§,this.§8W§);
         this.testMap.fillRect(new Rectangle(0,0,this.testMap.width,this.testMap.height),16777215);
         this.testMap.drawWithQuality(param1,_loc3_,null,null,null,false,"low");
         this.inverseTestMap = new BitmapData(this.testMap.width,this.testMap.height);
         this.inverseTestMap.fillRect(new Rectangle(0,0,this.testMap.width,this.testMap.height),4294967295);
         this.inverseTestMap.drawWithQuality(new Bitmap(this.testMap),null,null,BlendMode.ERASE,null,false,"low");
         this.§-5§ = new BitmapData(this.testMap.width,this.testMap.height);
      }
      
      public function isWithin(param1:MovieClip) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle(0,0,this.§-5§.width,this.§-5§.height);
         this.§-5§.fillRect(_loc2_,0);
         var _loc3_:Matrix = new Matrix();
         _loc3_.translate(param1.x,param1.y);
         _loc3_.scale(this.§9T§,this.§8W§);
         this.§-5§.drawWithQuality(param1,_loc3_,null,null,null,false,"low");
         var _loc4_:Point = new Point(0,0);
         return !this.inverseTestMap.hitTest(_loc4_,1,this.§-5§,_loc4_,1);
      }
      
      public function isOutside(param1:MovieClip) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle(0,0,this.§-5§.width,this.§-5§.height);
         this.§-5§.fillRect(_loc2_,0);
         var _loc3_:Matrix = new Matrix();
         _loc3_.translate(param1.x,param1.y);
         _loc3_.scale(this.§9T§,this.§8W§);
         this.§-5§.drawWithQuality(param1,_loc3_,null,null,null,false,"low");
         var _loc4_:Point = new Point(0,0);
         return !this.testMap.hitTest(_loc4_,1,this.§-5§,_loc4_,1);
      }
   }
}

