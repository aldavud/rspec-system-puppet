require 'spec_helper_system'

describe "basic tests:" do
  it "check puppet_install works" do
    puppet_install()
  end

  it 'check master install works' do
    puppet_master_install()

    puppet_agent do |r|
      r[:stderr].should == ''
      r[:exit_code].should == 0
    end
  end

  it 'try puppet agent with debug enabled' do
    puppet_agent(:debug => true) do |r|
      r[:stderr].should == ''
      r[:stdout].should =~ /Debug:/
      r[:exit_code].should == 0
    end
  end

  it 'facter domain should return something valid' do
    system_run("facter domain") do |r|
      r[:stdout].should =~ /[a-z]+/
      r[:stderr].should == ''
      r[:exit_code].should == 0
    end
  end

  it 'facter fqdn should return something valid' do
    system_run("facter fqdn") do |r|
      r[:stdout].should =~ /vm/
      r[:stderr].should == ''
      r[:exit_code].should == 0
    end
  end

  it 'check puppet_resource returns an exit code of 0' do
    puppet_resource('user') do |r|
      r[:stderr].should == ''
      r[:exit_code].should == 0
    end
  end

  it 'check puppet apply with just a notice' do
    puppet_apply('notice("foo")') do |r|
      r[:stdout].should =~ /foo/
      r[:stderr].should == ''
      r[:exit_code].should == 0
    end
  end

  it 'try puppet apply with debug mode' do
    puppet_apply(:code => 'notice("foo")', :debug => true) do |r|
      r[:stdout].should =~ /foo/
      r[:stdout].should =~ /Debug:/
      r[:stderr].should == ''
      r[:exit_code].should == 0
    end
  end

  it 'try puppet apply with trace off' do
    puppet_apply(:code => 'notice("foo")', :trace => false) do |r|
      r[:stdout].should =~ /foo/
      r[:stderr].should == ''
      r[:exit_code].should == 0
    end
  end
end
