provider "libvirt" {
  uri = var.libvirt_uri
}

module "coreos_ignition" {
  source              = "./modules/ignition"
  hostname       = var.hostname
  ssh_authorized_keys = var.ssh_authorized_keys
}

resource "libvirt_ignition" "ignition" {
  name    = "${var.hostname}.ign"
  pool    = "default"
  content = module.coreos_ignition.ignition_configuration.rendered
}


resource "libvirt_domain" "coreos" {
  name            = var.hostname
  autostart       = true
  vcpu            = var.vcpu
  memory          = var.vmem
  qemu_agent      = true
  fw_cfg_name     = "opt/com.coreos/config"
  coreos_ignition = libvirt_ignition.ignition.id


  cpu {
    mode = "host-passthrough"
  }

  network_interface {
    bridge         = "br0"
    wait_for_lease = true
  }

  disk {
    volume_id = libvirt_volume.coreos_node.id
    scsi      = true
  }

  video {
    type = "virtio"
  }

  xml {
    xslt = file("${path.module}/files/xsl/add_GA_channel.xsl")
  }
}
