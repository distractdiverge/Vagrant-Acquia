# Acquia Vagrant Environment

A vagrant environment for use as a local Acquia development environment. Based on the Vagrant Drupal Development box (https://drupal.org/project/vdd).

## Getting Started
 1. Install Virtual Box 
   https://www.virtualbox.org/wiki/Downloads

 2. Install Vagrant 
   http://docs.vagrantup.com/v2/installation/index.html

 3. Prepare Vagrant box
    ```vagrant box add precise32 http://files.vagrantup.com/precise32.box```

 4. Clone this repository

 5. Adjust configuration
    Edit the ```config.json``` file as needed

 6. Build the environment
    ```vagrant up```

 7. Visit ```192.168.44.44```


## config.json 

* ip (string, required)
    Static IP address of virtual machine. It is up to the users to make sure
    that the static IP doesn't collide with any other machines on the same
    network. While you can choose any IP you'd like, you should use an IP from
    the reserved private address space.

  * memory (string, required)
    RAM available to virtual machine. Minimum value is 1024.

  * synced_folder (object of strings, required)
    Synced folder configuration.

      * host_path (string, required)
        A path to a directory on the host machine. If the path is relative, it
        is relative to VDD root.

      * guest_path (string, required)
        Must be an absolute path of where to share the folder within the guest
        machine.

      * use_nfs (boolean, required)
        In some cases the default shared folder implementations (such as
        VirtualBox shared folders) have high performance penalties. If you're
        seeing less than ideal performance with synced folders, NFS can offer a
        solution. http://docs.vagrantup.com/v2/synced-folders/nfs.

  * php (object of strings, required)
    PHP configuration.

      * version (string or false, required)
        Desired PHP version. Please, see http://www.php.net/releases for proper
        version numbers. If you would like to use standard Ubuntu package you
        should set number to "false". Example: "version": false.

  * mysql (object of strings, required)
    MySQL configuration.

      * server_root_password (string, required)
        MySQL server root password.

  * sites (object ob objects, required)
    List of sites (similar to virtual hosts) to configure. At least one site is
    required.

      * Key (string, required)
        Machine name of a site. Name should fit expression '[^a-z0-9_]+'. Will
        be used for creating subdirectory for site, Drush alias name, database
        name, etc.

          * account_name (string, required)
            Drupal administrator user name.

          * account_pass (string, required)
            Drupal administrator password.

          * account_mail (string, required)
            Drupal administrator email.

          * site_name (string, required)
            Drupal site name.

          * site_mail (string, required)
            Drupal site email.

  * xdebug (object of strings, optional)
    Xdebug configuration.

    * remote_host (string, required)
      Selects the host where the debug client is running.

  * git (object of strings, optional)
    Git configuration.

  * custom_roles (array, required)
    List of custom roles. Key is required, but can be empty array ([]).