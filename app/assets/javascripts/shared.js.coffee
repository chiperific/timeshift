# scripts shared across different paths.

# _year_payweek_searchbar
jQuery ->
  $('#searchbar-calculator-year').datepicker
    format: 'yyyy'
    minViewMode: 2
    autoclose: true

  $('#searchbar-calculator-pay-period').datepicker
    format: 'mm-dd'
    todayBtn: 'linked'
    calendarWeeks: true
    weekStart: 1
    autoclose: true

  $('.input-group-addon').click ->
    $(this).next("input").focus()