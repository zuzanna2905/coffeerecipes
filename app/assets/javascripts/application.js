// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require materialize
//= require activestorage
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
    $(".dropdown-trigger").dropdown();
    $('select').formSelect();
    elem = document.querySelector('.sidenav');
    instance = new M.Sidenav(elem, {});
    
    $('select').on('contentChanged', function() {
        $(this).formSelect();
    });

    jQuery(function() {
        var beans;
        $('#recipe_bean_id').parent().hide();
        beans = $('#recipe_bean_id').html();
        return $('#recipe_roaster_id').change(function() {
            var roaster, options;
            roaster = $('#recipe_roaster_id :selected').text();
            options = $(beans).filter("optgroup[label='" + roaster + "']").html();
            if (options !== undefined) {
                $('#recipe_bean_id').empty().html(options);
                $("#recipe_bean_id").trigger('contentChanged');
                return $('#recipe_bean_id').parent().show();
            } else {
                $('#recipe_bean_id').empty();
                $("#recipe_bean_id").trigger('contentChanged');
                return $('#recipe_bean_id').parent().hide();
            }
        });
    });
});

$(document).on('ready turbolinks:before-render', function() {
    elem = document.querySelector('.sidenav');
    instance = M.Sidenav.getInstance(elem);
    if (instance){
      instance.destroy();
    }
})