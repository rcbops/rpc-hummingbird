# rpc-hummingbird and hansible(ansible bits used to install hummingbird)

``rpc-hummingbird`` deploys Hummingbird as an RPC stand-alone platform in a uniform,
managed, and tested way to ensure version consistency and testing.

By adding automated tests, ``rpc-hummingbird`` provides a way to manage tested
versions of ``hansible`` used in RPC deployments.

## What is rpc-hummingbird?

``rpc-hummingbird`` is a thin wrapper around the ``hansible`` repo.
``rpc-hummingbird`` manages the versions of ansible and ``hansible``
by providing:

 * RPC integration testing (MaaS/Logging and WIP-OpenStack).
 * Tested and versioned ``hansible`` and hummingbird releases.
 * Default variables (still WIP) for base installs.
 * Standarized deployments.
 * Default playbooks for integration.
 * Benchmarking tools using ``hummingbird bench``.

Deploying ``rpc-hummingbird`` uses ``boostrap.sh``, ``hansible``, default
``group_vars``, and a pre-created playbook.

**NOTE:** Anything that can be configured with ``hansible`` is configurable with
``rpc-hummingbird``.


## Deploying Hummingbired for multi-node and production environments

### Architecture

We do not recommend or use containers for ``rpc-hummingbired`` production deployments.
Containers are setup and used as part of the ``run_tests.sh`` (AIO) testing
strategy only. The default playbooks are not set up to build containers or
configure any of the required container specific roles.

The inventory should consist of the following:

 * 1 admin node used for andrewd, ring work and a staging area.
 * storage nodes used to run the conponents of hummingbird
 * ``hummingbird`` hosts, pointing to the storage nodes
 * ``monitoring`` host, pointing at the monitoring node
 * ``rsyslog_all`` host, pointing to the existing rsyslog logging server.

### Configuring your deployment host

1. Configure the following inventory:

   * An entry in the ``hummingbird`` section with a ``service_ip``  for each host.

2. Configure a variables file including the following ``hansible`` vars:

   * Devices, ``storage_devs`` for each host.
   * Given raw device set disks ``setup_storage: False``
   * Set the hash prefix ``hash_prefix``
   * Set the hash suffix ``hash_suffix``
   * Auth Method``use_temp_auth``
   * Any other ``hansible`` settings you want to configure.

3. Run the ``bootstrap-ansible.sh`` inside the scripts directory:

   ```bash
   ./scripts/bootstrap-ansible.sh
   ```

4. This configures ansible at a pre-tested version and clones the required role repositories:

   * ``hansible``
   * ``rsyslog_client``
   * ``openstack-ansible-plugins`` (``hansible aio`` uses the container template plugin from here).

5. Run the ``hansible`` playbook from the playbooks directory:

   ```bash
   /opt/rpc-hummingbird-ansible-runtime/bin/ansible-playbook -i <link to your inventory file> playbooks/deploy-hummingbird.yml -e @<link to your vars file>
   ```

Your deployment should be successful.

**NOTE:** If there are any errors, troubleshoot as a standard ``hansible`` deployment.

## Deploying hummingbird as an AIO

### Virtual Machine requirements for AIO

 * RAX Public Cloud general-8 (or equivalent) using:
   * Ubuntu 16.04 (xenial)

### To run an AIO build

For MaaS integration, perform the following export commands.
Otherwise just use ``./run_tests.sh`` to build the AIO.

```bash
export PUBCLOUD_USERNAME=<username>
export PUBCLOUD_API_KEY=<api_key>
```

### Tested builds as AIO

* Hummingbird bench
* RPC-MaaS integration
* RPC-O integration (coming a bit less soon).

### Currently not supported for AIO


