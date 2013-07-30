#
# Copyright:: Copyright (c) 2012 Opscode, Inc.
# License:: Apache License, Version 2.0
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

name "rabbitmq"
version "3.1.1"

dependency "erlang"
dependency "rsync"

source :url => "http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.1/rabbitmq-server-generic-unix-3.1.1.tar.gz",
       :md5 => "59cb86f2675c168f10a2a669894fb2d0"

relative_path "rabbitmq_server-3.1.1"

build do
  command "mkdir -p #{install_dir}/embedded/service/rabbitmq"
  command "#{install_dir}/embedded/bin/rsync -a ./ #{install_dir}/embedded/service/rabbitmq/"

  %w{rabbitmqctl rabbitmq-env rabbitmq-server}.each do |cmd|
    command "ln -sf #{install_dir}/embedded/service/rabbitmq/sbin/#{cmd} #{install_dir}/embedded/bin/#{cmd}"
  end
end
