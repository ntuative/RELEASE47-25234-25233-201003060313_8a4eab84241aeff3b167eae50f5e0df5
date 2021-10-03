package deng.fzip
{
   import deng.utils.ChecksumUtil;
   import flash.utils.*;
   
   public class FZipFile
   {
      
      public static const const_515:int = 8;
      
      public static const const_1532:int = 10;
      
      public static const const_1253:int = 6;
      
      private static var var_1054:Boolean = describeType(ByteArray).factory.method.(@name == "uncompress").hasComplexContent();
      
      public static const const_1188:int = 0;
      
      public static const const_1604:int = 1;
      
      public static const const_1498:int = 2;
      
      public static const const_1482:int = 3;
      
      public static const const_1574:int = 4;
      
      public static const const_1529:int = 5;
      
      public static const const_1544:int = 9;
      
      public static const const_1481:int = 7;
       
      
      private var var_175:uint = 0;
      
      private var var_1055:uint = 0;
      
      private var var_717:Date;
      
      private var var_2146:int = -1;
      
      private var parseFunc:Function;
      
      private var var_503:Boolean = false;
      
      private var var_2317:int = -1;
      
      private var var_1289:uint = 0;
      
      private var var_2144:String = "";
      
      private var _extraFields:Dictionary;
      
      private var var_880:uint;
      
      private var var_22:ByteArray;
      
      private var var_715:uint;
      
      private var var_1538:Boolean = false;
      
      private var var_2316:int = -1;
      
      private var var_1539:String = "2.0";
      
      private var var_174:Boolean = false;
      
      private var var_2145:Boolean = false;
      
      private var var_360:String;
      
      private var var_593:uint = 0;
      
      private var var_1290:int = 0;
      
      private var var_425:String = "";
      
      private var var_716:int = 8;
      
      private var var_1537:Boolean = false;
      
      public function FZipFile(param1:String = "utf-8")
      {
         parseFunc = parseFileHead;
         super();
         var_360 = param1;
         _extraFields = new Dictionary();
         var_22 = new ByteArray();
         var_22.endian = Endian.BIG_ENDIAN;
      }
      
      public function get sizeUncompressed() : uint
      {
         return var_593;
      }
      
      public function set filename(param1:String) : void
      {
         var_425 = param1;
      }
      
      protected function uncompress() : void
      {
         if(var_174 && false)
         {
            var_22.position = 0;
            if(var_1054)
            {
               var_22.uncompress.apply(var_22,["deflate"]);
            }
            else
            {
               var_22.uncompress();
            }
            var_22.position = 0;
            var_174 = false;
         }
      }
      
      public function get filename() : String
      {
         return var_425;
      }
      
      public function get date() : Date
      {
         return var_717;
      }
      
      function parse(param1:IDataInput) : Boolean
      {
         while(param1.bytesAvailable && parseFunc(param1))
         {
         }
         return parseFunc === parseFileIdle;
      }
      
      private function parseFileContent(param1:IDataInput) : Boolean
      {
         if(var_1537)
         {
            parseFunc = parseFileIdle;
            throw new Error("Data descriptors are not supported.");
         }
         if(var_175 == 0)
         {
            parseFunc = parseFileIdle;
         }
         else
         {
            if(param1.bytesAvailable < var_175)
            {
               return false;
            }
            parseContent(param1);
            parseFunc = parseFileIdle;
         }
         return true;
      }
      
      public function get versionNumber() : String
      {
         return var_1539;
      }
      
      public function getContentAsString(param1:Boolean = true, param2:String = "utf-8") : String
      {
         var _loc3_:* = null;
         if(var_174)
         {
            uncompress();
         }
         var_22.position = 0;
         if(param2 == "utf-8")
         {
            _loc3_ = var_22.readUTFBytes(var_22.bytesAvailable);
         }
         else
         {
            _loc3_ = var_22.readMultiByte(var_22.bytesAvailable,param2);
         }
         var_22.position = 0;
         if(param1)
         {
            compress();
         }
         return _loc3_;
      }
      
      private function parseFileIdle(param1:IDataInput) : Boolean
      {
         return false;
      }
      
      protected function parseContent(param1:IDataInput) : void
      {
         var _loc2_:* = 0;
         if(var_716 === const_515 && !var_1538)
         {
            if(var_1054)
            {
               param1.readBytes(var_22,0,var_175);
            }
            else
            {
               if(!var_503)
               {
                  throw new Error("Adler32 checksum not found.");
               }
               var_22.writeByte(120);
               _loc2_ = uint(~var_2146 << 6 & 192);
               _loc2_ += 31 - (30720 | _loc2_) % 31;
               var_22.writeByte(_loc2_);
               param1.readBytes(var_22,2,var_175);
               var_22.position = var_22.length;
               var_22.writeUnsignedInt(var_880);
            }
            var_174 = true;
         }
         else
         {
            if(var_716 != const_1188)
            {
               throw new Error("Compression method " + var_716 + " is not supported.");
            }
            param1.readBytes(var_22,0,var_175);
            var_174 = false;
         }
         var_22.position = 0;
      }
      
      private function parseFileHead(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= 30)
         {
            parseHead(param1);
            if(var_1055 + var_1289 > 0)
            {
               parseFunc = parseFileHeadExt;
            }
            else
            {
               parseFunc = parseFileContent;
            }
            return true;
         }
         return false;
      }
      
      public function setContentAsString(param1:String, param2:String = "utf-8") : void
      {
         var_22.length = 0;
         var_22.position = 0;
         var_174 = false;
         if(param1 != null && param1.length > 0)
         {
            if(param2 == "utf-8")
            {
               var_22.writeUTFBytes(param1);
            }
            else
            {
               var_22.writeMultiByte(param1,param2);
            }
            var_715 = ChecksumUtil.CRC32(var_22);
            var_503 = false;
         }
         compress();
      }
      
      public function set date(param1:Date) : void
      {
         var_717 = param1 != null ? param1 : new Date();
      }
      
      public function serialize(param1:IDataOutput, param2:Boolean, param3:Boolean = false, param4:uint = 0) : uint
      {
         var _loc10_:* = null;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(param1 == null)
         {
            return 0;
         }
         if(param3)
         {
            param1.writeUnsignedInt(33639248);
            param1.writeShort(var_1290 << 8 | 20);
         }
         else
         {
            param1.writeUnsignedInt(67324752);
         }
         param1.writeShort(var_1290 << 8 | 20);
         param1.writeShort(var_360 == "utf-8" ? 2048 : 0);
         param1.writeShort(const_515);
         var _loc5_:Date = var_717 != null ? var_717 : new Date();
         var _loc6_:uint = uint(_loc5_.getSeconds()) | uint(_loc5_.getMinutes()) << 5 | uint(_loc5_.getHours()) << 11;
         var _loc7_:uint = uint(_loc5_.getDate()) | uint(_loc5_.getMonth() + 1) << 5 | uint(_loc5_.getFullYear() - 1980) << 9;
         param1.writeShort(_loc6_);
         param1.writeShort(_loc7_);
         param1.writeUnsignedInt(var_715);
         param1.writeUnsignedInt(var_175);
         param1.writeUnsignedInt(var_593);
         var _loc8_:ByteArray = new ByteArray();
         _loc8_.endian = Endian.LITTLE_ENDIAN;
         if(var_360 == "utf-8")
         {
            _loc8_.writeUTFBytes(var_425);
         }
         else
         {
            _loc8_.writeMultiByte(var_425,var_360);
         }
         var _loc9_:uint = _loc8_.position;
         for(_loc10_ in _extraFields)
         {
            _loc15_ = _extraFields[_loc10_] as ByteArray;
            if(_loc15_ != null)
            {
               _loc8_.writeShort(uint(_loc10_));
               _loc8_.writeShort(uint(_loc15_.length));
               _loc8_.writeBytes(_loc15_);
            }
         }
         if(param2)
         {
            if(!var_503)
            {
               _loc16_ = var_174;
               if(_loc16_)
               {
                  uncompress();
               }
               var_880 = ChecksumUtil.Adler32(var_22,0,var_22.length);
               var_503 = true;
               if(_loc16_)
               {
                  compress();
               }
            }
            _loc8_.writeShort(56026);
            _loc8_.writeShort(4);
            _loc8_.writeUnsignedInt(var_880);
         }
         var _loc11_:uint = _loc8_.position - _loc9_;
         if(param3 && false)
         {
            if(var_360 == "utf-8")
            {
               _loc8_.writeUTFBytes(var_2144);
            }
            else
            {
               _loc8_.writeMultiByte(var_2144,var_360);
            }
         }
         var _loc12_:uint = _loc8_.position - _loc9_ - _loc11_;
         param1.writeShort(_loc9_);
         param1.writeShort(_loc11_);
         if(param3)
         {
            param1.writeShort(_loc12_);
            param1.writeShort(0);
            param1.writeShort(0);
            param1.writeUnsignedInt(0);
            param1.writeUnsignedInt(param4);
         }
         if(_loc9_ + _loc11_ + _loc12_ > 0)
         {
            param1.writeBytes(_loc8_);
         }
         var _loc13_:int = 0;
         if(!param3 && var_175 > 0)
         {
            if(var_1054)
            {
               _loc13_ = 0;
               param1.writeBytes(var_22,0,_loc13_);
            }
            else
            {
               _loc13_ = 4294967290;
               param1.writeBytes(var_22,2,_loc13_);
            }
         }
         var _loc14_:uint = 30 + _loc9_ + _loc11_ + _loc12_ + _loc13_;
         if(param3)
         {
            _loc14_ += 16;
         }
         return _loc14_;
      }
      
      public function get sizeCompressed() : uint
      {
         return var_175;
      }
      
      protected function compress() : void
      {
         if(!var_174)
         {
            if(false)
            {
               var_22.position = 0;
               var_593 = var_22.length;
               if(var_1054)
               {
                  var_22.compress.apply(var_22,["deflate"]);
                  var_175 = var_22.length;
               }
               else
               {
                  var_22.compress();
                  var_175 = -6;
               }
               var_22.position = 0;
               var_174 = true;
            }
            else
            {
               var_175 = 0;
               var_593 = 0;
            }
         }
      }
      
      private function parseFileHeadExt(param1:IDataInput) : Boolean
      {
         if(param1.bytesAvailable >= var_1055 + var_1289)
         {
            method_9(param1);
            parseFunc = parseFileContent;
            return true;
         }
         return false;
      }
      
      protected function method_9(param1:IDataInput) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         if(var_360 == "utf-8")
         {
            var_425 = param1.readUTFBytes(var_1055);
         }
         else
         {
            var_425 = param1.readMultiByte(var_1055,var_360);
         }
         var _loc2_:uint = var_1289;
         while(_loc2_ > 4)
         {
            _loc3_ = uint(param1.readUnsignedShort());
            _loc4_ = uint(param1.readUnsignedShort());
            if(_loc4_ > _loc2_)
            {
               throw new Error("Parse error in file " + var_425 + ": Extra field data size too big.");
            }
            if(_loc3_ === 56026 && _loc4_ === 4)
            {
               var_880 = param1.readUnsignedInt();
               var_503 = true;
            }
            else if(_loc4_ > 0)
            {
               _loc5_ = new ByteArray();
               param1.readBytes(_loc5_,0,_loc4_);
               _extraFields[_loc3_] = _loc5_;
            }
            _loc2_ -= _loc4_ + 4;
         }
         if(_loc2_ > 0)
         {
            param1.readBytes(new ByteArray(),0,_loc2_);
         }
      }
      
      protected function parseHead(param1:IDataInput) : void
      {
         var _loc2_:uint = param1.readUnsignedShort();
         var_1290 = _loc2_ >> 8;
         var_1539 = Math.floor((_loc2_ & 255) / 10) + "." + (_loc2_ & 255) % 10;
         var _loc3_:uint = param1.readUnsignedShort();
         var_716 = param1.readUnsignedShort();
         var_1538 = (_loc3_ & 1) !== 0;
         var_1537 = (_loc3_ & 8) !== 0;
         var_2145 = (_loc3_ & 32) !== 0;
         if((_loc3_ & 800) !== 0)
         {
            var_360 = "utf-8";
         }
         if(var_716 === const_1253)
         {
            var_2316 = (_loc3_ & 2) !== 0 ? 8192 : 4096;
            var_2317 = (_loc3_ & 4) !== 0 ? 3 : 2;
         }
         else if(var_716 === const_515)
         {
            var_2146 = (_loc3_ & 6) >> 1;
         }
         var _loc4_:uint = param1.readUnsignedShort();
         var _loc5_:uint = param1.readUnsignedShort();
         var _loc6_:* = _loc4_ & 31;
         var _loc7_:* = (_loc4_ & 2016) >> 5;
         var _loc8_:* = (_loc4_ & 63488) >> 11;
         var _loc9_:* = _loc5_ & 31;
         var _loc10_:* = (_loc5_ & 480) >> 5;
         var _loc11_:int = ((_loc5_ & 65024) >> 9) + 1980;
         var_717 = new Date(_loc11_,_loc10_ - 1,_loc9_,_loc8_,_loc7_,_loc6_,0);
         var_715 = param1.readUnsignedInt();
         var_175 = param1.readUnsignedInt();
         var_593 = param1.readUnsignedInt();
         var_1055 = param1.readUnsignedShort();
         var_1289 = param1.readUnsignedShort();
      }
      
      public function set content(param1:ByteArray) : void
      {
         if(param1 != null && param1.length > 0)
         {
            param1.position = 0;
            param1.readBytes(var_22,0,param1.length);
            var_715 = ChecksumUtil.CRC32(var_22);
            var_503 = false;
         }
         else
         {
            var_22.length = 0;
            var_22.position = 0;
            var_174 = false;
         }
         compress();
      }
      
      public function toString() : String
      {
         return "[FZipFile]\n  name:" + var_425 + "\n  date:" + var_717 + "\n  sizeCompressed:" + var_175 + "\n  sizeUncompressed:" + var_593 + "\n  versionHost:" + var_1290 + "\n  versionNumber:" + var_1539 + "\n  compressionMethod:" + var_716 + "\n  encrypted:" + var_1538 + "\n  hasDataDescriptor:" + var_1537 + "\n  hasCompressedPatchedData:" + var_2145 + "\n  filenameEncoding:" + var_360 + "\n  crc32:" + var_715.toString(16) + "\n  adler32:" + var_880.toString(16);
      }
      
      public function get content() : ByteArray
      {
         if(var_174)
         {
            uncompress();
         }
         return var_22;
      }
   }
}
