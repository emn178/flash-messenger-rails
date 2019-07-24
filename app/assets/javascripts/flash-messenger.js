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
      jobs = [];
      $(document).off('page:load turbolinks:load', show);
    };
    $(document).ready(show).on('page:load turbolinks:load', show);
  };
})(jQuery);
