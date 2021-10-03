package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1384:String = "F";
      
      public static const const_1000:String = "M";
       
      
      private var var_87:Number = 0;
      
      private var var_605:String = "";
      
      private var var_1859:int = 0;
      
      private var var_1860:String = "";
      
      private var var_1861:int = 0;
      
      private var var_1864:int = 0;
      
      private var var_1858:String = "";
      
      private var var_1153:String = "";
      
      private var _id:int = 0;
      
      private var var_193:Boolean = false;
      
      private var var_223:int = 0;
      
      private var var_1863:String = "";
      
      private var _name:String = "";
      
      private var var_1862:int = 0;
      
      private var _y:Number = 0;
      
      private var var_86:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_86;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_223;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_193)
         {
            var_223 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_193)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_1859;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_193)
         {
            var_1861 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_1863;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_193)
         {
            var_1858 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_193)
         {
            var_1863 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_193)
         {
            var_1864 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_193)
         {
            var_605 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_193)
         {
            var_1859 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_193)
         {
            var_1153 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1861;
      }
      
      public function get groupID() : String
      {
         return var_1858;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_193)
         {
            var_1862 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_193)
         {
            var_1860 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_193 = true;
      }
      
      public function get sex() : String
      {
         return var_1153;
      }
      
      public function get figure() : String
      {
         return var_605;
      }
      
      public function get webID() : int
      {
         return var_1862;
      }
      
      public function get custom() : String
      {
         return var_1860;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_193)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_193)
         {
            var_86 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_193)
         {
            var_87 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1864;
      }
   }
}
