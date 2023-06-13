$(window).unload(function () {
    var pathArray = window.location.pathname.split('/');
    var rootUrl = window.location.protocol + '//' + window.location.host + "/" + pathArray[1];
    $.ajax ({
        url: rootUrl + '/api/hello',
        data: 'SessionExpire',
        async: false        
    });
});

