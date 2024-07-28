variable "domain_name" {
  description = "The domain name for the CloudFront distribution"
  type        = string
}

variable "app_name" {
  description = "The name of the application"
  type        = string
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate for the CloudFront distribution"
  type        = string
}

variable "origin_ssl_protocols" {
  description = "The SSL protocols to use when communicating with the origin"
  type        = list(string)
  default     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
}

variable "allowed_methods" {
  description = "The HTTP methods that CloudFront will process and forward to your origin"
  type        = list(string)
  default     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
}

variable "cached_methods" {
  description = "The HTTP methods for which CloudFront caches responses"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "geo_restriction_locations" {
  description = "The list of country codes for which CloudFront either to distribute content (whitelist) or not distribute content (blacklist)"
  type        = list(string)
  default     = []
}

variable "price_class" {
  description = "The price class for this distribution"
  type        = string
  default     = "PriceClass_100"
}

variable "viewer_protocol_policy" {
  description = "The protocol policy for the viewer"
  type        = string
  default     = "redirect-to-https"
}

variable "min_ttl" {
  description = "The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin"
  type        = number
  default     = 0
}

variable "default_ttl" {
  description = "The default amount of time (in seconds) that you want objects to stay in CloudFront caches before CloudFront queries your origin"
  type        = number
  default     = 3600
}

variable "max_ttl" {
  description = "The maximum amount of time (in seconds) that you want objects to stay in CloudFront caches before CloudFront queries your origin"
  type        = number
  default     = 86400
}

variable "is_ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution"
  type        = bool
  default     = true
}

variable "default_root_object" {
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL"
  type        = string
  default     = "index.html"
}

variable "comment" {
  description = "Any comments you want to include about the distribution"
  type        = string
  default     = ""
}

variable "aliases" {
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution"
  type        = list(string)
  default     = [var.domain_name, "www.${var.domain_name}"]
}

variable "subject_alternative_names" {
  description = "A list of subject alternative names (SANs) for the ACM certificate"
  type        = list(string)
  default     = ["www.${var.domain_name}"]
}