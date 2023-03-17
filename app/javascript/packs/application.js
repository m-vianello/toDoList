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

// console.log('outisdemyevent')
//   console.log('myevent')
//   const button = document.getElementById("navbarSideCollapse")
//   button.addEventListener("click", (event) => {
//     console.log('butts')
//   })

// console.log('buts more buts')