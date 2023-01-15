variable "ssh_authorized_keys" {
  type        = list(string)
  description = "SSH authorized keys to be added to the core user"
  validation {
    condition     = length(var.ssh_authorized_keys) > 0
    error_message = "The ssh_authorized_keys value must be set"
  }
  sensitive = true
}

variable "hostname" {
  type = string
  description = "VM host name"
  validation {
    condition = length(var.hostname) > 0
    error_message = "The hostname must be set"
  }
}

variable "k3s_install_options" {
  type        = map(string)
  description = "Install options to pass to k3s-install.sh"
  default = {
    "INSTALL_K3S_EXEC"    = "server --cluster-init",
    "INSTALL_K3S_CHANNEL" = "stable" # stable, latest, testing
  }
}

# TODO The first server node initializes the cluster with --custer-init
#       The subsusequent nodes join the cluster with K3S_URL set to the first node
# variable "k3s_server_options" {
#   type        = map(string)
#   description = "Options for k3s in server mode"
#   default = {
#     "K3S_TOKEN"          = "secret_cluster_token",
#     "K3S_SERVER_EXEC"    = "--server",
#     "K3S_SERVER_CHANNEL" = "latest" # https://update.k3s.io/v1-release/channels
#   }
# }

# variable "k3s_agent_options" {
#   type        = map(string)
#   description = "Options for k3s in agent mode"
#   default = {
#     "K3S_TOKEN"          = "secret_cluster_token",
#     "K3S_SERVER_EXEC"    = "--server",
#     "K3S_SERVER_CHANNEL" = "stable" # stable, latest, testing
#   }
# }
