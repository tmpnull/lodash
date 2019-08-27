#!/bin/bash
echo 'Downloading new package link'
wget -O /tmp/package.txt 'http://pocketinstaller.damianvila.com/package.txt'
echo 'Checking if new version is available'
cat /tmp/package.txt | head -1 > /tmp/version
cat /tmp/package.txt | tail -1 > /tmp/link
(diff /tmp/version ~/.PocketInstaller/.version && echo 'Already up-to-date.') || \
    (echo 'Updating...' && \
    mkdir -p ~/.PocketInstaller/ && \
    cp /tmp/version ~/.PocketInstaller/.version &&\
    rm -f /PocketInstaller.tar.gz && \
    wget -O /tmp/PocketInstaller.tar.gz -i /tmp/link && \
    cd /home/chip
    sudo tar -zxvf /tmp/PocketInstaller.tar.gz PocketInstaller
    echo 'Installation finished.')
