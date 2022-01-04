import flatpickr from "flatpickr";

window.addEventListener('load', (event) => {
  flatpickr(".js-flatpickr", {
    enableTime: true,
    dateFormat: "Y/m/d H:i",
    allowInput: true
  });
});

