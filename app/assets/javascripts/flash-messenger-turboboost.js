//= require flash-messenger/flash-messenger
(function ($) {
  'use strict';

  $(document).on('turboboost:error', function (e, errors) {
    try {
      errors = JSON.parse(errors);
      if ($.isArray(errors)) {
        errors.forEach(function (error) {
          flash.error(error);
        });
      } else if (typeof errors == 'object') {
        flash.modelError(errors);
      }
    } catch (e) {
    }
  });
})(jQuery);
