package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1694:int;
      
      private var var_1832:String;
      
      private var var_1831:int;
      
      private var var_1833:int;
      
      private var var_644:Boolean;
      
      private var var_1743:Boolean;
      
      private var var_386:int;
      
      private var var_1209:String;
      
      private var var_1739:int;
      
      private var var_1208:int;
      
      private var _ownerName:String;
      
      private var var_676:String;
      
      private var var_1836:int;
      
      private var var_1835:RoomThumbnailData;
      
      private var var_1834:Boolean;
      
      private var var_618:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_618 = new Array();
         super();
         var_386 = param1.readInteger();
         var_644 = param1.readBoolean();
         var_676 = param1.readString();
         _ownerName = param1.readString();
         var_1739 = param1.readInteger();
         var_1694 = param1.readInteger();
         var_1836 = param1.readInteger();
         var_1209 = param1.readString();
         var_1831 = param1.readInteger();
         var_1834 = param1.readBoolean();
         var_1833 = param1.readInteger();
         var_1208 = param1.readInteger();
         var_1832 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_618.push(_loc4_);
            _loc3_++;
         }
         var_1835 = new RoomThumbnailData(param1);
         var_1743 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1836;
      }
      
      public function get roomName() : String
      {
         return var_676;
      }
      
      public function get userCount() : int
      {
         return var_1694;
      }
      
      public function get score() : int
      {
         return var_1833;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1832;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1834;
      }
      
      public function get tags() : Array
      {
         return var_618;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1743;
      }
      
      public function get event() : Boolean
      {
         return var_644;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_618 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1208;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1831;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1835;
      }
      
      public function get doorMode() : int
      {
         return var_1739;
      }
      
      public function get flatId() : int
      {
         return var_386;
      }
      
      public function get description() : String
      {
         return var_1209;
      }
   }
}
