
function upload_article(){
    var allow_exts = ['txt'];
    var ext = $('#article_avatar').val().split('.').pop().toLowerCase();
    if($.inArray(ext, allow_exts) == -1){
	alert('invalid extension!');
	return false;
    }
    return true;
}
