package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_1051:int = 0;
      
      private var _data:String = "";
      
      private var var_1424:int = -1;
      
      private var var_37:int = 0;
      
      private var _type:int = 0;
      
      private var var_1050:int = 0;
      
      private var var_2367:String = "";
      
      private var var_2120:int = 0;
      
      private var _id:int = 0;
      
      private var var_193:Boolean = false;
      
      private var var_223:int = 0;
      
      private var var_2121:String = null;
      
      private var var_87:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_193)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_193)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_223;
      }
      
      public function get extra() : int
      {
         return var_1424;
      }
      
      public function get state() : int
      {
         return var_37;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_193)
         {
            var_223 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_193)
         {
            var_87 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_193)
         {
            var_1424 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_193)
         {
            var_37 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_2120;
      }
      
      public function get staticClass() : String
      {
         return var_2121;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_193)
         {
            var_2120 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_193)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_193)
         {
            var_2121 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_193 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_193)
         {
            var_1051 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_193)
         {
            var_1050 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_193)
         {
            var_86 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1051;
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get sizeY() : int
      {
         return var_1050;
      }
   }
}
