$(document).ready(function($) {
    //head
    $.ajax({
        type: 'post',
        url: '/system/resource/app/getLibNum.jsp',
        dataType: 'json',
        success: function(data) {
            $(".date-num .num").html('<i title="已使用座位量">' + data[0].num + ' </i> / <span title="座位总量">' + data[0].sum + '</span>');
        },
        error: function(data) {
            $(".date-num .num").html('- / <span>-</span>');
        }
    });
    $.ajax({
        type: 'post',
        url: '/system/resource/app/getLibraryInside.jsp',
        success: function(data) {
            $(".date-num .people").html(' <span>' + data + '</span>');
        },
        error: function(data) {
            $(".date-num .people").html(' <span>-</span>');
        }
    });

    var _winw = $(window).width();
    var _top = $(window).scrollTop();
    if (_winw > 1199) {
        $('.snav li').hover(function() {
            // over
            $(this).find('.sub').addClass('show');

        }, function() {
            // out
            $(this).find('.sub').removeClass('show');
        });

        var _top = $(window).scrollTop();
        if (_top > 0) {
            $("body").removeClass('open');
            $(".header").removeClass('open');
            $(".snav").removeClass('open');
        } else {
            //$("body").addClass('open');
            //$(".header").addClass('open');
            //$(".snav").addClass('open');
        }

        $(window).scroll(function(event) {
            /* Act on the event */
            var h1 = $('.header').height();
            var _top = $(window).scrollTop();
            if (_top > h1) {
                $('.header').addClass('hide');
                $('.hd-menu').fadeIn();
            } else {
                $('.header').removeClass('hide');
                $('.hd-menu').fadeOut();
            }


            if (_top > 0) {
                $("body").removeClass('open');
                $(".header").removeClass('open');
                $(".snav").removeClass('open');
            } else if (_winw > 800) {
                $("body").addClass('open');
                $(".header").addClass('open');
                $(".snav").addClass('open');
            }
        });




    } else {

        $("body").removeClass('open');
        $(".header").removeClass('open');
        $(".snav").removeClass('open');

        $('.snav li').unbind('mouseenter').unbind('mouseleave');

        $('.snav .v1').click(function() {
            $(this).parents(".nav").find(".sub").stop().slideUp("fast");
            $(this).parent().siblings().find('.sub').slideUp()
            $(this).parent().siblings().find('.v1').css({
                "background-color": "#fff"
            })
            $(this).css({
                "background-color": "#f5f5f5"
            })
            $(this).siblings('.sub').children('dd:not(:last-child)').css({
                "border-bottom": "1px solid #eee"
            })
            if ($(this).siblings('.sub').length) {
                $(this).siblings('.sub').stop().slideToggle("fast");
                return false;
            }
        });

    }


    $('body').on('click', function() {
        $('.snav .sub').removeClass('show');
        $('.so .inp').stop().slideUp(200);
    });

    $('.snav-menu').click(function(e) {
        e.preventDefault();
        $('.snav').addClass('open');
        $('.header').addClass('open');
        $(this).fadeOut();
        $("body").addClass('open');
        if ($(window).width() < 767) {
            $(".main").attr("style", "float:right !important;width:320px;")
        }
    });

    $('.snav .close').click(function(e) {
        e.preventDefault();
        $('.snav').removeClass('open');
        $('.header').removeClass('open');
        $('.snav-menu').fadeIn();
        $("body").removeClass('open');
        if ($(window).width() < 767) {
            $(".main").removeAttr("style")
        }
    });
    $('.so').click(function(e) {
        e.stopPropagation();
    });
    $('.so .btn').click(function(e) {
        $(this).next('.inp').stop().slideToggle(200);
    });

    $('.hd-menu').click(function(e) {
        e.preventDefault();
        $('.header').removeClass('hide');
        $(this).fadeOut();
    });

    // 全屏底部
    function positionFooter() {
        var footer = $(".footer");
        if ((($(document.body).height() + footer.outerHeight()) < $(window).height() && footer.css("position") == "fixed") || ($(document.body).height() < $(window).height() && footer.css("position") != "fixed")) {
            footer.css({
                position: "fixed",
                bottom: "0",
                width: '100%'
            });
        } else {
            footer.css({
                position: "static"
            });
        }
    }

    function stickFooter() {
        $(window).scroll(positionFooter).load(positionFooter).resize(positionFooter);
    }
    stickFooter();

    // 选项卡 鼠标点击切换
    $(".TAB_CLICK li").click(function() {
        var tab = $(this).parent(".TAB_CLICK");
        var con = tab.attr("id");
        var on = tab.find("li").index(this);
        $(this).addClass('on').siblings(tab.find("li")).removeClass('on');
        $(con).eq(on).show().siblings(con).hide();
    });

    $('.myfancy').click(function() {
        var _id = $(this).attr('href');
        $(_id).addClass('ok');
    });
    $('.pop-bg,.close').click(function() {
        $(this).parents('.m-pop').removeClass("ok");
    });

    $('.mb-menu').click(function() {
        $(".snav").toggleClass("show");
        $(".mb-menu").toggleClass("ml-3");
        $(".snav").toggle();
    });
});