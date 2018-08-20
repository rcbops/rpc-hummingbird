Making releases
===============

The following examples will assume that we are releasing `v2.0.0`.  Use the correct release version when making the actual release.

Release Hummingbird
-------------------

    1.  Make a `v2.0.0` tag of hummingbird master:
        1.  `git checkout master`
        2.  `git pull upstream master`
        3.  `git push origin v2.0.0`
        4.  `git push --tags`
    2.  CI will build binaries and create the github release.
    3.  Edit title and create release notes for the new release at <https://github.com/troubling/hummingbird/releases/tag/v2.0.0>.

Release Hansible
----------------

    1.  Update `hummingbird_version` to `v2.0.0` in `roles/humminbird-common/defaults/main.yml` and `group_vars/hummingbird/hummingbird` and push to master.
    2.  Draft a new release at <https://github.com/troubling/hansible/releases/new>.
    3.  Set Tag version and release title to `v2.0.0`.
    4.  Fill in release notes and publish the release.
    5.  Change `hummingbird_version` back to `dev` in `roles/humminbird-common/defaults/main.yml` and push to master.

Release RPC-Hummingbird
-----------------------

    1.  Update hansible version to `v2.0.0` in `ansible-role-requirements.yml` and push to master.
    2.  Make a pull request to https://github.com/rcbops/releases:
        1.  Add new version and git sha to `components/rpc-hummingbird.yml`.
        2.  The pull request needs to be reviewed by someone in rpc-hummingbird and RE.
    3.  Once the the change is reviewed and comitted, add a `run_component_release` comment to the pull request to build the release.
    4.  Create release notes for the new release at <https://github.com/rcbops/rpc-hummingbird/releases/tag/2.0.0>
    3.  Change hansible version back to `master` in `ansible-role-requirements.yml` and push to master.
