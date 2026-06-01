# dbre-lab: SQL Migration & Auditing

## Project Overview
This project demonstrates a cloud-native database reliability engineering (DBRE) workflow. 
Key features include:
- Infrastructure as Code (IaC) using **Terraform**.
- Configuration Management via **Ansible**.
- Automated CI/CD pipelines using **GitHub Actions**.
- Transitioned deployment auditing from a monolithic SQL table to **Azure Table Storage** (NoSQL) for better decoupling and reliability.

## Status: Decommissioned
**Date:** June 1, 2026
**Current State:** All cloud resources for the Dev and Prod environments have been destroyed via `terraform destroy`. 
The codebase is preserved here for reference and can be re-provisioned by running the Terraform apply commands.