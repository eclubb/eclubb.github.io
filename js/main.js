$('#navtabs a').click(function (e) {
  e.preventDefault();

  var url = $(this).attr("data-url");
  var href = this.hash;
  var pane = $(this);

  // ajax load from data-url
  $(href).load(url, function(result){
    pane.tab('show');
  });
});

// load first tab content
$('#home').load($('#navtabs .active a').attr("data-url"), function(result){
  $('#navtabs .active a').tab('show');
});

