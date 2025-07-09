# GPack Roadmap

## Credentialed Sources

Right now GPack only works with HTTP(S) Git repositories, and even if a dependency is initially cloned with SSH access, GPack modifies the source SSH URL to be an HTTPS URL to be able to clone without requiring credentials.

The approach will be to have GPack have commands/tooling to ensure the SSH/Git environment is configured properly for interaction from GPack.