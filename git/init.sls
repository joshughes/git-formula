{%- from 'git/settings.sls' import git with context %}

 /root/global/.git:
  file.managed:
    - user: root
    - group: root
    - makedirs: True

git-ppa:
  pkgrepo.managed:
    - ppa: git-core/ppa
    - refresh_db: true

git:
  pkg.installed:
    - name: git
    - require:
      - pkgrepo: git-ppa

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
