// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("#despesa_data_br").datepicker({
    dateFormat: 'dd/mm/yy',
    showOn: "button",
    buttonImage: "/images/calendar_icon.gif",
    buttonImageOnly: true
  });

  $("#pagamento_vencimento_to_s").datepicker({
    dateFormat: 'dd/mm/yy',
    showOn: "button",
    buttonImage: "/images/calendar_icon.gif",
    buttonImageOnly: true
  });

  $("#movimento_dia_to_s").datepicker({
    dateFormat: 'dd/mm/yy',
    showOn: "button",
    buttonImage: "/images/calendar_icon.gif",
    buttonImageOnly: true
  });
  
  $("#despesa_data").mask('99/99/9999');
  $("#pagamento_vencimento_to_s").mask('99/99/9999');
  $("#movimento_dia_to_s").mask('99/99/9999');
  $("#agenda_mes_formatado").mask('99/9999');
});
