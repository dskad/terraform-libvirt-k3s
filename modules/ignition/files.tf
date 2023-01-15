# Get kernel config file (turn off the console noise!)
data "ignition_file" "silence_audit_messages" {
  path = "/etc/sysctl.d/20-silence-audit.conf"
  mode = 420 # decimal 0644
  content {
    content = file("${path.module}/files/sysctl/20-silence-audit.conf")
  }
}

# Set the hostname
data "ignition_file" "hostname" {
  path  = "/etc/hostname"
  mode  = 420 # decimal 0644
  content {
    content = var.hostname
  }
}

# Get k3s install script
data "ignition_file" "k3s_install_script" {
  path = "/opt/bin/k3s-install.sh"
  mode = 775
  source {
    source = "https://get.k3s.io"
  }
}