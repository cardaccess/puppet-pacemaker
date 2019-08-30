# == Define: pacemaker::stonith::fence_cisco_mds
#
# Module for managing Stonith for fence_cisco_mds.
#
# WARNING: Generated by "rake generate_stonith", manual changes will
# be lost.
#
# === Parameters
#
# [*ipaddr*]
#   IP Address or Hostname
#
# [*login*]
#   Login Name
#
# [*passwd*]
#   Login password or passphrase
#
# [*port*]
#   Physical plug number, name of virtual machine or UUID
#
# [*snmp_version*]
#   Specifies SNMP version to use (1,2c,3)
#
# [*community*]
#   Set the community string
#
# [*ipport*]
#   TCP/UDP port to use for connection with device
#
# [*inet4_only*]
#   Forces agent to use IPv4 addresses only
#
# [*inet6_only*]
#   Forces agent to use IPv6 addresses only
#
# [*passwd_script*]
#   Script to retrieve password
#
# [*snmp_auth_prot*]
#   Set authentication protocol (MD5|SHA)
#
# [*snmp_sec_level*]
#   Set security level (noAuthNoPriv|authNoPriv|authPriv)
#
# [*snmp_priv_prot*]
#   Set privacy protocol (DES|AES)
#
# [*snmp_priv_passwd*]
#   Set privacy protocol password
#
# [*snmp_priv_passwd_script*]
#   Script to run to retrieve privacy password
#
# [*action*]
#   Fencing Action
#
# [*verbose*]
#   Verbose mode
#
# [*debug*]
#   Write debug information to given file
#
# [*separator*]
#   Separator for CSV created by operation list
#
# [*power_timeout*]
#   Test X seconds for status change after ON/OFF
#
# [*shell_timeout*]
#   Wait X seconds for cmd prompt after issuing command
#
# [*login_timeout*]
#   Wait X seconds for cmd prompt after login
#
# [*power_wait*]
#   Wait X seconds after issuing ON/OFF
#
# [*delay*]
#   Wait X seconds before fencing is started
#
# [*retry_on*]
#   Count of attempts to retry power on
#
#  [*interval*]
#   Interval between tries.
#
# [*ensure*]
#   The desired state of the resource.
#
# [*tries*]
#   The number of tries.
#
# [*try_sleep*]
#   Time to sleep between tries.
#
# [*pcmk_host_list*]
#   List of Pacemaker hosts.
#
# [*meta_attr*]
#   (optional) String of meta attributes
#   Defaults to undef
#
# [*deep_compare*]
#   Enable deep comparing of resources and bundles
#   When set to true a resource will be compared in full (options, meta parameters,..)
#   to the existing one and in case of difference it will be repushed to the CIB
#   Defaults to false
#
# [*update_settle_secs*]
#   When deep_compare is enabled and puppet updates a resource, this
#   parameter represents the number (in seconds) to wait for the cluster to settle
#   after the resource update.
#   Defaults to 600 (seconds)
#
# === Dependencies
#  None
#
# === Authors
#
# Generated by rake generate_stonith task.
#
# === Copyright
#
# Copyright (C) 2016 Red Hat Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
define pacemaker::stonith::fence_cisco_mds (
  $ipaddr                  = undef,
  $login                   = undef,
  $passwd                  = undef,
  $port                    = undef,
  $snmp_version            = undef,
  $community               = undef,
  $ipport                  = undef,
  $inet4_only              = undef,
  $inet6_only              = undef,
  $passwd_script           = undef,
  $snmp_auth_prot          = undef,
  $snmp_sec_level          = undef,
  $snmp_priv_prot          = undef,
  $snmp_priv_passwd        = undef,
  $snmp_priv_passwd_script = undef,
  $action                  = undef,
  $verbose                 = undef,
  $debug                   = undef,
  $separator               = undef,
  $power_timeout           = undef,
  $shell_timeout           = undef,
  $login_timeout           = undef,
  $power_wait              = undef,
  $delay                   = undef,
  $retry_on                = undef,

  $meta_attr               = undef,
  $interval                = '60s',
  $ensure                  = present,
  $pcmk_host_list          = undef,

  $tries                   = undef,
  $try_sleep               = undef,

  $deep_compare       = false,
  $update_settle_secs = 600,
) {
  $ipaddr_chunk = $ipaddr ? {
    undef   => '',
    default => "ipaddr=\"${ipaddr}\"",
  }
  $login_chunk = $login ? {
    undef   => '',
    default => "login=\"${login}\"",
  }
  $passwd_chunk = $passwd ? {
    undef   => '',
    default => "passwd=\"${passwd}\"",
  }
  $port_chunk = $port ? {
    undef   => '',
    default => "port=\"${port}\"",
  }
  $snmp_version_chunk = $snmp_version ? {
    undef   => '',
    default => "snmp_version=\"${snmp_version}\"",
  }
  $community_chunk = $community ? {
    undef   => '',
    default => "community=\"${community}\"",
  }
  $ipport_chunk = $ipport ? {
    undef   => '',
    default => "ipport=\"${ipport}\"",
  }
  $inet4_only_chunk = $inet4_only ? {
    undef   => '',
    default => "inet4_only=\"${inet4_only}\"",
  }
  $inet6_only_chunk = $inet6_only ? {
    undef   => '',
    default => "inet6_only=\"${inet6_only}\"",
  }
  $passwd_script_chunk = $passwd_script ? {
    undef   => '',
    default => "passwd_script=\"${passwd_script}\"",
  }
  $snmp_auth_prot_chunk = $snmp_auth_prot ? {
    undef   => '',
    default => "snmp_auth_prot=\"${snmp_auth_prot}\"",
  }
  $snmp_sec_level_chunk = $snmp_sec_level ? {
    undef   => '',
    default => "snmp_sec_level=\"${snmp_sec_level}\"",
  }
  $snmp_priv_prot_chunk = $snmp_priv_prot ? {
    undef   => '',
    default => "snmp_priv_prot=\"${snmp_priv_prot}\"",
  }
  $snmp_priv_passwd_chunk = $snmp_priv_passwd ? {
    undef   => '',
    default => "snmp_priv_passwd=\"${snmp_priv_passwd}\"",
  }
  $snmp_priv_passwd_script_chunk = $snmp_priv_passwd_script ? {
    undef   => '',
    default => "snmp_priv_passwd_script=\"${snmp_priv_passwd_script}\"",
  }
  $action_chunk = $action ? {
    undef   => '',
    default => "action=\"${action}\"",
  }
  $verbose_chunk = $verbose ? {
    undef   => '',
    default => "verbose=\"${verbose}\"",
  }
  $debug_chunk = $debug ? {
    undef   => '',
    default => "debug=\"${debug}\"",
  }
  $separator_chunk = $separator ? {
    undef   => '',
    default => "separator=\"${separator}\"",
  }
  $power_timeout_chunk = $power_timeout ? {
    undef   => '',
    default => "power_timeout=\"${power_timeout}\"",
  }
  $shell_timeout_chunk = $shell_timeout ? {
    undef   => '',
    default => "shell_timeout=\"${shell_timeout}\"",
  }
  $login_timeout_chunk = $login_timeout ? {
    undef   => '',
    default => "login_timeout=\"${login_timeout}\"",
  }
  $power_wait_chunk = $power_wait ? {
    undef   => '',
    default => "power_wait=\"${power_wait}\"",
  }
  $delay_chunk = $delay ? {
    undef   => '',
    default => "delay=\"${delay}\"",
  }
  $retry_on_chunk = $retry_on ? {
    undef   => '',
    default => "retry_on=\"${retry_on}\"",
  }

  $pcmk_host_value_chunk = $pcmk_host_list ? {
    undef   => '$(/usr/sbin/crm_node -n)',
    default => $pcmk_host_list,
  }

  $meta_attr_value_chunk = $meta_attr ? {
    undef   => '',
    default => "meta ${meta_attr}",
  }

  # $title can be a mac address, remove the colons for pcmk resource name
  $safe_title = regsubst($title, ':', '', 'G')

  Exec<| title == 'wait-for-settle' |> -> Pcmk_stonith<||>

  $param_string = "${ipaddr_chunk} ${login_chunk} ${passwd_chunk} ${port_chunk} ${snmp_version_chunk} ${community_chunk} ${ipport_chunk} ${inet4_only_chunk} ${inet6_only_chunk} ${passwd_script_chunk} ${snmp_auth_prot_chunk} ${snmp_sec_level_chunk} ${snmp_priv_prot_chunk} ${snmp_priv_passwd_chunk} ${snmp_priv_passwd_script_chunk} ${action_chunk} ${verbose_chunk} ${debug_chunk} ${separator_chunk} ${power_timeout_chunk} ${shell_timeout_chunk} ${login_timeout_chunk} ${power_wait_chunk} ${delay_chunk} ${retry_on_chunk}  op monitor interval=${interval} ${meta_attr_value_chunk}"

  if $ensure != 'absent' {
    ensure_resource('package', 'fence-agents-cisco-mds', { ensure => 'installed' })
    Package['fence-agents-cisco-mds'] -> Pcmk_stonith["stonith-fence_cisco_mds-${safe_title}"]
  }
  pcmk_stonith { "stonith-fence_cisco_mds-${safe_title}":
    ensure             => $ensure,
    stonith_type       => 'fence_cisco_mds',
    pcmk_host_list     => $pcmk_host_value_chunk,
    pcs_param_string   => $param_string,
    tries              => $tries,
    try_sleep          => $try_sleep,
    deep_compare       => $deep_compare,
    update_settle_secs => $update_settle_secs,
  }
}
