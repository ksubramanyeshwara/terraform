# Terraform State

- It is a file that keeps track of infrastructure terraform creates and manages.

## What it does?

- Resource mapping: Maps your configuration code into the actual resources on cloud.
- Stores metadata: resource dependencies, provider info, outputs
- Enables planning: compares desired state vs current state to compute diffs

## Security & Best Practices

- Never commit state to Git: it contains sensitive values. Use `.gitignore` for `*.tfstate*`
- Restrict access: State files reveal your entire infrastructure topology. Limit who can read/write
- Collaboration Issues: Always configure locking backends for shared environments
- Backup state: Enable versioning on S3 buckets to recover from corruption
- Use workspaces to manage multiple environments (dev, staging, prod)

## Remote Backend

- It is a configuration that tells terraform to store its state file in shared and persistent remote location.

### Why use a remote backend?

- Shared state: team members work from the same source of truth
- State locking: prevents concurrent apply conflicts
- Security: state isn't sitting in a git repo
- Versioning: recover from bad applies with state history

### How It Works (Flow)

1. You run:
   - `terraform init`

2. Terraform:
   - Connects to S3
   - Downloads existing state (if any)
   - Sets up backend

3. When you run:
   - `terraform apply`

4. Terraform:
   - Locks state (via DynamoDB)
   - Applies changes
   - Updates state in S3
