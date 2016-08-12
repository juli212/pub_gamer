$(document).ready(function() {

function getPageName(url) {
    var index = url.lastIndexOf("/") + 1;
    var filenameWithExtension = url.substr(index);
    var filename = filenameWithExtension.split(".")[0];
    return filename;
}

  $(function(){
     var currentPageName = getPageName(window.location.pathname);
     $('#' + currentPageName).css('color', '#EDD0AF');
     $('#' + currentPageName).parent().css('background-color', '#635A8E')
  });

});