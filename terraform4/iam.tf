data "aws_iam_policy" "ssm_managed_core" {
  name = "AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role" "rackula_ssm" {
  name = "tf-rackula-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
      },
    ]
  })

  tags = { Name = "tf-rackula-ssm-role" }
}

resource "aws_iam_role_policy_attachment" "rackula_ssm" {
  role       = aws_iam_role.rackula_ssm.name
  policy_arn = data.aws_iam_policy.ssm_managed_core.arn
}

resource "aws_iam_instance_profile" "rackula_ssm" {
  name = "tf-rackula-ssm-profile"
  role = aws_iam_role.rackula_ssm.name
}
