# Deployment of AWS resources for jbeard.co
module "jbeard_org_aws" {
    source = "github.com/joshbeard/tf-aws-site.git"

    domain          = "jbeard.org"
    bucket_name     = "s3-website-jbeard-org"
    log_bucket_name = "jbeard-logs"
    log_prefix      = "jbeard/"
    iam_name        = "s3-deployer-jbeard-org"
}

module "jbeard_org_migadu" {
    source = "github.com/joshbeard/tf-migadu-route53.git"

    domain        = "jbeard.org"
    zone_id       = module.jbeard_org_aws.zone_id
    migadu_verify = "mvqyprbr"
}
