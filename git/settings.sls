{% set p    = salt['pillar.get']('git', {}) %}
{% set pc   = p.get('config', {}) %}
{% set g    = salt['grains.get']('git', {}) %}
{% set gc   = g.get('config', {}) %}

{%- set git = {} %}
{%- do git.update( {
  }) %}
