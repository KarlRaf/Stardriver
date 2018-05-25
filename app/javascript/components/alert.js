import swal from 'sweetalert';

function bindSweetAlertButtonDemo(title) {
  const sweetalert = document.querySelector('.sweet-alert')
  if ( sweetalert ) {
  sweetalert.addEventListener('click', () => {
    swal({
      title: title,
      text: "Major Tom to ground control, isn't it?",
      icon: "success"
    })
  });
};
};

const displayInfo = (title, url, id) => {
 swal({
    title: title,
    text: "Major Tom to ground control, isn't it?",
    icon: "success"
  }).then(() => {
    window.location = url
  });
}

export { bindSweetAlertButtonDemo, displayInfo };
