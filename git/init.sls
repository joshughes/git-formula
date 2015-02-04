{%- from 'git/settings.sls' import git with context %}

git:
  pkg.installed:
    - name: git

git_config_user_name:
  git.config:
    - name: user.name
    - value: 'root'
    - user: root
    - is_global: True

git_config_user_email:
  git.config:
    - name: user.email
    - value: 'root@localhost'
    - user: root
    - is_global: True

stash.itriagehealth.com:
  ssh_known_hosts:
    - present
    - user: root
