import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import flatpickr from "flatpickr";
import dotenv from "dotenv";

export default class extends Controller {
  static values = { apiKey: String }
  static targets = ["species", "breed", "address"]

  initialize() {
    dotenv.config();

    this.apiKey = "pk.eyJ1IjoiZGFuZ25lIiwiYSI6ImNrejh3emM4NjFwMnUydm54MjB0dGxzazIifQ.G8jnQ0-A61rNSRWICxflTw";

    this.dogBreeds = '<option value="mixed">Mixed</option>\
                      <option value="husky">Husky</option>\
                      <option value="labrador">Labrador</option>';

    this.catBreeds = '<option value="mixed">Mixed</option>\
                      <option value="scotish-fold">Scotish Fold</option>\
                      <option value="bengal">Bengal</option>';
  }

  connect() {
    this.geocoderLoader()

    this.pickerLoader()

    if (this.speciesTarget.value === "Dog") {
      this.breedTarget.innerHTML = this.dogBreeds;
    }else if (this.speciesTarget.value === "Cat") {
      this.breedTarget.innerHTML = this.catBreeds;
    }
  }

  pickerLoader() {
    flatpickr(".datepicker", {
      maxDate: "today"
    });
  }

  geocoderLoader() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.addressTarget.dataset.posterFormApiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    });
    this.geocoder.addTo(this.addressTarget)
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
  }

  #setInputValue(event) {
    // console.log(this.addressTarget.getElementsByTagName('input')[0].value);
    this.addressTarget.getElementsByTagName('input')[0].value = event.result["place_name"]
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
