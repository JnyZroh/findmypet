import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import flatpickr from "flatpickr";

export default class extends Controller {
  static values = { apiKey: String }
  static targets = ["species", "breed", "address"]

  initialize() {
    this.dogBreeds = '<option value="mixed">Mixed</option>\
                      <option value="husky">Husky</option>\
                      <option value="labrador">Labrador</option>';

    this.catBreeds = '<option value="mixed">Mixed</option>\
                      <option value="scotish-fold">Scotish Fold</option>\
                      <option value="bengal">Bengal</option>';
  }

  connect() {
    flatpickr(".datepicker", {
      maxDate: "today"
    });

    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    });
    this.geocoder.addTo(this.element)

    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
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

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
