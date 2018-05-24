import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const sweetalert = document.querySelector('.sweet-alert')
  if ( sweetalert ) {
  sweetalert.addEventListener('click', () => {
    swal({
      title: "A nice alert",
      text: "This is a great alert, isn't it?",
      icon: "success"
    })
  });
};
};

export { bindSweetAlertButtonDemo };
