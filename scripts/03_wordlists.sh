#!/bin/bash

WORDLIST_DIR="/opt/wordlists"
mkdir -p "$WORDLIST_DIR"

cd "$WORDLIST_DIR"

echo "[*] Downloading wpa2-wordlists ultimate list (~28 MB)..."
wget https://github.com/kennyn510/wpa2-wordlists/releases/download/ultimate2016-clean/ultimate-wpa2-clean.txt.gz

echo "[*] Unzipping wpa2-wordlist ultimate list (~78 MB)..."
gunzip ultimate-wpa2-clean.txt.gz

echo "[*] Downloading OneRuleToRuleThemAll ruleset..."
wget -q --show-progress https://raw.githubusercontent.com/NotSoSecure/password_cracking_rules/master/OneRuleToRuleThemAll.rule -O OneRuleToRuleThemAll.rule

echo "[*] Wordlists and rules downloaded to $WORDLIST_DIR"
echo ""
ls -lh "$WORDLIST_DIR"
