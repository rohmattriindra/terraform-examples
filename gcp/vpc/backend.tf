terraform {
    backend "gcs" {
         credentials = "../creds/serviceaccount.json"
    }
}