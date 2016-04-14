//= require flash-messenger/flash-messenger
(function ($) {
  'use strict';

  var typeMap = {
    error: 'danger',
    notice: 'info',
    alert: 'warning'
  };
  flash.setting.message = '<div class="alert alert-{type}">{message}<i class="glyphicon glyphicon-remove"></i></div>';
  flash.setting.closeHandler = '.glyphicon-remove';
  flash.setting.convert = function (options) {
    options.type = typeMap[options.type] || options.type;
  };
})(jQuery);
