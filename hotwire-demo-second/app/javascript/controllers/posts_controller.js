import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["title"]

  connect() {
    console.log("Posts Controller connected!")
  }

  updateTitle() {
    this.titleTarget.innerText = "Updated with Stimulus!"
  }
}
