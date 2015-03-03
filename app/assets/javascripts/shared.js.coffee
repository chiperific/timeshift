# scripts shared across different paths.

jQuery ->
  # Universal datepicker for any weekday
  $('.open_date_picker').datepicker
    todayBtn: "linked"
    format: 'mm/dd/yyyy'
    calendarWeeks: true
    weekStart: 1
    autoclose: true
    todayHighlight: true

  # Universal datepicker for Mondays
  $('.start_date_picker').datepicker
    daysOfWeekDisabled: "0,2,3,4,5,6"
    todayBtn: "linked"
    format: 'mm/dd/yyyy'
    calendarWeeks: true
    weekStart: 1
    autoclose: true
    todayHighlight: true

  # Universal datepicker for Sundays
  $('.end_date_picker').datepicker
    daysOfWeekDisabled: "1,2,3,4,5,6"
    todayBtn: "linked"
    format: 'mm/dd/yyyy'
    calendarWeeks: true
    weekStart: 1
    autoclose: true
    todayHighlight: true

  # when clicking the input-group-addon before the input, move the focus to the input to open the datePicker
  $('.input-group-addon').click ->
    $(this).next("input").focus()

  # Change the dates on _start_and_end_date_searchbar before submission, for a cleaner URL
  $('#searchbar_form').submit ->
    humanDateStart = $('#searchbar_start').val()
    humanDateEnd = $('#searchbar_end').val()
    startDate = new Date(humanDateStart)
    endDate = new Date(humanDateEnd)
    startYear = startDate.getFullYear()
    startMonth = ('0'+(startDate.getMonth()+1)).slice(-2)
    startDay = ('0'+ startDate.getDate()).slice(-2)
    rubyDateStart = startYear+"-"+startMonth+"-"+startDay
    endYear = endDate.getFullYear()
    endMonth = ('0'+(endDate.getMonth()+1)).slice(-2)
    endDay = ('0'+ endDate.getDate()).slice(-2)
    rubyDateEnd = endYear+"-"+endMonth+"-"+endDay
    $('#searchbar_start').val(rubyDateStart)
    $('#searchbar_end').val(rubyDateEnd)
    true
    