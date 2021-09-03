# == Define: pacemaker::stonith::fence_kubevirt
#
# Module for managing Stonith for fence_kubevirt.
#
# WARNING: Generated by "rake generate_stonith", manual changes will
# be lost.
#
# === Parameters
#
# [*action*]
#   Fencing action
#
# [*plug*]
#   Physical plug number on device, UUID or identification of machine
#
# [*port*]
#   Physical plug number on device, UUID or identification of machine
#
# [*ssl_insecure*]
#   Use SSL connection without verifying certificate
#
# [*namespace*]
#   Namespace of the KubeVirt machine.
#
# [*kubeconfig*]
#   Kubeconfig file path
#
# [*apiversion*]
#   Version of the KubeVirt API.
#
# [*quiet*]
#   Disable logging to stderr. Does not affect --verbose or --debug-file or logging to syslog.
#
# [*verbose*]
#   Verbose mode. Multiple -v flags can be stacked on the command line (e.g., -vvv) to increase verbosity.
#
# [*verbose_level*]
#   Level of debugging detail in output. Defaults to the number of --verbose flags specified on the command line, or to 1 if verbose=1 in a stonith device configuration (i.e., on stdin).
#
# [*debug*]
#   Write debug information to given file
#
# [*debug_file*]
#   Write debug information to given file
#
# [*separator*]
#   Separator for CSV created by 'list' operation
#
# [*delay*]
#   Wait X seconds before fencing is started
#
# [*disable_timeout*]
#   Disable timeout (true/false) (default: true when run from Pacemaker 2.0+)
#
# [*login_timeout*]
#   Wait X seconds for cmd prompt after login
#
# [*power_timeout*]
#   Test X seconds for status change after ON/OFF
#
# [*power_wait*]
#   Wait X seconds after issuing ON/OFF
#
# [*shell_timeout*]
#   Wait X seconds for cmd prompt after issuing command
#
# [*stonith_status_sleep*]
#   Sleep X seconds between status calls during a STONITH action
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
define pacemaker::stonith::fence_kubevirt (
  $action               = undef,
  $plug                 = undef,
  $port                 = undef,
  $ssl_insecure         = undef,
  $namespace            = undef,
  $kubeconfig           = undef,
  $apiversion           = undef,
  $quiet                = undef,
  $verbose              = undef,
  $verbose_level        = undef,
  $debug                = undef,
  $debug_file           = undef,
  $separator            = undef,
  $delay                = undef,
  $disable_timeout      = undef,
  $login_timeout        = undef,
  $power_timeout        = undef,
  $power_wait           = undef,
  $shell_timeout        = undef,
  $stonith_status_sleep = undef,
  $retry_on             = undef,

  $meta_attr            = undef,
  $interval             = '60s',
  $ensure               = present,
  $pcmk_host_list       = undef,

  $tries                = undef,
  $try_sleep            = undef,

  $deep_compare       = false,
  $update_settle_secs = 600,
) {
  $action_chunk = $action ? {
    undef   => '',
    default => "action=\"${action}\"",
  }
  $plug_chunk = $plug ? {
    undef   => '',
    default => "plug=\"${plug}\"",
  }
  $port_chunk = $port ? {
    undef   => '',
    default => "port=\"${port}\"",
  }
  $ssl_insecure_chunk = $ssl_insecure ? {
    undef   => '',
    default => "ssl_insecure=\"${ssl_insecure}\"",
  }
  $namespace_chunk = $namespace ? {
    undef   => '',
    default => "namespace=\"${namespace}\"",
  }
  $kubeconfig_chunk = $kubeconfig ? {
    undef   => '',
    default => "kubeconfig=\"${kubeconfig}\"",
  }
  $apiversion_chunk = $apiversion ? {
    undef   => '',
    default => "apiversion=\"${apiversion}\"",
  }
  $quiet_chunk = $quiet ? {
    undef   => '',
    default => "quiet=\"${quiet}\"",
  }
  $verbose_chunk = $verbose ? {
    undef   => '',
    default => "verbose=\"${verbose}\"",
  }
  $verbose_level_chunk = $verbose_level ? {
    undef   => '',
    default => "verbose_level=\"${verbose_level}\"",
  }
  $debug_chunk = $debug ? {
    undef   => '',
    default => "debug=\"${debug}\"",
  }
  $debug_file_chunk = $debug_file ? {
    undef   => '',
    default => "debug_file=\"${debug_file}\"",
  }
  $separator_chunk = $separator ? {
    undef   => '',
    default => "separator=\"${separator}\"",
  }
  $delay_chunk = $delay ? {
    undef   => '',
    default => "delay=\"${delay}\"",
  }
  $disable_timeout_chunk = $disable_timeout ? {
    undef   => '',
    default => "disable_timeout=\"${disable_timeout}\"",
  }
  $login_timeout_chunk = $login_timeout ? {
    undef   => '',
    default => "login_timeout=\"${login_timeout}\"",
  }
  $power_timeout_chunk = $power_timeout ? {
    undef   => '',
    default => "power_timeout=\"${power_timeout}\"",
  }
  $power_wait_chunk = $power_wait ? {
    undef   => '',
    default => "power_wait=\"${power_wait}\"",
  }
  $shell_timeout_chunk = $shell_timeout ? {
    undef   => '',
    default => "shell_timeout=\"${shell_timeout}\"",
  }
  $stonith_status_sleep_chunk = $stonith_status_sleep ? {
    undef   => '',
    default => "stonith_status_sleep=\"${stonith_status_sleep}\"",
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

  $param_string = "${action_chunk} ${plug_chunk} ${port_chunk} ${ssl_insecure_chunk} ${namespace_chunk} ${kubeconfig_chunk} ${apiversion_chunk} ${quiet_chunk} ${verbose_chunk} ${verbose_level_chunk} ${debug_chunk} ${debug_file_chunk} ${separator_chunk} ${delay_chunk} ${disable_timeout_chunk} ${login_timeout_chunk} ${power_timeout_chunk} ${power_wait_chunk} ${shell_timeout_chunk} ${stonith_status_sleep_chunk} ${retry_on_chunk}  op monitor interval=${interval} ${meta_attr_value_chunk}"


  pcmk_stonith { "stonith-fence_kubevirt-${safe_title}":
    ensure             => $ensure,
    stonith_type       => 'fence_kubevirt',
    pcmk_host_list     => $pcmk_host_value_chunk,
    pcs_param_string   => $param_string,
    tries              => $tries,
    try_sleep          => $try_sleep,
    deep_compare       => $deep_compare,
    update_settle_secs => $update_settle_secs,
  }
}
