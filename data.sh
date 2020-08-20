#!/usr/bin/env bash

# data starts at -> offset -> tcp[12:1]'s first 4 bits
# (tcp[12:1] & 11110000) >> 4 gives word's number
# ((tcp[12:1] & 11110000) >> 4) * 4 gives octet number
# == (tcp[12:1] & 0xf0) >> 2)
# starting four digits fave the get or post method name:
# 'POST' = 0x504F5354
# tcp[(tcp[12:1] & 0xf0) >> 2):4] == 0x504F5354

sudo tcpdump -i any -s 0 -l -A 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x504F5354' | grep -i username --line-buffered >> users.txt
