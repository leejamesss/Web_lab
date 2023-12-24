function swiperFun(swiper) {
    this.dom = swiper.dom;
    this.domList = this.dom;
    this.dom.find('ul').addClass('swiper-wrapper');
    this.dom.find('li').addClass('swiper-slide');
    if (swiper.domList !== undefined) {
        this.domList = this.dom.find(swiper.domList)
    }
    if (this.dom.find('.num').length > 0) {
        this.dom.find('.num-total').html(this.dom.find('li').length)
    }

    this.change = function() {};
    var that = this;
    this.mySwiper = new Swiper(that.domList, {
        effect: swiper.effect !== undefined ? swiper.effect : 'slide',
        loop: swiper.loop !== undefined ? swiper.loop : true,
        autoplay: swiper.autoplay !== undefined ? swiper.autoplay : 5000,
        autoplayDisableOnInteraction: false,
        paginationClickable: true,
        speed: 600,
        slidesPerView: swiper.slidesPerView !== undefined ? swiper.slidesPerView : 1,
        slidesPerGroup: swiper.slidesPerGroup !== undefined ? swiper.slidesPerGroup : 1,
        centeredSlides: swiper.centeredSlides !== undefined ? swiper.centeredSlides : false,
        slideToClickedSlide: swiper.slideToClickedSlide !== undefined ? swiper.slideToClickedSlide : false,
        pagination: that.dom.find('.dots'),
        onSlideChangeStart: function(swiper) {
            if (that.dom.find('.num').length > 0) {
                that.dom.find('.num-curr').html(swiper.realIndex + 1)
            }
            that.change(swiper.realIndex);
        }
    });
    this.dom.find('.prev').click(function() {
        that.mySwiper.slidePrev();
        return false
    });
    this.dom.find('.next').click(function() {
        that.mySwiper.slideNext();
        return false
    })
}