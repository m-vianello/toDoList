// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="search">
//   <h1 data-target="search.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'

    const searchInput = document.getElementById("searchInput")
    const titlesFromDOM = document.getElementsByClassName("title")

    searchInput.addEventListener("keyup", (event) => {
      const { value } = event.target;
      const searchQuery = value.toLowerCase();

      for (const nameElement of titlesFromDOM) {
        let name = nameElement.textContent.toLowerCase();

        if (!name.includes(searchQuery)) {
          nameElement.parentElement.parentElement.parentElement.parentElement.style.display = "none";
        }
      }
    });
  }
}
