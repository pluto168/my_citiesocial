// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"

//enable action text
require("trix")
require("@rails/actiontext")

Rails.start()
ActiveStorage.start()

import "controllers"

import "scripts/shared"
import "scripts/backend"

import "styles/shared";
import "styles/backend";
