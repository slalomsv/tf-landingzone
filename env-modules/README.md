# Environment Modules
These modules represent complete environments/VPCs and are primarily composed of infrastructure modules.

## Usage & Best Practices
Environment Modules may be owned and managed independently and are segregated to accomplish this.
The Live Infrastructure module should be used when deploying changes as it manages the complete architecture including definitions of inter-VPC communications.
Environment Modules should include, at minimum, any outputs which are required for proper instantiation and network/peering configuration at the Live Infrastructure level.

