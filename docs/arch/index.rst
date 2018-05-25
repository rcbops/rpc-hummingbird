:deconsttitle: Hummingbird Architecture

========================
Hummingbird Architecture
========================

Overall, the Hummingbird architecture is much like the `OpenStack Swift architecture`_. Below are the main differences from what you may be used to with OpenStack Swift:

.. _`OpenStack Swift architecture`: https://docs.openstack.org/swift/latest/overview_architecture.html

All executables are folded into a single hummingbird executable with subcommands, including smaller tools like nodes, oinfo, etc. Packaging and deployment scripts may create multiple scripts or service files, but these simply wrap calls to the single hummingbird executable.

Auditors and Updaters are folded into the Replicators.

Dispersion Report and Drive Audit features are implemented within Andrewd.

Expiring objects are supported, but not actively deleted after expiration. Active clean up may be implemented in the future.

No Account Reaper, which removes the contents of deleted accounts in the background. This should be implemented in the future.

No Container Reconciler, which resolves issues with conflicting policies within a single container. A tool for this may be implemented in the future.

No support for Swift's Container Sync feature.

No support for Swift's EC feature. Hummingbird will support erasure coding, but the implementation will be quite different with no plans to support Swift's implementation.

No support for Swift's Modifying Ring Partition Power feature, therefore no equivalent of the swift-object-relinker.

No support for Swift's Symbolic Linking feature at this time.

.. image:: hummingbird_architecture.png

========================
Supported Hardware - Rackspace Data Center
========================

- HPE 4510-G10
- HPE DL380-G9
- Supermicro E16/E26 JBOD
- Dell R740XL-XL
- F5 Loadbalancer
- HAProxy
- 10GbE Networking

========================
Supported Hardware - Customer Data Center
========================

- HPE 4510-G10
- HPE DL380-G9
- Supermicro E16/E26 JBOD
- Dell R740XL-XL 
- F5 Loadbalancer
- HAProxy 
- 10/25/40/50GbE Networking

- A customer must adhere to certain guidelines when procuring or re-purposing existing hardware.  A Hummingbird cluster made from non-ideal, or inconsistent hardware will lead to a poor user experience.

Generally the following recommendations should be followed when not using the node deisgns detailed above.

- CPUs - 1 CPU Core to 2 Object Disks, CPUs should be no older than Haswell
- RAM per Object Storage Disk - A minimum allocation of 2GB RAM
- SSD to Object Storage Ratio - Recommend that SSD capacity is approximately 4% of total Object storage
- Journal Disk Endurance - Journal disks are required to be NVMe/SSD with a duty cycle of a minimum of 5TBWPD.
- Object Storage Drives - NVMe, SSD, SAS, NL-SAS or SATA supported
- Operating System Drives - Must be a RAID1 pair of minimum SAS drives
- Networking - No less than 2x 10GbE or 2x 25GbE or 2x 40GbE Ports per node.  Jumbo frames highly recommended. Care must be taken to size TOR uplinks to aggregation switches to avoid creating a bottleneck.

========================
Supported Deployments
========================

- A minimal number of nodes equal to the number of replicas or number of EC shards is required, growth increments are then in increments of that same number.
- All storage nodes must have HA networking
- All cabinets must provide HA networking

For example, a 3-Replica cluster could start with nodes 1,9,17 below, scaling up to 24 nodes, before scaling out to another 3 cabinets for nodes 25 through 48.

.. image:: hpesmjbodracks.png

