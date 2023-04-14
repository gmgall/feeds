#!/bin/bash

newslinkrss \
        -p '.+/noticia/[0-9]{4}/[0-9]{2}/.+html' \
        -i '.+/geral/.+' \
        --with-body \
        --body-csss '.article' \
        --follow \
        'https://gauchazh.clicrbs.com.br/pioneiro/ultimas-noticias/' \
        -o ./feeds/gauchazh.xml
