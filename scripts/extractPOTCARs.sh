#!/bin/bash
mkdir -p PAW_GGA PAW_LDA PAW_LDA_52 PAW_LDA_54 PAW_PBE PAW_PBE_52 PAW_PBE_54 USPP_GGA USPP_LDA
tar xz -C PAW_PBE -f potpaw_PBE.tgz
tar xz -C PAW_PBE_52 -f potpaw_PBE.54.tar.gz
tar xz -C PAW_PBE_54 -f potpaw_PBE.52.tar.gz
tar xz -C PAW_LDA -f potpaw_LDA.tgz
tar xz -C PAW_LDA_52 -f potpaw_LDA.54.tar.gz
tar xz -C PAW_LDA_54 -f potpaw_LDA.52.tar.gz
tar xz -C PAW_GGA -f potpaw_GGA.tar.gz
tar xz -C USPP_LDA -f potUSPP_LDA.tar.gz
tar xz -C USPP_GGA -f potUSPP_GGA.tar.gz
