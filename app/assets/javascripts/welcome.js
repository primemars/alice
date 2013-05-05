
function upload_article(){
    var allow_exts = ['txt'];
    jQuery("#msg").hide();


    var ext = $('#article_avatar').val().split('.').pop().toLowerCase();
    if($.inArray(ext, allow_exts) == -1){
	$("#msg").show();
	return false;
    }
    return true;
}
