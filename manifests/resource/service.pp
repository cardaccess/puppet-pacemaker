# == Define: pacemaker::resource::service
#
# A resource type to create pacemaker lsb or systemd resources
# (depending on distro), provided for convenience.
#
# === Parameters:
#
# [*ensure*]
#   (optional) Whether to make sure the constraint is present or absent
#   Defaults to present
#
# [*service_name*]
#   (optional) Name of the service to manage
#   Defaults to name used to create the resource
#
# [*resource_params*]
#   (optional) Any additional parameters needed by pcs for the resource to be
#   properly configured
#   Defaults to ''
#
# [*meta_params*]
#   (optional) Additional meta parameters to pass to "pcs create"
#   Defaults to ''
#
# [*op_params*]
#   (optional) Additional op parameters to pass to "pcs create"
#   Defaults to ''
#
# [*clone_params*]
#   (optional) Additional clone parameters to pass to "pcs create".  Use ''
#   or true for to pass --clone to "pcs resource create" with no addtional
#   clone parameters
#   Defaults to undef
#
# [*group_params*]
#   (optional) Additional group parameters to pass to "pcs create", typically
#   just the name of the pacemaker resource group
#   Defaults to undef
#
# [*bundle*]
#   (optional) Bundle id that this resource should be part of
#   Defaults to undef
#
# [*post_success_sleep*]
#   (optional) How long to wait acfter successful action
#   Defaults to 0
#
# [*tries*]
#   (optional) How many times to attempt to create the constraint
#   Defaults to 1
#
# [*try_sleep*]
#   (optional) How long to wait between tries, in seconds
#   Defaults to 0
#
# [*verify_on_create*]
#   (optional) Whether to verify creation of resource
#   Defaults to false
#
# [*force*]
#   (optional) Whether to force creation via pcs --force
#   Defaults to false
#
# [*location_rule*]
#   (optional) Add a location constraint before actually enabling
#   the resource. Must be a hash like the following example:
#   location_rule => {
#     resource_discovery => 'exclusive',    # optional
#     role               => 'master|slave', # optional
#     score              => 0,              # optional
#     score_attribute    => foo,            # optional
#     # Multiple expressions can be used
#     expression         => ['opsrole eq controller']
#   }
#   Defaults to undef
#
# [*deep_compare*]
#   (optional) Enable deep comparing of resources and bundles
#   When set to true a resource will be compared in full (options, meta parameters,..)
#   to the existing one and in case of difference it will be repushed to the CIB
#   Defaults to false
#
# [*update_settle_secs*]
#   (optional) When deep_compare is enabled and puppet updates a resource, this
#   parameter represents the number (in seconds) to wait for the cluster to settle
#   after the resource update.
#   Defaults to lookup('pacemaker::resource::service::update_settle_secs', undef, undef, 600) (seconds)
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
define pacemaker::resource::service(
  $ensure             = 'present',
  $service_name       = $name,
  $resource_params    = '',
  $meta_params        = '',
  $op_params          = '',
  $clone_params       = undef,
  $group_params       = undef,
  $bundle             = undef,
  $post_success_sleep = 0,
  $tries              = 1,
  $try_sleep          = 0,
  $verify_on_create   = false,
  $force              = false,
  $location_rule      = undef,
  $deep_compare       = false,
  $update_settle_secs = lookup('pacemaker::resource::service::update_settle_secs', undef, undef, 600),
) {
  include pacemaker::params
  $res = "pacemaker::resource::${::pacemaker::params::services_manager}"

  create_resources($res,
    { "${name}" => {
      ensure             => $ensure,
      service_name       => $service_name,
      resource_params    => $resource_params,
      meta_params        => $meta_params,
      op_params          => $op_params,
      clone_params       => $clone_params,
      group_params       => $group_params,
      bundle             => $bundle,
      post_success_sleep => $post_success_sleep,
      tries              => $tries,
      try_sleep          => $try_sleep,
      verify_on_create   => $verify_on_create,
      force              => $force,
      location_rule      => $location_rule,
      deep_compare       => $deep_compare,
      update_settle_secs => $update_settle_secs,
    }
  })
}
