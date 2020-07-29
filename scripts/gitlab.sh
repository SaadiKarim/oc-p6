export DEBIAN_FRONTEND=noninteractive
# -qq No output except for errors
apt-get -qq update
# install curl nano & wget fist to add gitlab repo (only curl is needed but anyway)
apt-get -qq install -y curl
# add gitlab repo
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
# external url to access gitlab dashboard
sudo EXTERNAL_URL="https://gitlab.example.com"
# install mandatory packages
apt-get -qq install -y openssh-server ca-certificates postfix git gitlab-ce
# gitlab-ce conf (utf-8 to prevent postgres errors)
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
dpkg-reconfigure locales
gitlab-ctl reconfigure
# runner
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
apt-get install gitlab-runner -y
