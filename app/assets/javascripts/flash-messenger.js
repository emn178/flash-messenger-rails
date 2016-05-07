//= require flash-messenger/flash-messenger
(function ($) {
  'use strict';

  window.flash.show = function (jobs) {
    var show = function () {
      jobs.forEach(function (job) {
        var message = job[0];
        var options = job[1];
        var method = job[2];
        method = method && flash[method] ? flash[method] : flash;
        method(message, options);
      });
      $(document).off('ready page:load', show);
    };
    $(document).on('ready page:load', show);
  };
})(jQuery);
