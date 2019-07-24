//= require flash-messenger/flash-messenger
(function ($) {
  'use strict';

  function showErrors(errors) {
    errors.forEach(function (error) {
      flash.error(error);
    });
  }

  $(document).on('turboboost:error', function (e, errors) {
    var json;
    try {
      json = JSON.parse(errors);
    } catch (e2) {
    }
    if ($.isArray(json)) {
      showErrors(json);
    } else if (typeof json == 'object') {
      if ($.isArray(json.error)) {
        showErrors(json.error);
      } else {
        flash.error(errors);
      }
    } else if (typeof json === 'string') {
      flash.error(errors);
    }
  });
})(jQuery);
