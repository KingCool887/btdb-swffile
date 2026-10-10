package utils
{
   import com.adobe.serialization.json.JSON;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.filters.BlurFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.system.ApplicationDomain;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import mx.utils.DescribeTypeCache;
   
   public class ObjectHelper
   {
      
      private static const §+X§:String = "uniqueID___";
      
      private static const §`"§:String = "objectType___";
      
      private static var § N§:Dictionary = new Dictionary();
      
      private static var §^D§:Array = [];
      
      private static var §=-§:int = 0;
      
      public function ObjectHelper()
      {
         super();
      }
      
      public static function §@O§(param1:Object, param2:int = 1) : String
      {
         §7C§(§ N§);
         §^D§.length = 0;
         return §';§(param1,param2);
      }
      
      public static function §1P§(param1:String, param2:Object = null) : Object
      {
         var data:Object;
         var o:String = param1;
         var baseObj:Object = param2;
         §7C§(§ N§);
         §^D§.length = 0;
         data = {};
         try
         {
            data = com.adobe.serialization.json.JSON.decode(o);
         }
         catch(e:Error)
         {
         }
         return §,T§(data,baseObj);
      }
      
      private static function §';§(param1:Object, param2:int = 1) : String
      {
         var _loc5_:int = 0;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:XMLList = null;
         var _loc9_:XML = null;
         var _loc10_:XMLList = null;
         var _loc11_:String = null;
         var _loc12_:String = null;
         var _loc13_:String = null;
         var _loc3_:String = "";
         var _loc4_:Boolean = param1 is int || param1 is uint || param1 is Number || param1 is Boolean;
         if(param1 != null && !_loc4_ && § N§[param1] != undefined)
         {
            _loc5_ = CachedObject(§ N§[param1]).id;
         }
         else
         {
            _loc5_ = §=-§++;
            § N§[param1] = new CachedObject(param1,_loc5_);
         }
         if(param1 == null)
         {
            _loc3_ = "null";
         }
         else if(_loc4_)
         {
            _loc3_ = param1.toString();
            if(_loc3_ == "NaN")
            {
               _loc3_ = "0";
            }
            if(_loc3_ == "Infinity")
            {
               _loc3_ = "0";
            }
         }
         else
         {
            if(param1 is String)
            {
               return "\"" + §#0§(§#0§(§#0§(param1 as String,"\"","\\\""),"\n","\\n"),"\t","\\t") + "\"";
            }
            if(param1 is Class)
            {
               _loc3_ = "\"class:" + getQualifiedClassName(param1) + "\"";
            }
            else if(getQualifiedClassName(param1).indexOf("Object") == 0)
            {
               _loc3_ = "{\n";
               _loc3_ += "\"" + §+X§ + "\": " + _loc5_ + ",\n" + "\"" + §`"§ + "\": \"" + getQualifiedClassName(param1) + "\", \n";
               for(_loc6_ in param1)
               {
                  _loc3_ += "\"" + _loc6_ + "\" : ";
                  _loc3_ += §';§(param1[_loc6_],param2 + 1) + ", \n";
               }
               if(_loc3_.lastIndexOf(", \n") != -1)
               {
                  _loc3_ = _loc3_.substr(0,_loc3_.lastIndexOf(", \n"));
               }
               _loc3_ += "\n}";
            }
            else if(getQualifiedClassName(param1).indexOf("__AS3__.vec::Vector.<") == 0 || getQualifiedClassName(param1).indexOf("Array") != -1)
            {
               _loc3_ = "[\n";
               for each(_loc7_ in param1)
               {
                  _loc3_ += §';§(_loc7_,param2 + 1) + ", \n";
               }
               if(_loc3_.lastIndexOf(", \n") != -1)
               {
                  _loc3_ = _loc3_.substr(0,_loc3_.lastIndexOf(", \n"));
               }
               _loc3_ += "\n]";
               _loc3_ = _loc3_.split("\n").join("\n\t");
               if(_loc3_.lastIndexOf("\t]") != -1)
               {
                  _loc3_ = _loc3_.substr(0,_loc3_.lastIndexOf("\t")) + "]";
               }
               _loc3_ = "{\n " + "\"" + §+X§ + "\": " + _loc5_ + ",\n" + "  \"" + §`"§ + "\": \"" + getQualifiedClassName(param1) + "\", \n\"data\": " + _loc3_ + "\n}";
            }
            else
            {
               _loc3_ = "{\n";
               _loc3_ += "\"" + §+X§ + "\": " + _loc5_ + ",\n" + "\"" + §`"§ + "\": \"" + getQualifiedClassName(param1) + "\", \n";
               _loc8_ = DescribeTypeCache.describeType(param1).typeDescription.variable;
               for each(_loc9_ in _loc8_)
               {
                  _loc11_ = _loc9_.attribute("name");
                  _loc12_ = §';§(param1[_loc11_],param2 + 1);
                  if(_loc12_ != "null")
                  {
                     _loc3_ += "\"" + _loc11_ + "\": " + _loc12_ + ", \n";
                  }
               }
               _loc10_ = DescribeTypeCache.describeType(param1).typeDescription.accessor;
               for each(_loc9_ in _loc10_)
               {
                  _loc11_ = _loc9_.attribute("name");
                  _loc12_ = §';§(param1[_loc11_],param2 + 1);
                  if(_loc12_ != "null")
                  {
                     _loc3_ += "\"" + _loc11_ + "\": " + _loc12_ + ", \n";
                  }
               }
               if(_loc3_.lastIndexOf(", \n") != -1)
               {
                  _loc3_ = _loc3_.substr(0,_loc3_.lastIndexOf(", \n"));
               }
               _loc3_ += "\n}";
            }
         }
         if(param2 != 0)
         {
            _loc13_ = "\n\t";
            _loc3_ = _loc3_.split("\n").join(_loc13_);
            if(_loc3_.lastIndexOf("\t}") != -1)
            {
               _loc3_ = _loc3_.substr(0,_loc3_.lastIndexOf("\t")) + "}";
            }
         }
         return _loc3_;
      }
      
      private static function §,T§(param1:Object, param2:Object = null) : Object
      {
         var _loc3_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:* = undefined;
         var _loc9_:Class = null;
         var _loc10_:String = null;
         if(Boolean(param1) && param1.hasOwnProperty(§+X§))
         {
            _loc3_ = int(param1[§+X§]);
            if(§^D§[_loc3_] != undefined)
            {
               return §^D§[_loc3_];
            }
         }
         var _loc4_:Boolean = param1 is int || param1 is uint || param1 is Number || param1 is Boolean;
         if(param1 == null)
         {
            return null;
         }
         if(_loc4_)
         {
            return param1;
         }
         if(param1 is String)
         {
            if(param1.indexOf("class:") == 0)
            {
               _loc6_ = param1.substr("class:".length);
               if(!ApplicationDomain.currentDomain.hasDefinition(_loc6_))
               {
                  return null;
               }
               return getDefinitionByName(_loc6_) as Class;
            }
            return §#0§(§#0§(§#0§(param1 as String,"\\\"","\""),"\\n","\n"),"\\t","\t");
         }
         if(param1 is Array)
         {
            _loc7_ = new Array();
            for each(_loc8_ in param1)
            {
               param1.push(§,T§(_loc8_));
            }
            return _loc7_;
         }
         if(!ApplicationDomain.currentDomain.hasDefinition(param1[§`"§]))
         {
            return null;
         }
         var _loc5_:* = null;
         if(param2 == null)
         {
            _loc9_ = getDefinitionByName(param1[§`"§]) as Class;
            if(_loc9_ == null)
            {
            }
            _loc5_ = new _loc9_();
         }
         else
         {
            _loc5_ = param2;
         }
         if(getQualifiedClassName(_loc5_).indexOf("__AS3__.vec::Vector.<") == 0 || getQualifiedClassName(_loc5_).indexOf("Array") == 0)
         {
            for each(_loc8_ in param1.data)
            {
               _loc5_.push(§,T§(_loc8_));
            }
         }
         else
         {
            for(_loc10_ in param1)
            {
               if(!(_loc10_ == §`"§ || _loc10_ == §+X§ || !isDynamic(_loc5_) && !(_loc10_ in _loc5_)))
               {
                  _loc5_[_loc10_] = §,T§(param1[_loc10_]);
               }
            }
         }
         §^D§[_loc3_] = _loc5_;
         return _loc5_;
      }
      
      public static function isDynamic(param1:*) : Boolean
      {
         var _loc2_:XML = DescribeTypeCache.describeType(param1).typeDescription;
         return _loc2_.@isDynamic.toString() == "true";
      }
      
      public static function §#0§(param1:String, param2:String, param3:String) : String
      {
         return param1.split(param2).join(param3);
      }
      
      public static function §7C§(param1:Dictionary) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in param1)
         {
            delete param1[_loc2_];
         }
      }
      
      public static function §'A§(param1:Object, param2:* = 0) : Object
      {
         var _loc4_:* = undefined;
         var _loc5_:XML = null;
         var _loc6_:String = null;
         if(!param1)
         {
            return param1;
         }
         if(param1 is int || param1 is uint || param1 is Number || param1 is String || param1 is Boolean || param1 is Class)
         {
            return param1;
         }
         var _loc3_:* = new (getDefinitionByName(getQualifiedClassName(param1)) as Class)();
         if(getQualifiedClassName(param1).indexOf("__AS3__.vec::Vector.<") == 0 || getQualifiedClassName(param1).indexOf("Array") != -1)
         {
            for each(_loc4_ in param1)
            {
               _loc3_.push(§'A§(_loc4_,1));
            }
         }
         else
         {
            var _loc9_:XML = describeType(param1);
            for each(_loc5_ in _loc9_.variable)
            {
               _loc6_ = _loc5_.attribute("name");
               _loc3_[_loc6_] = §'A§(param1[_loc6_],1);
            }
            for each(_loc5_ in _loc9_.accessor)
            {
               _loc6_ = _loc5_.attribute("name");
               _loc3_[_loc6_] = §'A§(param1[_loc6_],1);
            }
         }
         return _loc3_;
      }
      
      public static function §-O§(param1:DisplayObject, param2:Number) : *
      {
         var _loc4_:int = 0;
         var _loc5_:DropShadowFilter = null;
         var _loc6_:BlurFilter = null;
         var _loc7_:GlowFilter = null;
         var _loc8_:DisplayObjectContainer = null;
         var _loc9_:Array = param1.filters;
         var _loc3_:Array = _loc9_ as Array;
         _loc4_ = 0;
         while(_loc4_ < _loc9_.length)
         {
            if(_loc9_[_loc4_] is DropShadowFilter)
            {
               _loc5_ = _loc3_[_loc4_] as DropShadowFilter;
               _loc5_.blurX *= param2;
               _loc5_.blurY *= param2;
               _loc5_.distance *= param2;
            }
            else if(_loc9_[_loc4_] is BlurFilter)
            {
               _loc6_ = _loc3_[_loc4_] as BlurFilter;
               _loc6_.blurX *= param2;
               _loc6_.blurY *= param2;
            }
            else if(_loc9_[_loc4_] is GlowFilter)
            {
               _loc7_ = _loc3_[_loc4_] as GlowFilter;
               _loc7_.blurX *= param2;
               _loc7_.blurY *= param2;
            }
            _loc4_++;
         }
         if(_loc9_.length > 0)
         {
            param1.filters = _loc3_;
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc8_ = param1 as DisplayObjectContainer;
            _loc4_ = 0;
            while(_loc4_ < _loc8_.numChildren)
            {
               §-O§(_loc8_.getChildAt(_loc4_),param2);
               _loc4_++;
            }
         }
      }
   }
}

class CachedObject
{
   
   public var id:int;
   
   public var object:*;
   
   public function CachedObject(param1:*, param2:int)
   {
      super();
      this.object = param1;
      this.id = param2;
   }
}
