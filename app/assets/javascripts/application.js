document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('input[data-behavior="comma-separate"]').forEach(function(input) {
    input.addEventListener('input', function(e) {
      let value = input.value.replace(/,/g, '').replace(/[^\d]/g, '');
      if (value) {
        input.value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
      } else {
        input.value = '';
      }
    });
  });
}); 