import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "species", "breed"]

  initialize() {
    this.dogBreeds = '<option value="mixed">Mixed</option>\
                      <option value="husky">Husky</option>\
                      <option value="labrador">Labrador</option>';

    this.catBreeds = '<option value="mixed">Mixed</option>\
                      <option value="scotish-fold">Scotish Fold</option>\
                      <option value="bengal">Bengal</option>';
  }

  connect() {
    console.log(this.speciesTarget);
    console.log(this.breedTarget);
  }

  update() {
    if (this.speciesTarget.value != "") {
      this.breedTarget.disabled = false;
    }else{
      this.breedTarget.disabled = true;
    }

    if (this.speciesTarget.value === "Dog") {
      this.breedTarget.innerHTML = this.dogBreeds;
    }else if (this.speciesTarget.value === "Cat") {
      this.breedTarget.innerHTML = this.catBreeds;
    }

    console.log(this.speciesTarget.value);
  }
}
