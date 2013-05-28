#
# Author:: Ben Newton (<ben@sumologic.com>)
# Cookbook Name:: sumologic-collector
# Recipe:: Install, Register, and Configure Collector
#
# Copyright 2013, Sumo Logic
#
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

#
# Sumo Logic Help Links
# https://service.sumologic.com/ui/help/Default.htm#Unattended_Installation_from_a_Linux_Script_using_the_Collector_Management_API.htm
# https://service.sumologic.com/ui/help/Default.htm#Using_sumo.conf.htm
# https://service.sumologic.com/ui/help/Default.htm#JSON_Source_Configuration.htm
#

if File.exists? "#{node['sumologic']['installDir']}"
    Chef::Log.info "Sumo Logic install detected."
    # Sumo Logic does exist
    # -Add in any update recipes here.
    else
    Chef::Log.info "Sumo Logic was not detected proceeding with installation and configuration."
    # Sumo Logic does not exist
    # 1. Set up sumo.conf for unattended install and activation
    # 2. Set up JSON for source configuration
    # 3. Install collector
    # 4. Clean up config files
    include_recipe 'sumologic-collector::sumoconf'
    include_recipe 'sumologic-collector::sumojson'
    include_recipe 'sumologic-collector::install'
    include_recipe 'sumologic-collector::cleanup'
end