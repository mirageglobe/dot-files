output "output_lookup_example" {
  value       = lookup({ a = "ay", b = "bee" }, "a", "what?") # result: ay
  description = "instance - docker registry"
}

output "output_lookup_default_example" {
  value       = lookup({ a = "ay", b = "bee" }, "c", "what?") # result: what?
  description = "instance - docker registry"
}
