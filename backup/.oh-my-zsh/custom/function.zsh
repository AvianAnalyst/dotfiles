function aaws {
    eval $(aws sts get-session-token --serial-number arn:aws:iam::830634044500:mfa/kylan.byrd@btr.energy --token-code $1 --no-cli-pager --output json | jq -r '.Credentials | @sh "export AWS_SESSION_TOKEN=\(.SessionToken)\nexport AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey) "')
}
