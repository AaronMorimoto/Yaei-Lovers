// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

//bootstrapの反映
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application" 

//fortawesomeの反映
import '@fortawesome/fontawesome-free/js/all'

//controllers内のStimulusスタートファイルの反映
import 'controllers'

//Ratyの反映
import Raty from "raty.js"
window.raty = function(elem,opt) {
  let raty =  new Raty(elem,opt)
  raty.init();
  return raty;
}


//新規作成したcssファイルの反映（例）
//import '../stylesheets/ファイル名.css'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
