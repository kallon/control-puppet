################################
# Puppetfile for environment production
################################ 
#
### About Puppetfiles
#
# Puppetfiles are text files written in a Ruby-based DSL. They specify what modules you want to install in each puppet environment,
# what version of those modules you want to install, and where you want to get the modules from. This allows the deployment management
# tool r10k to install modules into a given environment in your deployment.
#
### The Modulepath (Module location and loading behavior)
#
# The Puppet master service and the local Puppet apply command both load most of their content from these modules, such as those included in the Puppetfile.
# Puppet automatically loads modules from one or more directories. The list of directories Puppet will find modules in is called the modulepath.
#
### Modulepath Format
#
# The modulepath is an ordered list of directories, with earlier directories having priority over later ones.
# For example:
# /etc/puppet/environments/production/modules:/etc/puppet/modules:/usr/share/puppet/modules
#
### Duplicate or Conflicting Modules
#
# If the modulepath contains multiple modules with the same name, Puppet will use the version from the directory
# that comes earliest in the modulepath. This allows directories earlier in the modulepath to override the later directories.
#
# You can view the effective modulepath for any environment by specifying the environment when requesting the setting value:
#       $ sudo puppet config print modulepath --section master --environment production
#
#       For further info: https://docs.puppetlabs.com/puppet/3.7/reference/dirs_modulepath.html
################################


# Declare forge URL
forge "http://forge.puppetlabs.com"

########
# Forge Syntax
########

#Modules can be installed using the Puppet module tool to pull down from Puppet Forge.


### Start Examples ###

#If no version is specified the latest version available at the time will be installed, and will be kept at that version.
#mod 'puppetlabs/apache'

#If a version is specified then that version will be installed.
#mod 'puppetlabs/apache', '0.10.0'

#If the version is set to :latest then the module will be always updated to the latest version available.
#mod 'puppetlabs/apache', :latest

### End Examples ###


########
# Git Syntax
########

# NOTE: It is preferable to reference the github containment of a community module instead of the forge.
#       This is so that we have more control over which branch to use.  Especially important when needing
#       to customize/fork the module and perhaps create a 'pull request'

#Git repositories that contain a Puppet module can be cloned and used as modules. When Git is used, the module version can be specified by using :ref, :tag, :commit, and :branch.

#When a module is installed using :ref, r10k uses some simple heuristics to determine the type of Git object 
# that should be checked out. This can be used with a git commit, branch reference, or a tag.

#When a module is installed using :tag or :commit, r10k assumes that the given object is a tag or commit and 
# can do some optimizations around fetching the object. If the tag or commit is already available r10k will 
# skip network operations when updating the repo, which can speed up install times.

#Module versions can also be specified using :branch. This behaves similarly to :ref, and is mainly useful for clarity.

### Start Examples ###########

# Install puppetlabs/apache and keep it up to date with 'master'
#mod 'apache',
#  :git => 'https://github.com/puppetlabs/puppetlabs-apache'

# Install puppetlabs/apache and track the 'docs_experiment' branch
#mod 'apache',
#  :git => 'https://github.com/puppetlabs/puppetlabs-apache',
#  :ref => 'docs_experiment'

# Install puppetlabs/apache and pin to the '0.9.0' tag
#mod 'apache',
#  :git => 'https://github.com/puppetlabs/puppetlabs-apache',
#  :tag => '0.9.0'

# Install puppetlabs/apache and pin to the '83401079' commit
#mod 'apache',
#  :git    => 'https://github.com/puppetlabs/puppetlabs-apache',
#  :commit => '83401079053dca11d61945bd9beef9ecf7576cbf'

# Install puppetlabs/apache and track the 'docs_experiment' branch
#mod 'apache',
#  :git    => 'https://github.com/puppetlabs/puppetlabs-apache',
#  :branch => 'docs_experiment'
### End Examples ###########

#####
# Usage
#
#- For a production puppet environment, all community module references must be tied to a static reference, such as a 'tag' or a commit reference.
#   This is so that a production environment doesn't suddely update according to a community update
#   without going through the proper system testing.
#   Alternatively, clone the required repo to the private Git server, and configure the desired private repo branch 
#   strucutre that does not automatically pull from community upstream repo updates.
#
#- For a develepmont puppet environement, a community module may use the master branch to receive all updates.
#  This way, community updates will be introduced as we develop and therefore are forced to be tested immediately, reducing the pain
#  point of manually taking time out to introduce updates, usually in bulk
#####


########
## Community modules
########
# These are public community modules pulled directly from the module administrator's Repository

# This module is common
mod 'puppetlabs/stdlib',
  :git => 'https://github.com/puppetlabs/puppetlabs-stdlib',
  :tag => '4.17.0'

# Manage Puppet agents.  (Different module used than on the Foreman server.  This one is useful for updating the version of pupet installed)
# NOTE:  this module will be updated to the latest release
mod 'puppetlabs-puppet_agent', :latest

# Dependancy for puppet_agent
mod 'puppetlabs-transition', '0.1.1'

# Dependancy for insights-visitor-gui, r10k
mod 'puppetlabs/git',
  :git => 'https://github.com/puppetlabs/puppetlabs-git.git',
  :tag => '0.5.0'

# Dependency for puppetlabs/puppetdb, r10k 
mod 'puppetlabs/inifile',
  :git => 'https://github.com/puppetlabs/puppetlabs-inifile.git',
  :tag => '1.5.0'

# Dependency for r10k, puppet, apache, yum, etc 
mod 'puppetlabs-concat', '4.0.0'

# Dependency for r10k 
mod 'gentoo-portage', '2.3.0'
mod 'puppetlabs-ruby', '0.6.0'
mod 'puppetlabs-gcc', '0.3.0'
mod 'puppet-make', '1.1.0'
mod 'puppetlabs-vcsrepo', '1.5.0'

# Install and Configure R10k - to orchestrate puppet environments
mod 'puppet-r10k', '6.0.0'

# Dependency for puppetlabs/puppetdb, postgresql, foreman
mod 'puppetlabs/apt',
  :git => 'https://github.com/puppetlabs/puppetlabs-apt.git',
  :tag => '4.0.0'

# Offers support for basic management of PostgreSQL databases.
mod 'puppetlabs-postgresql',
  :git => 'https://github.com/puppetlabs/puppetlabs-postgresql.git',
  :commit => 'f12307fab51b6bb433041315b17a7cec1beb2675'

# Dependency for abstractit/icinga, 'theforeman-puppet'
mod 'puppetlabs/apache',
  :git    => 'https://github.com/puppetlabs/puppetlabs-apache.git',
  :tag => '1.11.0'

# Manage puppet agents and puppet master.  With integration related to Foreman
mod 'theforeman-puppet', :latest
#mod 'theforeman-puppet', '7.1.1'

# Module to manage Foreman application.  
mod 'theforeman-foreman', '7.2.0'

# Dependancy for foreman, foreman_proxy
mod 'theforeman-tftp', '2.0.0'

# Dependancy for foreman, puppet
mod 'puppetlabs-xinetd', '2.0.0'

# Dependancy for puppet 
# extlib provides functions out of scope puppetlabs/stdlib
mod 'puppet-extlib', '1.1.0'

# Installs and configures the Foreman Smart Proxy - Part of the Foreman installer
mod 'theforeman-foreman_proxy', '5.1.0'

# Dependancy for foreman_proxy
mod 'theforeman-dns', '4.1.0'
mod 'theforeman-dhcp', '3.1.0'

# The mcollective module installs, configures, and manages the mcollective agents, and clients of an MCollective cluster
mod 'puppet-mcollective', '2.5.0'

# Dependancy for mcollective
mod 'richardc-datacat', '0.6.2'

# Dependancy for mcollective profile in environment (mco_profile)
mod 'puppetlabs-java_ks', '1.6.0'

# Dependancy for java
mod 'puppet-archive', '1.3.0'

# Dependancy for activemq.
mod 'puppetlabs-java', '2.0.0'

# Dependancy for mcollective.
# Manage the ActiveMQ message broker server.  
mod 'puppetlabs-activemq',
  :git => 'https://github.com/puppetlabs/puppetlabs-activemq.git',
  :commit => 'f4b580461e1b9c1980f3141f0414512aa6b2a0ba'

# Manage Network Time Protocol (ntp)
# NOTE:  Change this back to the community module after migrating all our infrastructure to puppet4
mod 'puppetlabs-ntp', '6.2.0'
#mod 'puppetlabs-ntp4',
#  :git => 'git@bitbucket.org:kallon/puppet-ntp4.git',
#  :branch => 'master'

# Dependancy for timezone
mod 'stm-debconf', '2.0.0'
mod 'puppet-yum', '2.0.0'

# Manage server timezone
mod 'kogitoapp-timezone', '2.0.5'

# Manage ssh server
mod 'attachmentgenie-ssh', '2.1.0'

#Dependancy for accounts
mod 'deric-gpasswd', '0.3.2'

#Dependancy for rsyslog
mod 'ghoneycutt-sysklogd', '1.1.0'
mod 'ghoneycutt-common', '1.6.0'

# Manage Environment variables (inc PATH)
# Dependancy for insights_visitor_collector
mod 'geoffwilliams-environment_variable', '0.2.1'

# Dependancy for environment_variable
mod 'puppet-windows_env', '2.3.0'

# Manage /etc/rc.local bootup file
# Dependancy for insights_visitor_collector
mod 'example42-rclocal', '2.0.9'

#Dependency for example42-rclocal
mod 'example42-puppi', '2.2.3'

# Manage /etc/rc.local bootup file
# Dependancy for insights_visitor_collector
#mod 'ULHPC-rclocal', '0.1.4'

# sysctl module used by Insights Visitor
mod 'herculesteam-augeasproviders_sysctl', '2.2.0'

# Dependancy for augeasproviders_ modules
mod 'herculesteam-augeasproviders_core', '2.1.3'

# Module for configuring /etc/default/rcS, a script to control the behaviour of boot-time scripts.
mod 'alphagov/rcs',
  :git    => 'https://github.com/alphagov/puppet-rcs.git',
  :tag => '0.1.2'

# to read and modify grub config files using the Augeas configuration library
mod 'herculesteam-augeasproviders_grub', '2.4.0'

# This module is a dependency for jdowning/awscli.  I think it is only used for Redhat systems
mod 'stahnma/epel', '1.2.2'

# This module implements the Amazon AWS CLI utility.  It should be deployed on many instances for S3 tools at a minimum.
mod 'jdowning/awscli', '2.0.0'


########
## Private modules
########
#
# R10k simply invokes GIT in order to clone the repositories defined in this Puppetfile. If authentication is used, you may use
# any of GIT's builtin authentication methods.

# To access the private Git repository server, SSH authorized keys are used.  
# Best practices in this case is to define a special read-only account for your puppetmasters. 
# The credentials for your Puppetfile must be stored in plain text in order for the R10k automation to work.

# Ref: https://ask.puppetlabs.com/question/15236/can-you-use-r10k-to-deploy-from-a-private-repo/
###########

mod 'profiles_common',b
#  :git => 'ssh://git@bitbucket.org/kallon/profiles_common.git',
  :git => 'git@github.com:kallon/profiles-common.git',
  :branch => 'master'


########
## Forked modules
########
#
# These are public community modules that have been forked and customized.
#  You may at times want to merge community upstream releases or commits into the private fork.
#  Do this via dev -> stage -> master workflow.

