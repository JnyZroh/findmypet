import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    mapId: Number
  }


  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/dangne/cl0h23ek0000l14qvlwbirb0e",
      interactive: !(this.mapIdValue == 99)
    });
    this._addMarkersToMap();
    this._fitMapToMarkers();

    if (this.mapIdValue == 99) {
      console.log(this.markersValue[0])

      const center = [this.markersValue[0].lng, this.markersValue[0].lat];
      const radius = 1;
      const options = {
        steps: 20,
        units: "kilometers",
      };


      const circle = turf.circle(center, radius, options);

      this.map.on('load', () => {

        this.map.addSource("circleData", {
          type: "geojson",
          data: circle
        });

        this.map.addLayer({
          id: "circle-fill",
          type: "fill",
          source: "circleData",
          paint: {
            "fill-color": "yellow",
            "fill-opacity": 0.2
          }
        });

      });
    }
  }
  _addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window);

      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "40px"
      customMarker.style.height = "40px"

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map);
    });
  }
  _fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: this.mapIdValue == 99 ? 12.5 : 15, duration: 2000 })
  }
}
