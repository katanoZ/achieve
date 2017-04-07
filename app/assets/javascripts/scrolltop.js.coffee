ready = ->
    $(window).scroll ->
        element = $("#page-top-btn")
        visible = element.is(":visible")
        
        href = window.location.href
        position = 0
        if ( href.match(/blogs/))
            position = 200
#            console.log(position)
        else
            position = 400
#            console.log(position)

        height = $(window).scrollTop()
        if height > position
            element.fadeIn() if !visible
        else
            element.fadeOut()
        
    $(document).on "click", "#move-page-top", ->
        $("html, body").animate({scrollTop: 0}, "slow")

$(document).ready(ready)
$(document).on("page:load", ready)
