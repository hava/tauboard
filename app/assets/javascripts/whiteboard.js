// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(
        $(function()
        {
            var hours = new Date().getHours();
            var afterHoursInterval = 60 * 1000;//30 * 60 * 1000;
            var workHourInterval = 60 * 1000;
            var interval = (hours < 19 && hours > 6) ? workHourInterval : afterHoursInterval;
            setInterval(function()
                        {
                            var element = $('#whiteboard_view');
                            var remote_action = element.attr('data-refresh-action');
                            replace_with_remote_for_type(remote_action, 'get')
                        },
                        interval);
        }),

        $(function()
        {
//            var count = $('#whiteboard').find("tr:first th").length-1;
//            var width = 95 / count;
//            $('td.task_column').css('width', width + '%')
        })
)

function replace_with_remote_for_type(remote_action, method_type) {
    $.ajax({
        type: method_type,
        cache: false,
        url: remote_action,
        data: {},
        success: function(data) {
        },
        dataType: "script"
    });
}

