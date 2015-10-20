{%- from 'git/settings.sls' import git with context %}
HOME:
  environ.setenv:
    - value: /root
    
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
  git.config_set:
    - name: user.name
    - value: 'root'
    - user: root
    - global: True

git_config_user_email:
  git.config_set:
    - name: user.email
    - value: 'root@localhost'
    - user: root
    - global: True

stash.itriagehealth.com:
  ssh_known_hosts:
    - present
    - user: root
