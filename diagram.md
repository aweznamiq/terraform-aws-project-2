                              Internet
                                  │
                                  ▼
                    Application Load Balancer
                           (Public ALB)
                                  │
                 ┌────────────────┴────────────────┐
                 ▼                                 ▼
         Public Subnet A                   Public Subnet B
            10.1.1.0/24                      10.1.2.0/24
                 │
                 ▼
                           Target Group
                                  │
                                  ▼
                     Private EC2 App Server
                         Apache Web Server
                         private-subnet-a
                            10.1.10.0/24
                                  │
                                  ▼
                          Amazon RDS MySQL
                           Private Database
                         private-subnet-b
                            10.1.11.0/24


                    ─────────────────────────

                        Networking Components

                    Internet Gateway (prod-igw)
                                  │
                                  ▼
                         Public Route Table
                    0.0.0.0/0 → Internet Gateway

                                  │
                                  ▼

                           NAT Gateway
                         (public-subnet-a)
                                  │
                                  ▼
                        Private Route Table
                     0.0.0.0/0 → NAT Gateway


                    ─────────────────────────

                         Security Architecture

        Public Access:
        - Application Load Balancer only

        Private Resources:
        - EC2 backend server
        - RDS database

        Administrative Access:
        - AWS Systems Manager Session Manager
        - No public SSH access
