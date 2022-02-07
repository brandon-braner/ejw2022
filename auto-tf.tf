resource "google_project" "blb_ejw" {
  auto_create_network = true
  billing_account     = "0148B7-D2630E-C3EE16"
  name                = "blb-ejw"
  project_id          = "blb-ejw"
}
# terraform import google_project.blb_ejw projects/blb-ejw
resource "google_service_account" "blbejw_admin" {
  account_id   = "blbejw-admin"
  display_name = "blbejw-admin"
  project      = "blb-ejw"
}
# terraform import google_service_account.blbejw_admin projects/blb-ejw/serviceAccounts/blbejw-admin@blb-ejw.iam.gserviceaccount.com
resource "google_project_service" "bigquery_googleapis_com" {
  project = "526560443437"
  service = "bigquery.googleapis.com"
}
# terraform import google_project_service.bigquery_googleapis_com 526560443437/bigquery.googleapis.com
resource "google_service_account" "blb_ejw" {
  account_id   = "blb-ejw"
  display_name = "App Engine default service account"
  project      = "blb-ejw"
}
# terraform import google_service_account.blb_ejw projects/blb-ejw/serviceAccounts/blb-ejw@blb-ejw.iam.gserviceaccount.com
resource "google_project_service" "containerregistry_googleapis_com" {
  project = "526560443437"
  service = "containerregistry.googleapis.com"
}
# terraform import google_project_service.containerregistry_googleapis_com 526560443437/containerregistry.googleapis.com
resource "google_project_service" "cloudapis_googleapis_com" {
  project = "526560443437"
  service = "cloudapis.googleapis.com"
}
# terraform import google_project_service.cloudapis_googleapis_com 526560443437/cloudapis.googleapis.com
resource "google_project_service" "pubsub_googleapis_com" {
  project = "526560443437"
  service = "pubsub.googleapis.com"
}
# terraform import google_project_service.pubsub_googleapis_com 526560443437/pubsub.googleapis.com
resource "google_project_service" "cloudasset_googleapis_com" {
  project = "526560443437"
  service = "cloudasset.googleapis.com"
}
# terraform import google_project_service.cloudasset_googleapis_com 526560443437/cloudasset.googleapis.com
resource "google_project_service" "clouddebugger_googleapis_com" {
  project = "526560443437"
  service = "clouddebugger.googleapis.com"
}
# terraform import google_project_service.clouddebugger_googleapis_com 526560443437/clouddebugger.googleapis.com
resource "google_project_service" "servicemanagement_googleapis_com" {
  project = "526560443437"
  service = "servicemanagement.googleapis.com"
}
# terraform import google_project_service.servicemanagement_googleapis_com 526560443437/servicemanagement.googleapis.com
resource "google_project_service" "datastore_googleapis_com" {
  project = "526560443437"
  service = "datastore.googleapis.com"
}
# terraform import google_project_service.datastore_googleapis_com 526560443437/datastore.googleapis.com
resource "google_project_service" "logging_googleapis_com" {
  project = "526560443437"
  service = "logging.googleapis.com"
}
# terraform import google_project_service.logging_googleapis_com 526560443437/logging.googleapis.com
resource "google_project_service" "cloudtrace_googleapis_com" {
  project = "526560443437"
  service = "cloudtrace.googleapis.com"
}
# terraform import google_project_service.cloudtrace_googleapis_com 526560443437/cloudtrace.googleapis.com
resource "google_project_service" "serviceusage_googleapis_com" {
  project = "526560443437"
  service = "serviceusage.googleapis.com"
}
# terraform import google_project_service.serviceusage_googleapis_com 526560443437/serviceusage.googleapis.com
resource "google_storage_bucket" "gcf_sources_526560443437_us_central1" {
  cors {
    method = ["GET"]
    origin = ["https://*.cloud.google.com", "https://*.corp.google.com", "https://*.corp.google.com:*"]
  }
  force_destroy               = false
  location                    = "US-CENTRAL1"
  name                        = "gcf-sources-526560443437-us-central1"
  project                     = "blb-ejw"
  public_access_prevention    = "inherited"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
# terraform import google_storage_bucket.gcf_sources_526560443437_us_central1 gcf-sources-526560443437-us-central1
resource "google_project_service" "bigquerystorage_googleapis_com" {
  project = "526560443437"
  service = "bigquerystorage.googleapis.com"
}
# terraform import google_project_service.bigquerystorage_googleapis_com 526560443437/bigquerystorage.googleapis.com
resource "google_project_service" "storage_component_googleapis_com" {
  project = "526560443437"
  service = "storage-component.googleapis.com"
}
# terraform import google_project_service.storage_component_googleapis_com 526560443437/storage-component.googleapis.com
resource "google_project_service" "cloudfunctions_googleapis_com" {
  project = "526560443437"
  service = "cloudfunctions.googleapis.com"
}
# terraform import google_project_service.cloudfunctions_googleapis_com 526560443437/cloudfunctions.googleapis.com
resource "google_storage_bucket" "us_artifacts_blb_ejw_appspot_com" {
  force_destroy            = false
  location                 = "US"
  name                     = "us.artifacts.blb-ejw.appspot.com"
  project                  = "blb-ejw"
  public_access_prevention = "inherited"
  storage_class            = "STANDARD"
}
# terraform import google_storage_bucket.us_artifacts_blb_ejw_appspot_com us.artifacts.blb-ejw.appspot.com
resource "google_project_service" "sql_component_googleapis_com" {
  project = "526560443437"
  service = "sql-component.googleapis.com"
}
# terraform import google_project_service.sql_component_googleapis_com 526560443437/sql-component.googleapis.com
resource "google_project_service" "storage_api_googleapis_com" {
  project = "526560443437"
  service = "storage-api.googleapis.com"
}
# terraform import google_project_service.storage_api_googleapis_com 526560443437/storage-api.googleapis.com
resource "google_project_service" "storage_googleapis_com" {
  project = "526560443437"
  service = "storage.googleapis.com"
}
# terraform import google_project_service.storage_googleapis_com 526560443437/storage.googleapis.com
resource "google_project_service" "monitoring_googleapis_com" {
  project = "526560443437"
  service = "monitoring.googleapis.com"
}
# terraform import google_project_service.monitoring_googleapis_com 526560443437/monitoring.googleapis.com
resource "google_project_service" "cloudbuild_googleapis_com" {
  project = "526560443437"
  service = "cloudbuild.googleapis.com"
}
# terraform import google_project_service.cloudbuild_googleapis_com 526560443437/cloudbuild.googleapis.com
