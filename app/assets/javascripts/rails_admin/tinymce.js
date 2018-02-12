function tinymce_load(){
  tinymce.remove();
  tinymce.init({
    selector: "textarea:not('.comment-user')",
    height: 250,
    theme: 'modern',
    plugins: [
      'advlist autolink lists link image charmap print preview hr anchor pagebreak',
      'searchreplace wordcount visualblocks visualchars code fullscreen',
      'insertdatetime media nonbreaking save table contextmenu directionality',
      'emoticons template paste textcolor colorpicker textpattern imagetools'
    ],
    toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
    toolbar2: 'print preview media | forecolor backcolor emoticons',
    image_advtab: true,
    templates: [
      { title: 'Test template 1', content: 'Test 1' }
    ]
  });
}
$(window).load(function(){
  tinymce_load();
});
$(document).on('pjax:complete', function(){
  tinymce_load();
});