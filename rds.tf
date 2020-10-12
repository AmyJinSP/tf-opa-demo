resource "aws_db_subnet_group" "data-network-zone" {
  name = "data-demo-data-zone"
  description = "Data zone subnets for data-demo"

  subnet_ids = flatten([module.vpc.private_subnets])

  tags = {
    Name = "data-demo"
  }
}

resource "aws_security_group" "rds_postgres" {
  name        = "data-rds-postgres"
  description = "Security control point for ingress to Postgres RDS instances"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_db_instance" "demopostgres" {
  identifier = "demo-postgres"
  name = "demopostgres1"
  final_snapshot_identifier="demopostgres1final"

  engine = "Postgres"
  allow_major_version_upgrade = "true"
  engine_version = "11"
  multi_az = false
  instance_class = "db.t2.micro"
  db_subnet_group_name = aws_db_subnet_group.data-network-zone.id

  username = "demo_rds_user"
  password = "temporaryPasswordOverridden"

  storage_type = "gp2"
  allocated_storage = 50

  vpc_security_group_ids = [aws_security_group.rds_postgres.id]
                             
  tags = {
    Name = "demo-db"
  }
  backup_retention_period = 7
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
}