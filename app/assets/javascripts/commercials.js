  var actualUrl = '//' + location.host + location.pathname
    
    $('#triResultat_select_id').on('change', function () {
      if($(this).val() == 0) {
         sort = "";
      } else {
          sort = $(this).val();
      }
     
    var finalUrl = actualUrl + "<%= get_params %>" + sort;
    window.location.href = finalUrl;
     
     return false;
  });