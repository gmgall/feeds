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

LC_ALL=pt_BR.UTF-8 newslinkrss \
        --follow \
        -p 'https://www.diariodepetropolis.com.br/integra/.+' \
        --date-from-xpath '//div[@class="card-body text-center"]/text()' \
        --xpath-date-regex '.*,\s+(\d.+\d)' \
        --xpath-date-fmt '%d de %B de %Y' \
        --with-body \
        --body-xpath '//h2/..' \
        -C 'div.row div.card div.card-body.text-center div.row' \
        'https://www.diariodepetropolis.com.br/' \
        -o ./feeds/diario_de_petropolis.xml
