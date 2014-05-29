#
# Cookbook Name:: gecos-ws-mgmt
# Recipe:: local
#
# Copyright 2013, Junta de Andalucia
# http://www.juntadeandalucia.es/
#
# All rights reserved - EUPL License V 1.1
# http://www.osor.eu/eupl
#

#include_recipe "gecos_ws_mgmt::sssd_mgmt"


if not node[:gecos_ws_mgmt][:misc_mgmt][:tz_date_res].nil?
  gecos_ws_mgmt_tz_date 'localtime' do
    server node[:gecos_ws_mgmt][:misc_mgmt][:tz_date_res][:server]
    job_ids node[:gecos_ws_mgmt][:misc_mgmt][:tz_date_res][:job_ids]
    action :setup
  end
end

if not node[:gecos_ws_mgmt][:misc_mgmt][:chef_conf_res].nil?
  gecos_ws_mgmt_chef node[:gecos_ws_mgmt][:misc_mgmt][:chef_conf_res][:chef_server_url] do
    chef_link node[:gecos_ws_mgmt][:misc_mgmt][:chef_conf_res][:chef_link]
    chef_validation_pem node[:gecos_ws_mgmt][:misc_mgmt][:chef_conf_res][:chef_validation_pem]
    chef_node_name node[:gecos_ws_mgmt][:misc_mgmt][:chef_conf_res][:chef_node_name]
    chef_admin_name node[:gecos_ws_mgmt][:misc_mgmt][:chef_conf_res][:chef_admin_name]
    chef_link_existing node[:gecos_ws_mgmt][:misc_mgmt][:chef_conf_res][:chef_link_existing]
    job_ids node[:gecos_ws_mgmt][:misc_mgmt][:chef_conf_res][:job_ids]
    action  :setup
  end
end

if not node[:gecos_ws_mgmt][:misc_mgmt][:gcc_res].nil?
  gecos_ws_mgmt_gcc node[:gecos_ws_mgmt][:misc_mgmt][:gcc_res][:uri_gcc] do
    gcc_link node[:gecos_ws_mgmt][:misc_mgmt][:gcc_res][:gcc_link]
    gcc_nodename node[:gecos_ws_mgmt][:misc_mgmt][:gcc_res][:gcc_nodename]
    gcc_username node[:gecos_ws_mgmt][:misc_mgmt][:gcc_res][:gcc_username]
    gcc_pwd_user node[:gecos_ws_mgmt][:misc_mgmt][:gcc_res][:gcc_pwd_user]
    run_attr node[:gecos_ws_mgmt][:misc_mgmt][:gcc_res][:run_attr]
    gcc_selected_ou node[:gecos_ws_mgmt][:misc_mgmt][:gcc_res][:gcc_selected_ou]
    job_ids node[:gecos_ws_mgmt][:misc_mgmt][:gcc_res][:job_ids]
    action  :setup
  end
end

if not node[:gecos_ws_mgmt][:network_mgmt][:sssd_res].nil?
  gecos_ws_mgmt_sssd node[:gecos_ws_mgmt][:network_mgmt][:sssd_res][:domain_list] do
    enabled node[:gecos_ws_mgmt][:network_mgmt][:sssd_res][:enabled]
    workgroup node[:gecos_ws_mgmt][:network_mgmt][:sssd_res][:workgroup]
    job_ids node[:gecos_ws_mgmt][:network_mgmt][:sssd_res][:job_ids]
    action  :setup
  end
end
