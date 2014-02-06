node.set[:meetme_newrelic_plugin][:postgresql][:enable] = true
if node[:meetme_newrelic_plugin][:postgresql][:psycopg2_install_method] == 'package'
  if platform_family?("rhel")
    include_recipe 'yum-epel'
  end

  package "python-psycopg2" do
    action :install
  end

elsif node[:meetme_newrelic_plugin][:postgresql][:psycopg2_install_method] == 'pip'
  include_recipe 'python'
  include_recipe 'python::pip'

  #install the Python PostgreSQL driver
  python_pip "psycopg2" do
	action :install
  end
end

include_recipe "meetme-newrelic-plugin::default"
