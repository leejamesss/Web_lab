        var win_w = $(window).width();

        /*$('.banner .slider').slick({
            fade: true,
            dots: true,
            arrows: false,
            autoplay: true,
            autoplaySpeed : 8000,
            customPaging: function() {
                return '';
            }
        });*/

        if (win_w > 1199) {

            var h1 = $(window).height();
            var h2 = $('.banner .item').height();
            var h3 = $('.so-list').height();

            if (h1 < h2 + h3) {
                $('.banner .item').height(h1 - h3 / 2);
            }

        }
        var w1 = 60;
        if (win_w < 800) {
            w1 = 0;
        }

        $('.banner').width(win_w - w1);
        $(window).resize(function() {
            var w = $(window).width();
            if (w < 800) {
                w1 = 0;
                $("body").removeClass('open');
                $(".header").removeClass('open');
                $(".snav").removeClass('open');
            }
            $('.banner').width(w - w1);
        });

        $('.so-list .fl').click(function(e) {
            e.preventDefault();
            $(this).find('dl').stop().toggle();
            $(this).toggleClass('open');
        });

        $('.so-list .fl dl').click(function(e) {
            e.stopPropagation();
        });

        $(document).on('click', function(e) {
            if ($(e.target).closest(".fl").length == 0) {
                $('.so-list .fl dl').hide();
                $('.so-list .fl').removeClass('open');
            }
        });

        $('.so-list .fl dd').click(function(e) {

            $('.so-list .fl span').html($(this).html());
            $(this).parent('dl').stop().toggle();
            $(this).parents('.so-list .fl').removeClass('open');
        });

        $('.ban-con .prev').click(function(e) {
            e.preventDefault();
            $('.banner .slider').slick('slickPrev');
        });
        $('.ban-con .next').click(function(e) {
            e.preventDefault();
            $('.banner .slider').slick('slickNext');
        });


        $('.banner .slider').on('beforeChange', function(event, slick, currentSlide, nextSlide) {

            $('.ban-con ul li').removeClass('active');
            $('.ban-con ul li').eq(nextSlide).addClass('active');
        });

        var _winw = $(window).width();
        // 展开列表
        if (_winw > 1199) {
            $('.p-list5 li').hover(function() {
                // over
                $(this).addClass('on');
                $(this).siblings('li').removeClass('on');

            });

        } else {

            $('.p-list5 li').unbind('mouseenter').unbind('mouseleave');
            $(".p-list5 .tit").click(function() {
                $(this).parent("li").toggleClass('on');
            });
            $('.p-list5 .tit a').attr("href", "javascript:;");

        }