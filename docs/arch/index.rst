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

- HPE 4510G10
- HPE DL380G9
- Supermicro E16/E26 JBOD
- Dell R740XL-XL
- F5 Loadbalancer
- HAProxy
- 10GbE Networking

========================
Supported Hardware - Customer Data Center
========================

- HPE 4510G10
- HPE DL380G9
- Supermicro E16/E26 JBOD
- Dell R740XL-XL 
- F5 Loadbalancer
- HAProxy 
- 10/25/40/50GbE Networking

========================
Supported Deployments
========================

- A minimal number of nodes equal to the number of replicas is required, growth increments are then in increments of that same number.

For example, a 3-Replica cluster could start with nodes 1,9,17 below, scaling up to 24 nodes, before scaling out to another 3 cabinets for nodes 25 through 48.

.. image:: hpesmjbodracks.png

