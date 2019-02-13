provider "google" {
  project = "${var.gcp_project_id}"
  region  = "${var.gcp_region}"
  zone    = "${var.gcp_zone}"
  version = "~> 2.0"
}

terraform {
  required_version = ">= 0.10.0"
}


resource "google_compute_network" "tor_network" {
  name                    = "${var.tor_network_name}"
  auto_create_subnetworks = "true"
}


resource "google_compute_address" "tor_external_address" {
  name         = "${format("tor-external-address-%02d", count.index + 1)}"
  count        = "${var.tor_node_count}"
  address_type = "EXTERNAL"
}


resource "google_compute_firewall" "tor_firewall" {
  name    = "tor-firewall"
  network = "${google_compute_network.tor_network.name}"

  # SSH
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # Onion Router 1 and 2
  allow {
    protocol = "tcp"
    ports    = ["9000", "9100"]
  }

  # Directory Ports for relay node
  allow {
    protocol = "tcp"
    ports    = [9001, 9101]
  }

  # Directory Ports for exit node
  allow {
    protocol = "tcp"
    ports    = [80, 81]
  }
}


resource "google_compute_instance" "tor_node" {
  name         = "${format("${var.tor_nickname}-%02d", count.index + 1)}"
  machine_type = "${var.tor_machine_type}"
  count        = "${var.tor_node_count}"

  boot_disk {
    initialize_params {
      image = "${var.tor_base_image}"
    }
  }

  network_interface {
    network = "${google_compute_network.tor_network.name}"
    access_config {
      nat_ip =  "${element(google_compute_address.tor_external_address.*.address, count.index)}"
    }
  }

  metadata = {
    role = "tor"
  }
}
