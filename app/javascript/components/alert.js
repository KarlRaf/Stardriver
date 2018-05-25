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

const displayInfo = (title, url, text, icon) => {
 swal({
    title: title,
    text: text,
    icon: icon
  }).then(() => {
    window.location = url
  });
}


const deleteInfo = (url) => {
  swal({
  title: "Are you sure?",
  text: "It is not an exercise",
  icon: "warning",
  buttons: true,
  dangerMode: true,
})
.then((willDelete) => {
  if (willDelete) {
    swal("Poof! Gone!", {
      icon: "success",
    });
  } else {
    swal("Abort! We are safe");
  }
}).then(() => {
    window.location = url
  });

}


export { bindSweetAlertButtonDemo, displayInfo, deleteInfo };
