#
# Cookbook Name:: ssh-ldap
# Attributes:: default
#
# Copyright 2013, OSU Open Source Lab
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
# Attributes are commented out using the default config file values.
# Uncomment the ones you need, or set attributes in a role.
#

# OpenSSH config
default['openssh']['server']['authorized_keys_command'] = "/usr/libexec/openssh/ssh-ldap-wrapper"
default['openssh']['server']['authorized_keys_command_run_as'] = "nobody"

# nsswitch config
default['nsswitch']['passwd'] = "files ldap"
default['nsswitch']['shadow'] = "files ldap"
default['nsswitch']['group'] = "files ldap"
default['nsswitch']['netgroup'] = "files ldap"
default['nsswitch']['automount'] = "files ldap"

# LDAP client config
default['ldap']['uri'] = nil
default['ldap']['base'] = nil
default['ldap']['timelimit'] = "3"
default['ldap']['bind_timelimit'] = "3"
default['ldap']['ssl'] = "on"
default['ldap']['scope'] = "one"
default['ldap']['pam_check_host_attr'] = "yes"
default['ldap']['pam_member_attribute'] = "memberuid"
default['ldap']['pam_password'] = "exop"
default['ldap']['nss_initgroups_ignoreusers'] = "root,ldap,named,avahi,haldaemon,apache"
default['ldap']['base_passwd'] = "ou=People,#{ldap['base']}"
default['ldap']['base_shadow'] = "ou=People,#{ldap['base']}"
default['ldap']['base_group'] = "ou=Group,#{ldap['base']}"
default['ldap']['tls_reqcert'] = "allow"
default['ldap']['tls_cacertfile'] = "/etc/ssl/certs/ca-bundle.crt"
default['ldap']['tls_cacertdir'] = "/etc/openldap/cacerts"
default['ldap']['nslcd']['user'] = "nslcd"
default['ldap']['nslcd']['group'] = "ldap"
