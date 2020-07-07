import ScrollReveal from 'scrollreveal';

ScrollReveal({
  duration: 1500,
  distance: '50px',
  reset: true
});

const slideDown = {
  origin: 'top'
}

const slideUp = {
  origin: 'bottom'
}

const slideLeft = {
  origin: 'right'
}

const slideRight = {
  origin: 'left'
}


const initScrollReveal = () =>{
  ScrollReveal().reveal('.slide-down', slideDown);
  ScrollReveal().reveal('.slide-up', slideUp);
  ScrollReveal().reveal('.slide-left', slideLeft);
  ScrollReveal().reveal('.slide-right', slideRight);

  ScrollReveal().reveal('.slide-down-interval', { ...slideDown, interval: 150 });
  ScrollReveal().reveal('.slide-up-interval', { ...slideUp, interval: 150 });
  ScrollReveal().reveal('.slide-left-interval', { ...slideLeft, interval: 150 });
  ScrollReveal().reveal('.slide-right-interval', { ...slideRight, interval: 150 });
};

export { initScrollReveal };
