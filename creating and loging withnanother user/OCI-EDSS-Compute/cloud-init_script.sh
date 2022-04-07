#cloud-config
users:
  - name: securiti
    groups: [ adm, dialout, cdrom, floppy, sudo, audio, dip, video, plugdev, lxd, netdev ]
    sudo: [ "ALL=(ALL) NOPASSWD:ALL" ]
    shell: /bin/bash
    ssh-authorized-keys: 
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9Xeh0bgHlut3vI2Wvvpjw0T8PeHidTXHZNADVhv5DMVQrcV51bLF9kvEGr5LA3IRafmspxY+kZAQANmKUBbhWYtKStznt7x/qRkrKLfZ9ANTZmAdmzMUFez3GAOXq4lXh1DIi6dEwjOffGxqnNuxT8yofK/kh9m3oElgGwF6N7liPYu582tVCdQZ40iFgs7su7NgczThvWLI+g5pRjOXrzJP8QS45D7AO6138aWut4Cp1L5UkVzLA6eVkiTtojxThZ9NN2QY3kAzvYRXN1MdzYKIwAs5awxmdM/TZeZz6wBYjiMPjTJYn364wwUJonqKigRtcuzsaJJkfvk6suDCAkQIDJUNBfHFhF11xUqxwwzMHp7HFEKajmQl98HFirJh99aFQNQb5OuVSXNdvswxwfc0tt2kTK/hWPvZnea+R0EYxqrxOOLTOwypAHMOwnLEkBXHWD/49IEXKOxmQnvdPjWfYP0/PKoIDq27v0lW/whiHXA4xcNkPTyu2wfDFr5N/fTn/o6IfsJXSd5CEV8iaXiocP5UubMpJ599DRL/mRh5ACJtuBL3ewjU4A8yr0yG+96yc3rlZcqviTv86j970JofJHkL51mxq5C8S3JPURO6dXBbvzF9bJUoGsxR1xqBAV1pgddE+w5Urvk7ELKWFkdxyOm+hcNxWbLVInl66AQ== kirannm@datatemplate.com