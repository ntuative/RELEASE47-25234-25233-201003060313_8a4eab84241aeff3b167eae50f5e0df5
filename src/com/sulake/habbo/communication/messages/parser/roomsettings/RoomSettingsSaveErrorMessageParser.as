package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1465:int = 9;
      
      public static const const_1537:int = 4;
      
      public static const const_1500:int = 1;
      
      public static const const_1172:int = 10;
      
      public static const const_1592:int = 2;
      
      public static const const_1200:int = 7;
      
      public static const const_1355:int = 11;
      
      public static const const_1499:int = 3;
      
      public static const const_1334:int = 8;
      
      public static const const_1203:int = 5;
      
      public static const const_1605:int = 6;
      
      public static const const_1236:int = 12;
       
      
      private var var_1677:String;
      
      private var _roomId:int;
      
      private var var_1138:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1677;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1138 = param1.readInteger();
         var_1677 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1138;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
