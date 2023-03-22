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

    // https://javascript.plainenglish.io/how-to-build-a-search-bar-7d8a8a3d9d00
    const searchInput = document.getElementById("searchInput")

    const titlesFromDOM = document.getElementsByClassName("title")

    searchInput.addEventListener("keyup", (event) => {
      const { value } = event.target;

      // get user search input converted to lowercase
      const searchQuery = value.toLowerCase();

      for (const nameElement of titlesFromDOM) {
        // store name text and convert to lowercase
        let name = nameElement.textContent.toLowerCase();
        // console.log('nameElement.parentElement', nameElement.parentElement) // class="row"
        // console.log('nameElement.parentElement.parentElement', nameElement.parentElement.parentElement) // class="col w-75"
        // console.log('nameElement.parentElement.parentElement.parentElement', nameElement.parentElement.parentElement.parentElement) // class="row g-0 w-100"
        // console.log('nameElement.parentElement.parentElement.parentElement.parentElement', nameElement.parentElement.parentElement.parentElement.parentElement) // class="text-muted..."

        // compare current name to search input
        if (name.includes(searchQuery)) {
            // found name matching search, display it
          // nameElement.parentElement.parentElement.parentElement.parentElement.display = "block";
        } else {
            // no match, don't display name
          nameElement.parentElement.parentElement.parentElement.parentElement.style.display = "none";
        }
      }
    });
  }
}
