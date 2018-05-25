import $ from 'jquery';

function fadding () {
  let ml3html = $('.ml3')
  console.log(ml3html)
  if (ml3html.length > 0) {
    ml3html.each(function(){
      $(this).html($(this).text().replace(/([^\x00-\x80]|\w)/g, "<span class='letter'>$&</span>"));
    });
    anime.timeline({loop: true})
      .add({
        targets: '.ml3 .letter',
        opacity: [0,1],
        easing: "easeInOutQuad",
        duration: 200,
        delay: function(el, i) {
          return 150 * (i+1)
        }
      }).add({
        targets: '.ml3',
        opacity: 0,
        duration: 200,
        easing: "easeOutExpo",
        delay: 1000
      });
  };
};

export { fadding };
