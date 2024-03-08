import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log("hello")
    mapboxgl.accessToken = "pk.eyJ1IjoiZmlubm1hY20iLCJhIjoiY2xzc3M5c2wxMGZucDJqcGdpZDV5Y3Z4NCJ9.gcvDdz9cDEqbtq0eBoRzMw"

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/finnmacm/clthcz8pl00dg01nrct9409rf"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    console.log({markers: this.markersValue})
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


}
