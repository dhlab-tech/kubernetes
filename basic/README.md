# Basic host role

This role is only intended to serve as dependency.

It peforms some basic actions like installing packages and gathering common
facts required to run any other playbook in molecule or bare metal, no more than
this. It is not intended to perform any host setup, please use the role `common`
for that.

**Keep this role as lightweight as possible!**
