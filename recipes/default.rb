#
# Cookbook Name:: supervisord
# Recipe:: default
#
# Copyright 2011, Atalanta Systems Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "supervisor"

cookbook_file "/etc/supervisor/supervisord.conf" do
  source "supervisord.conf"
  owner "root"
  group "root"
  mode "0644"
end

service "supervisor" do
  supports :status => true, :restart => true, :reload => true
  reload_command "supervisorctl update"
  action [:enable, :start]
end

