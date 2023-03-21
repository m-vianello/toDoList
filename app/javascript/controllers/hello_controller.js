// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'

    const displayTitle = document.getElementById("displayTitle")
    const inputTitle = document.getElementById('inputTitle') // .innerHTML

    inputTitle.addEventListener('input', (event) => {

      // console.log('diplayTitle.innerHTML', displayTitle.innerHTML)
      // console.log('inputTitle.value', inputTitle.value)
      displayTitle.innerHTML = inputTitle.value
    })

  }
}
