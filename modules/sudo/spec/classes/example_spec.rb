require 'spec_helper'

describe 'template' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "template class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('template::params') }
        it { should contain_class('template::install').that_comes_before('template::config') }
        it { should contain_class('template::config') }
        it { should contain_class('template::service').that_subscribes_to('template::config') }

        it { should contain_service('template') }
        it { should contain_package('template').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'template class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('template') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
