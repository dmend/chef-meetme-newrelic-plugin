node.set[:meetme_newrelic_plugin][:postgresql][:enable] = true

#install the Python PostgreSQL driver
python_pip "psycopg2" do
  action :install
end

include_recipe "meetme-newrelic-plugin::default"