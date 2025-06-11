FROM ubuntu:jammy
user root

# Install dependencies
RUN apt-get update && apt-get install git python3-dev libffi-dev gcc libssl-dev python3-pip python3-apt -y

# Update pip
RUN pip install -U pip

# Bobcat (2023.2): requires at least Ansible 6 (ansible-core 2.14) and supports up to 7 (ansible-core 2.15)
# Caracal (2024.1): requires at least Ansible 8 (ansible-core 2.15) and supports up to 9 (ansible-core 2.16)
# Dalmatian (2024.2): requires at least Ansible 9 (ansible-core 2.16) and supports up to 10 (ansible-core 2.17)
RUN pip install 'ansible-core>=2.15,<2.16.99'

# Install kolla-ansible
RUN git clone --depth 1 -b stable/2024.1 https://github.com/openstack/kolla-ansible.git /kolla-ansible
RUN pip install /kolla-ansible

# Install Ansible Galaxy dependencies
RUN kolla-ansible install-deps

# Install the OpenStack CLI client
RUN pip install python-openstackclient -c https://releases.openstack.org/constraints/upper/2024.1

# Custom executable command
RUN printf '#!/bin/bash\nkolla-ansible -i /etc/kolla/inventory $@'> /usr/local/bin/ka
RUN chmod +x /usr/local/bin/ka

RUN mkdir -p /etc/ansible
COPY ansible.cfg /etc/ansible/ansible.cfg
RUN chmod 644 /etc/ansible/ansible.cfg

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/bin/bash", "-c", "/entrypoint.sh"]

