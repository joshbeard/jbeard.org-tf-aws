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

    dkim          = "v=DKIM1; k=rsa; s=email; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwLut0Bap/mh3HE2rDPchHVrEcaKAfE1X5/k+7fBiIdRgk8GFoMiG3WpbaWygLS0Hw03ZjdeiIPQW/bfB7tz88NIwhIlq4VI2w+oBjF9pciLgzu0gFRGEC1KdRjn7M3YD/KTURS9kAAkgLKFWXqrUsuhuM00mZQn72MA/N9DSPfwIDAQAB"
    domain        = "jbeard.org"
    zone_id       = module.jbeard_org_aws.zone_id
    migadu_verify = "mvqyprbr"
}