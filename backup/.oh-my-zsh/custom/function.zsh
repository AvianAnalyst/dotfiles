function aaws {
    eval $(aws sts get-session-token --serial-number arn:aws:iam::830634044500:mfa/kylan.byrd@btr.energy --token-code $1 --no-cli-pager --output json | jq -r '.Credentials | @sh "export AWS_SESSION_TOKEN=\(.SessionToken)\nexport AWS_ACCESS_KEY_ID=\(.AccessKeyId)\nexport AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey) "')
}

function saveMackups {
    echo "Accessing dotfiles backup"
    pushd "${HOME}/dotfiles";
    echo "Commiting with message $1"
    eval $(git commit -am $1)
    echo "pushing"
    eval $(git push)
    echo "returning to where we were"
    popd
}
