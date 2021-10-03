package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskData;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
   import com.sulake.habbo.room.object.RoomPlaneData;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomVisualization extends RoomObjectSpriteVisualization
   {
      
      public static const const_1180:int = 13421772;
      
      private static const const_1079:int = 16777215;
      
      public static const const_1201:int = 10066329;
      
      private static const const_1080:int = 13421772;
      
      public static const const_1309:int = 16777215;
      
      private static const const_1424:int = 0;
      
      public static const const_1166:int = 16777215;
      
      private static const const_1081:int = 10066329;
      
      private static const const_1078:int = 10066329;
      
      public static const const_1368:int = 13421772;
       
      
      private var var_1454:int = 0;
      
      private var var_1349:String = null;
      
      private var var_1852:int = 255;
      
      protected var _data:RoomVisualizationData = null;
      
      private var _assetLibrary:AssetLibrary = null;
      
      private var var_1350:String = null;
      
      private var var_1851:int = -1000;
      
      private var var_996:uint = 16777215;
      
      private var var_1843:Boolean = true;
      
      private var var_398:Array;
      
      private var var_1303:int = -1;
      
      private var var_101:Array;
      
      private var var_559:Rectangle = null;
      
      private var var_1847:int = 255;
      
      private var var_1846:Boolean = false;
      
      private var var_1849:int = 255;
      
      private var var_1848:String = null;
      
      private const const_1628:int = 250;
      
      private var var_77:RoomPlaneParser = null;
      
      private var var_1850:Number = 0;
      
      private var var_1844:Number = 0;
      
      private var var_560:Array;
      
      private var _floorType:String = null;
      
      private var var_397:RoomPlaneBitmapMaskParser = null;
      
      private var var_1068:Number = 0;
      
      private var var_1845:Number = 0;
      
      public function RoomVisualization()
      {
         var_101 = [];
         var_398 = [];
         var_560 = [];
         super();
         _assetLibrary = new AssetLibrary("room visualization");
         var_77 = new RoomPlaneParser();
         var_397 = new RoomPlaneBitmapMaskParser();
         Randomizer.setSeed(123);
         Randomizer.setSeed(124);
      }
      
      private function getLandscapeHeight() : Number
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_77.planeCount)
         {
            _loc3_ = var_77.getPlaneType(_loc2_);
            if(_loc3_ == RoomPlaneData.const_266)
            {
               _loc4_ = var_77.getPlaneRightSide(_loc2_);
               if(_loc4_.length > _loc1_)
               {
                  _loc1_ = Number(_loc4_.length);
               }
            }
            _loc2_++;
         }
         if(_loc1_ > 5)
         {
            _loc1_ = 5;
         }
         return _loc1_;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         reset();
         if(param1 == null || !(param1 is RoomVisualizationData))
         {
            return false;
         }
         _data = param1 as RoomVisualizationData;
         _data.initializeAssetCollection(assetCollection);
         return true;
      }
      
      protected function initializeRoomPlanes() : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         if(var_1846)
         {
            return;
         }
         var _loc1_:IRoomObject = object;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:String = _loc1_.getModel().getString(RoomObjectVariableEnum.const_837);
         if(!var_77.initializeFromXML(new XML(_loc2_)))
         {
            return;
         }
         var _loc3_:Number = getLandscapeWidth();
         var _loc4_:Number = getLandscapeHeight();
         var _loc5_:* = 0;
         var _loc6_:int = _loc1_.getModel().getNumber(RoomObjectVariableEnum.const_861);
         var _loc7_:int = 0;
         while(_loc7_ < var_77.planeCount)
         {
            _loc8_ = var_77.getPlaneLocation(_loc7_);
            _loc9_ = var_77.getPlaneLeftSide(_loc7_);
            _loc10_ = var_77.getPlaneRightSide(_loc7_);
            _loc11_ = var_77.getPlaneSecondaryNormals(_loc7_);
            _loc12_ = var_77.getPlaneType(_loc7_);
            _loc13_ = null;
            if(!(_loc8_ != null && _loc9_ != null && _loc10_ != null))
            {
               return;
            }
            _loc14_ = Vector3d.crossProduct(_loc9_,_loc10_);
            _loc6_ = _loc6_ * 7613 + 517;
            _loc13_ = null;
            if(_loc12_ == RoomPlaneData.const_147)
            {
               _loc13_ = new RoomPlane(_loc1_.getLocation(),_loc8_,_loc9_,_loc10_,RoomPlane.const_189,true,_loc11_,_loc6_);
               if(_loc14_.z != 0)
               {
                  _loc13_.color = const_1309;
               }
               else
               {
                  _loc13_.color = const_1180;
               }
               if(_loc9_.length < 1 || _loc10_.length < 1)
               {
                  _loc13_.hasTexture = false;
               }
               if(_data != null)
               {
                  _loc13_.rasterizer = _data.floorRasterizer;
               }
            }
            else if(_loc12_ == RoomPlaneData.const_138)
            {
               _loc13_ = new RoomPlane(_loc1_.getLocation(),_loc8_,_loc9_,_loc10_,RoomPlane.const_270,true,_loc11_,_loc6_);
               if(_loc9_.length < 1 || _loc10_.length < 1)
               {
                  _loc13_.hasTexture = false;
               }
               if(_loc14_.x == 0 && _loc14_.y == 0)
               {
                  _loc13_.color = const_1078;
               }
               else if(_loc14_.y > 0)
               {
                  _loc13_.color = const_1079;
               }
               else if(_loc14_.y == 0)
               {
                  _loc13_.color = const_1080;
               }
               else
               {
                  _loc13_.color = const_1081;
               }
               if(_data != null)
               {
                  _loc13_.rasterizer = _data.wallRasterizer;
               }
            }
            else if(_loc12_ == RoomPlaneData.const_266)
            {
               _loc13_ = new RoomPlane(_loc1_.getLocation(),_loc8_,_loc9_,_loc10_,RoomPlane.const_188,true,_loc11_,_loc6_,_loc5_,0,_loc3_,_loc4_);
               if(_loc14_.y > 0)
               {
                  _loc13_.color = const_1166;
               }
               else if(_loc14_.y == 0)
               {
                  _loc13_.color = const_1368;
               }
               else
               {
                  _loc13_.color = const_1201;
               }
               if(_data != null)
               {
                  _loc13_.rasterizer = _data.landscapeRasterizer;
               }
               _loc5_ += _loc9_.length;
            }
            if(_loc13_ != null)
            {
               _loc13_.maskManager = _data.maskManager;
               _loc15_ = 0;
               while(_loc15_ < var_77.getPlaneMaskCount(_loc7_))
               {
                  _loc16_ = var_77.getPlaneMaskLeftSideLoc(_loc7_,_loc15_);
                  _loc17_ = var_77.getPlaneMaskRightSideLoc(_loc7_,_loc15_);
                  _loc18_ = var_77.getPlaneMaskLeftSideLength(_loc7_,_loc15_);
                  _loc19_ = var_77.getPlaneMaskRightSideLength(_loc7_,_loc15_);
                  _loc13_.addRectangleMask(_loc16_,_loc17_,_loc18_,_loc19_);
                  _loc15_++;
               }
               var_101.push(_loc13_);
            }
            _loc7_++;
         }
         var_1846 = true;
         defineSprites();
      }
      
      public function get planeCount() : int
      {
         return var_101.length;
      }
      
      override public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         super.dispose();
         if(_assetLibrary != null)
         {
            _loc1_ = 0;
            while(_loc1_ < _assetLibrary.numAssets)
            {
               _loc2_ = _assetLibrary.getAssetByIndex(_loc1_);
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            _assetLibrary.dispose();
            _assetLibrary = null;
         }
         if(var_101 != null)
         {
            _loc3_ = 0;
            while(_loc3_ < var_101.length)
            {
               _loc4_ = var_101[_loc3_] as RoomPlane;
               if(_loc4_ != null)
               {
                  _loc4_.dispose();
               }
               _loc3_++;
            }
            var_101 = null;
         }
         var_398 = null;
         var_560 = null;
         if(var_77 != null)
         {
            var_77.dispose();
            var_77 = null;
         }
         if(var_397 != null)
         {
            var_397.dispose();
            var_397 = null;
         }
         if(_data != null)
         {
            _data.clearCache();
            _data = null;
         }
      }
      
      protected function defineSprites() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc1_:int = 0;
         createSprites(_loc1_);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = var_101[_loc2_] as RoomPlane;
            _loc4_ = getSprite(_loc2_);
            if(_loc4_ != null && _loc3_ != null && _loc3_.leftSide != null && _loc3_.rightSide != null)
            {
               if(_loc3_.type == RoomPlane.const_270 && (_loc3_.leftSide.length < 1 || _loc3_.rightSide.length < 1))
               {
                  _loc4_.capturesMouse = false;
               }
               else
               {
                  _loc4_.capturesMouse = true;
               }
               _loc4_.tag = "plane@" + (_loc2_ + 1);
            }
            _loc2_++;
         }
      }
      
      public function get floorRelativeDepth() : Number
      {
         return 100.1;
      }
      
      public function get wallRelativeDepth() : Number
      {
         return 100.5;
      }
      
      override public function get boundingRectangle() : Rectangle
      {
         if(var_559 == null)
         {
            var_559 = super.boundingRectangle;
         }
         return new Rectangle(var_559.x,var_559.y,var_559.width,var_559.height);
      }
      
      protected function updatePlaneMasks(param1:String) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:XML = XML(param1);
         var_397.initialize(_loc2_);
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < var_101.length)
         {
            _loc3_ = var_101[_loc4_] as RoomPlane;
            if(_loc3_ != null)
            {
               _loc3_.resetBitmapMasks();
            }
            _loc4_++;
         }
         var _loc5_:int = 0;
         while(_loc5_ < var_397.maskCount)
         {
            _loc6_ = var_397.getMaskType(_loc5_);
            _loc7_ = var_397.getMaskLocation(_loc5_);
            _loc8_ = var_397.getMaskCategory(_loc5_);
            if(_loc7_ != null)
            {
               _loc9_ = 0;
               while(_loc9_ < var_101.length)
               {
                  _loc3_ = var_101[_loc9_] as RoomPlane;
                  if(_loc3_.type == RoomPlane.const_270 || _loc3_.type == RoomPlane.const_188 && _loc8_ == RoomPlaneBitmapMaskData.const_220)
                  {
                     if(_loc3_ != null && _loc3_.location != null && _loc3_.normal != null)
                     {
                        _loc10_ = Vector3d.dif(_loc7_,_loc3_.location);
                        _loc11_ = Math.abs(Vector3d.scalarProjection(_loc10_,_loc3_.normal));
                        if(_loc11_ < 0.01)
                        {
                           if(_loc3_.leftSide != null && _loc3_.rightSide != null)
                           {
                              _loc12_ = Vector3d.scalarProjection(_loc10_,_loc3_.leftSide);
                              _loc13_ = Vector3d.scalarProjection(_loc10_,_loc3_.rightSide);
                              _loc3_.addBitmapMask(_loc6_,_loc12_,_loc13_);
                           }
                        }
                     }
                  }
                  _loc9_++;
               }
            }
            _loc5_++;
         }
      }
      
      protected function updatePlanes(param1:IRoomGeometry, param2:Boolean, param3:int) : void
      {
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:Boolean = false;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         ++var_1454;
         var _loc5_:int = param3;
         var _loc6_:Array = var_398;
         if(param2)
         {
            var_398 = [];
            var_560 = [];
            _loc6_ = var_101;
         }
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_.length)
         {
            _loc9_ = _loc8_;
            if(_loc7_)
            {
               _loc9_ = 0;
            }
            _loc10_ = null;
            _loc11_ = false;
            _loc12_ = _loc6_[_loc8_] as RoomPlane;
            if(_loc12_ != null)
            {
               if(_loc12_.update(param1,_loc5_,param2))
               {
                  if(_loc12_.visible)
                  {
                     _loc14_ = "plane " + _loc9_ + " " + param1.scale;
                     _loc10_ = _assetLibrary.getAssetByName(_loc14_) as BitmapDataAsset;
                     if(_loc10_ == null)
                     {
                        _loc10_ = new BitmapDataAsset(_assetLibrary.getAssetTypeDeclarationByClass(BitmapDataAsset));
                        _assetLibrary.setAsset(_loc14_,_loc10_);
                     }
                     _loc15_ = _loc10_.content as BitmapData;
                     _loc16_ = _loc12_.copyBitmapData(_loc15_);
                     if(_loc16_ == null)
                     {
                        _loc16_ = _loc12_.bitmapData;
                     }
                     if(_loc16_ == null)
                     {
                        _loc10_ = null;
                     }
                     else if(_loc15_ != _loc16_)
                     {
                        if(_loc15_ != null)
                        {
                           _loc15_.dispose();
                        }
                        _loc10_.setUnknownContent(_loc16_);
                     }
                     if(!_loc7_)
                     {
                        var_398.push(_loc12_);
                        var_560.push(_loc8_);
                     }
                  }
                  _loc11_ = true;
               }
            }
            else
            {
               _loc10_ = null;
            }
            _loc13_ = getSprite(_loc9_);
            if(_loc13_ != null)
            {
               if(_loc12_ != null)
               {
                  _loc13_.visible = _loc12_.visible;
                  if(_loc13_.visible)
                  {
                     if(_loc11_)
                     {
                        _loc17_ = _loc12_.offset;
                        _loc13_.offsetX = -_loc17_.x;
                        _loc13_.offsetY = -_loc17_.y;
                        _loc13_.color = _loc12_.color;
                        if(_loc10_ != null)
                        {
                           _loc13_.asset = _loc10_.content as BitmapData;
                        }
                        else
                        {
                           _loc13_.asset = null;
                        }
                        _loc13_.assetName = _loc14_ + "_" + var_1454;
                        if(var_77.getPlaneType(_loc9_) == RoomPlaneData.const_147)
                        {
                           _loc13_.relativeDepth = _loc12_.relativeDepth + floorRelativeDepth + Number(_loc9_) / 1000;
                        }
                        else
                        {
                           _loc13_.relativeDepth = _loc12_.relativeDepth + wallRelativeDepth + Number(_loc9_) / 1000;
                        }
                     }
                  }
               }
               else
               {
                  _loc13_.visible = false;
               }
            }
            _loc8_++;
         }
      }
      
      private function getLandscapeWidth() : Number
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         while(_loc2_ < var_77.planeCount)
         {
            _loc3_ = var_77.getPlaneType(_loc2_);
            if(_loc3_ == RoomPlaneData.const_266)
            {
               _loc4_ = var_77.getPlaneLeftSide(_loc2_);
               _loc1_ += _loc4_.length;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = 0;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = 0;
         var _loc19_:* = 0;
         var _loc20_:* = 0;
         var _loc21_:* = 0;
         var _loc22_:* = 0;
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         if(param1.updateId != var_1303)
         {
            var_1303 = param1.updateId;
            var_559 = null;
            _loc9_ = param1.direction;
            if(_loc9_ != null && (_loc9_.x != var_1068 || _loc9_.y != var_1850 || _loc9_.z != var_1844 || param1.scale != var_1845))
            {
               var_1068 = _loc9_.x;
               var_1850 = _loc9_.y;
               var_1844 = _loc9_.z;
               var_1845 = param1.scale;
               _loc4_ = true;
            }
         }
         var _loc6_:IRoomObjectModel = _loc3_.getModel();
         initializeRoomPlanes();
         if(var_164 != _loc6_.getUpdateID())
         {
            _loc10_ = _loc6_.getString(RoomObjectVariableEnum.const_846);
            if(_loc10_ != var_1848)
            {
               updatePlaneMasks(_loc10_);
               var_1848 = _loc10_;
               _loc5_ = true;
            }
            _loc11_ = uint(_loc6_.getNumber(RoomObjectVariableEnum.const_552));
            if(_loc11_ != var_996)
            {
               var_996 = _loc11_;
               var_1849 = var_996 & 255;
               var_1847 = var_996 >> 8 & 255;
               var_1852 = var_996 >> 16 & 255;
               _loc5_ = true;
            }
         }
         var _loc7_:int = param2;
         if(_loc7_ < var_1851 + const_1628 && !_loc4_ && !_loc5_)
         {
            return;
         }
         var_1851 = _loc7_;
         if(var_164 != _loc6_.getUpdateID())
         {
            _loc12_ = _loc6_.getString(RoomObjectVariableEnum.const_703);
            _loc13_ = _loc6_.getString(RoomObjectVariableEnum.const_550);
            _loc14_ = _loc6_.getString(RoomObjectVariableEnum.const_625);
            updatePlaneTextureTypes(_loc13_,_loc12_,_loc14_);
            var_1843 = Boolean(_loc6_.getNumber(RoomObjectVariableEnum.const_941));
            var_164 = _loc6_.getUpdateID();
         }
         updatePlanes(param1,_loc4_,param2);
         var _loc8_:int = 0;
         while(_loc8_ < var_398.length)
         {
            _loc15_ = 0;
            _loc16_ = getSprite(_loc15_);
            _loc17_ = var_398[_loc8_] as RoomPlane;
            if(_loc16_ != null && _loc17_ != null && _loc17_.type != RoomPlane.const_188)
            {
               if(var_1843)
               {
                  _loc18_ = uint(_loc17_.color);
                  _loc19_ = uint((_loc18_ & 255) * var_1849 / 255);
                  _loc20_ = uint((_loc18_ >> 8 & 255) * var_1847 / 255);
                  _loc21_ = uint((_loc18_ >> 16 & 255) * var_1852 / 255);
                  _loc22_ = uint(_loc18_ >> 24);
                  _loc18_ = uint((_loc22_ << 24) + (_loc21_ << 16) + (_loc20_ << 8) + _loc19_);
                  _loc16_.color = _loc18_;
               }
               else
               {
                  _loc16_.color = _loc17_.color;
               }
            }
            _loc8_++;
         }
         increaseUpdateId();
      }
      
      protected function updatePlaneTextureTypes(param1:String, param2:String, param3:String) : Boolean
      {
         var _loc5_:* = null;
         if(param1 != _floorType)
         {
            _floorType = param1;
         }
         else
         {
            param1 = null;
         }
         if(param2 != var_1349)
         {
            var_1349 = param2;
         }
         else
         {
            param2 = null;
         }
         if(param3 != var_1350)
         {
            var_1350 = param3;
         }
         else
         {
            param3 = null;
         }
         if(param1 == null && param2 == null && param3 == null)
         {
            return false;
         }
         var _loc4_:int = 0;
         while(_loc4_ < var_101.length)
         {
            _loc5_ = var_101[_loc4_] as RoomPlane;
            if(_loc5_ != null)
            {
               if(_loc5_.type == RoomPlane.const_189 && param1 != null)
               {
                  _loc5_.id = param1;
               }
               else if(_loc5_.type == RoomPlane.const_270 && param2 != null)
               {
                  _loc5_.id = param2;
               }
               else if(_loc5_.type == RoomPlane.const_188 && param3 != null)
               {
                  _loc5_.id = param3;
               }
            }
            _loc4_++;
         }
         return true;
      }
   }
}
