$(function() {
  var MKG = "";
  $.ajax({url: "gene/MKGene.xml",dataType: "xml",async: false,error: function() { alert("error load xml"); },success: function(MKxml){MKG = $(MKxml).find("MKgenes").text();}})
  $("#MKautoc").autocomplete({matchContains:true,source: function(request, response){var results = $.ui.autocomplete.filter(MKG.split(","), request.term);response(results.slice(0,10));}});
  });