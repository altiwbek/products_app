// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./left_navbar"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("DOMContentLoaded", function(event) {
    const productRemotePagination = document.getElementById('product_remote_pagination');

    if(productRemotePagination !== null){
        window.addEventListener('scroll', function(e) {
            if(document.body.clientHeight < (window.innerHeight + window.scrollY)){
                let next = document.getElementsByClassName('next')[0];
                if (next !== undefined){
                    let url = next.getElementsByTagName('a')[0].getAttribute('href')
                    productRemotePagination.innerHTML = "";
                    Rails.ajax({
                        type: "get",
                        url: url,
                        dataType: "script"
                    });
                }
            }
        });
    }
});
