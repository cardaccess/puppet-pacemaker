# == Class: pacemaker::params
#
# Variables used by classes in the module
#
# === Dependencies
#
#  None
#
# === Authors
#
#  Crag Wolfe <cwolfe@redhat.com>
#  Jason Guiditta <jguiditt@redhat.com>
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
class pacemaker::params {

  $hacluster_pwd         = 'CHANGEME'
  case downcase($::facts['os']['family']) {
    'redhat': {
      $pcs_bin = '/sbin/pcs'
      $pcsd_sysconfig = '/etc/sysconfig/pcsd'
      $pcmk_sysconfig = '/etc/sysconfig/pacemaker'
      if (versioncmp($::os['release']['major'], '7.0') < 0) {
        $package_list = ['pacemaker','pcs','fence-agents','cman']
        # TODO in el6.6, $pcsd_mode should be true
        $pcsd_mode = false
        $services_manager = 'lsb'
      } else {
        $package_list = ['pacemaker','pcs','fence-agents-all','pacemaker-libs']
        $pcsd_mode = true
        $services_manager = 'systemd'
      }
      # Starting with 7.3 we have a separate pacemaker-remote package
      if (versioncmp($::os['release']['full'], '7.2') < 1) {
        $pcmk_remote_package_list = ['pacemaker','pcs','fence-agents-all','pacemaker-libs']
      } else {
        $pcmk_remote_package_list = ['pacemaker','pcs','fence-agents-all','pacemaker-libs', 'pacemaker-remote']
      }
      # Detect pcs 0.10.x versions and use different commands
      if (versioncmp($::os['release']['full'], '8.0') > 0) {
        $pcs_010 = true
      } else {
        $pcs_010 = false
      }
      $service_name = 'pacemaker'
    }
    default: {
      fail("Unsupported platform: ${::os['family']}")
    }
  }
}
