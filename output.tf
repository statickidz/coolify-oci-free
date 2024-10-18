output "coolify_dashboard" {
  value = "http://${oci_core_instance.coolify_main.public_ip}:8000/ (wait 3-5 minutes to finish Coolify installation)"
}

output "coolify_worker_ips" {
  value = [for instance in oci_core_instance.coolify_worker : "${instance.public_ip} (use it to add the server in Coolify Dashboard)"]
}
