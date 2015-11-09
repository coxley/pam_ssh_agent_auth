pam_ssh_agent_auth
==================

.. image:: http://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-2.png
   :target: http://www.wtfpl.net/
   :alt: Do what the fuck you want
   :height: 25px

pam_ssh_agent_auth is my favorite PAM plugin, but no default system repo I've
encountered ships with it. There are a handful of Ubuntu PPA's out there, but I
wanted a central build to access between Ubuntu, Arch, and RHEL.

This repo will use fpm to create native packages for Debian, RHEL, and
ArchLinux. Since the only distributions I personally use are Arch and Ubuntu,
please create an issue if you have problems on anything else.

.. note::

    Currently I am building on my local Arch machine for these builds. Ideally
    I'll use Wercker or another pipeline to auto build in a custom container.

Installing
----------

Packages will be tagged and kept in the releases of this repo
