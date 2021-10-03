package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_2128:Boolean;
      
      private var var_1534:Array;
      
      private var var_2126:Boolean;
      
      private var var_2133:Boolean;
      
      private var var_2131:Boolean;
      
      private var var_157:Array;
      
      private var var_2132:Boolean;
      
      private var var_2129:Boolean;
      
      private var var_1533:Array;
      
      private var var_2130:Boolean;
      
      private var var_2127:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_2127;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2128;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2126;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2132;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2129;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1534;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_157 = [];
         var_1534 = [];
         _roomMessageTemplates = [];
         var_1533 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_157.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1534.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1533.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2132 = param1.readBoolean();
         var_2131 = param1.readBoolean();
         var_2126 = param1.readBoolean();
         var_2133 = param1.readBoolean();
         var_2127 = param1.readBoolean();
         var_2129 = param1.readBoolean();
         var_2128 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_2130 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2133;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1533;
      }
      
      public function get issues() : Array
      {
         return var_157;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2130;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2131;
      }
   }
}
