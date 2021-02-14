import topbar from "topbar"

// Show progress bar on live navigation and form submits
let topbarDelay = null
window.addEventListener("phx:page-loading-start", _info => {
  clearTimeout(topbarDelay)
  topbarDelay = setTimeout(() => topbar.show(), 200)
})
window.addEventListener("phx:page-loading-stop", _info => {
  clearTimeout(topbarDelay)
  topbar.hide()
})
