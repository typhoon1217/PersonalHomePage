function call_ss_js() {
        // 화면 객체 참조 변수 지정
        let slideshow = document.querySelector(".slideshow");
        if (!slideshow) return;

        let slideshowSlides = document.querySelector(".slideshow_slides");
        if (!slideshowSlides) return;

        let slides = document.querySelectorAll(".slideshow_slides a");
        if (slides.length === 0) return;

        let prev = document.querySelector(".prev");
        if (!prev) return;

        let next = document.querySelector(".next");
        if (!next) return;

        let indicators = document.querySelectorAll(".indicator a");
        if (indicators.length === 0) return;

        let currentIndex = 0;
        let timer = null;
        let slideCount = slides.length;

        function gotoSlide(index) {
            currentIndex = index;
            let newLeft = index * -100 + "%";
            slideshowSlides.style.transform = `translateX(${newLeft})`;
            indicators.forEach((indicator) => {
                indicator.classList.remove("active");
            });
            indicators[index].classList.add("active");
        }

        function startTimer() {
            timer = setInterval(function () {
                let nextIndex = (currentIndex + 1) % slideCount;
                gotoSlide(nextIndex);
            }, 5000);
        }

        function stopTimer() {
            clearInterval(timer);
        }

        gotoSlide(0);
        startTimer();

        slideshowSlides.addEventListener("mouseenter", stopTimer);
        slideshowSlides.addEventListener("mouseleave", startTimer);
        prev.addEventListener("mouseenter", stopTimer);
        next.addEventListener("mouseenter", stopTimer);

        prev.addEventListener("click", (e) => {
            e.preventDefault();
            currentIndex = (currentIndex - 1 + slideCount) % slideCount;
            gotoSlide(currentIndex);
        });

        next.addEventListener("click", (e) => {
            e.preventDefault();
            currentIndex = (currentIndex + 1) % slideCount;
            gotoSlide(currentIndex);
        });

        indicators.forEach((indicator, i) => {
            indicator.addEventListener("mouseenter", stopTimer);
            indicator.addEventListener("click", (e) => {
                e.preventDefault();
                gotoSlide(i);
            });
        });
}
