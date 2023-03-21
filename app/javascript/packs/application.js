// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

function changeColor(color) {
  document.getElementById('changeColor').style.color=color
  console.log("color change!")
}

window.changeColor = changeColor

// const displayTitle = document.getElementById('displayTitle')
// const inputTitle = document.getElementById('inputTitle') //.value = 'butts'

// inputTitle.addEventListener("input", updateDisplayTitle)

// function updateDisplayTitle(e) {
//   // displayTitle.textContent = e.target.value
//   console.log('e', e)
// }

// window.updateDisplayTitle = updateDisplayTitle

// document.addEventListener("turbo:before-fetch-response", function (e) {
// const input = document.querySelector("input");
// const log = document.getElementById("values");

// input.addEventListener("input", updateValue);

// function updateValue(e) {
//   // log.textContent = e.target.value;
//   console.log('e.target.value', e.target.value)
// }

// window.updateValue = updateValue
// })