#!/bin/bash

newslinkrss \
        -p '.+/noticia/[0-9]{4}/[0-9]{2}/.+html' \
        -i '.+/geral/.+' \
        --with-body \
        --body-csss '.article' \
        --follow \
        'https://gauchazh.clicrbs.com.br/pioneiro/ultimas-noticias/' \
        -o ./feeds/gauchazh.xml

newslinkrss \
        -p '.+/user/gmgall/checkin/[0-9]+' \
        --follow \
        --date-from-csss '.time' \
        --title-regex 'Guilherme is drinking a (.+) on Untappd' \
        --with-body \
        --body-csss '.checkin-info.pad-it' \
        'https://untappd.com/user/gmgall' \
        -o ./feeds/gmgall_untappd.xml

newslinkrss \
        -p '.+/[0-9]{4}/[0-9]{2}/[0-9]{2}/.+' \
        --follow \
        --http-timeout 20 \
        --with-body \
        --body-csss '.entry-content.entry.clearfix' \
        --title-regex '(.+) · AeP' \
         'https://www.aconteceempetropolis.com.br/' \
        -o ./feeds/acontece_em_petropolis.xml
