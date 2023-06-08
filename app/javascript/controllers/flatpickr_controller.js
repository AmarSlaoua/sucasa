import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "checkIn" ]

  connect() {
    const options = {
      mode: "range",
      minDate: "today",
      dateFormat: "d-m-Y",
      altInput: true
      };

    console.log("hello")
    flatpickr(this.checkInTarget, options);
  }

  // addFlatpickr(event) {
  //   const options = {
  //   mode: "range",
  //   minDate: "today",
  //   dateFormat: "d-m-Y",
  //   altInput: true
  //   };

  //   console.log("hello'")

  //   flatpickr(this.checkInTarget, options);
  // }
}
