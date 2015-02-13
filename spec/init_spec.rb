# for serverspec documentation: http://serverspec.org/
require_relative 'spec_helper'

pkgs = ['git']

pkgs.each do |pkg|
  describe package("#{pkg}") do
    it { should be_installed }
  end
end

describe file('/root/.gitconfig') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_readable }

  it { should_not be_executable }
end
