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
        --title-regex 'Guilherme is drinking an? (.+) on Untappd' \
        --with-body \
        --body-csss '.checkin-info.pad-it' \
        --author-from-csss '.name p a' \
        'https://untappd.com/user/gmgall' | \
        xq --xml-output '.rss.channel.item = .rss.channel.item[4:]' > ./feeds/gmgall_untappd.xml

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

newslinkrss \
        -p 'https://www.dannyguo.com/blog/.+' \
        --follow \
        --with-body \
        --body-csss 'article' \
        --date-from-xpath '//@datetime' \
        'https://www.dannyguo.com/blog' \
        -o ./feeds/danny_guo.xml

newslinkrss \
        -p 'https://www.espn.com.br/nfl/artigo/.+' \
        --follow \
        --with-body \
        --body-csss '.article-body' \
        --body-remove-csss '.inline.float-r.inline-track' \
        --body-remove-csss 'img' \
        --body-remove-csss '.inline.editorial.float-r' \
        --body-remove-csss '.article-social.vertical' \
        --date-from-xpath '//@data-date' \
        'https://www.espn.com.br/nfl' \
        -o ./feeds/espn_nfl.xml

# Folks at ctrl-c.club

newslinkrss \
        -p '.*/~lettuce/.*' \
        -a '([0-9]{4}-[0-9]{2}-[0-9]{2}) - .*' \
        --text-date-fmt '%Y-%m-%d' \
        --follow \
        --require-dates \
        --with-body \
        --title '~lettuce posts on ctrl-c.club' \
        --title-regex '/home/lettuce/public_html/(.*)' \
        'https://ctrl-c.club/~lettuce/' \
        -o ./feeds/lettuce.xml

newslinkrss \
         -p '.*/~FikaMedHasse/blogposts/.*' \
         --follow \
         --with-body \
         --body-remove-csss 'header' \
         --body-remove-csss 'footer' \
         --title '~FikaMedHasse posts on ctrl-c.club' \
         'https://ctrl-c.club/~FikaMedHasse/blog.html' \
         -o ./feeds/FikaMedHasse.xml

newslinkrss \
         -p '.*/~gome/journal/.*' \
         -i '.*/~gome/journal/rss/.*' \
         -i '.*/~gome/journal/page*' \
         --body-remove-csss '#header' \
         'https://ctrl-c.club/~gome/journal/' \
         --csss-date-regex '([0-9]{2} [A-z]{3} [0-9]{4}), .*' \
         --date-from-csss 'time' \
         --csss-date-fmt '%d %b %Y' \
         --follow \
         --with-body \
         --title '~gome posts on ctrl-c.club' \
         --encoding 'utf-8' \
         -o ./feeds/gome.xml

newslinkrss \
         -p '.+/~nodisc/[0-9]{4}-[0-9]{2}-[0-9]{2}_.+.html' \
         --follow \
         --date-from-text '([0-9]{4}-[0-9]{2}-[0-9]{2})[_ ].*' \
         --text-date-fmt '%Y-%m-%d' \
         --encoding 'utf-8' \
         --with-body \
         --title '"Artículos" section of ~nodisc' \
         'https://ctrl-c.club/~nodisc/articulos.html' \
         -o ./feeds/nodisc.xml

newslinkrss \
         -p '.*/~chickfilla/p/[0-9]{8}/.*' \
         --date-from-url '.*/p/([0-9]{8})/.*' \
         --url-date-fmt '%Y%m%d' \
         --follow \
         --with-body \
         --title '~chickfilla posts on ctrl-c.club' \
         --title-regex '[0-9]*: (.*)' \
         'https://ctrl-c.club/~chickfilla/'  \
         -o ./feeds/chickfilla.xml

newslinkrss \
         -p '.*/post[0-9]+.html' \
         --follow \
         --with-body \
         --encoding 'utf-8' \
         --title '~i00nsu posts on ctrl-c.club' \
         'https://ctrl-c.club/~i00nsu/' \
         -o ./feeds/i00nsu.xml

newslinkrss \
         -p '.+.html' \
         -i '.+/index.html' \
         --follow \
         --with-body \
         --title '~Triz3n posts on ctrl-c.club' \
         --body-remove-csss 'nav' \
         'https://ctrl-c.club/~Triz3n/' \
         -o ./feeds/Triz3n.xml

newslinkrss \
         -p '.*/postits/.*.html' \
         --follow \
         --with-body \
         'https://ctrl-c.club/~sicbail/' \
         --title '~sicbail posts on ctrl-c.club' \
         --encoding 'utf-8' \
         -o ./feeds/sicbail.xml

newslinkrss \
         -p '.*.html' \
         --title '~captaindrewboy posts on ctrl-c.club' \
         --date-from-text '.+, (.*)' \
         --text-date-fmt '%dth %B %Y' \
         --follow \
         --with-body \
         'https://ctrl-c.club/~captaindrewboy/' \
         -o ./feeds/captaindrewboy.xml

newslinkrss \
         -p '.+/~timemachine/[0-9]{4}/[0-9]{2}/[0-9]{2}/' \
         --date-from-url '.+/~timemachine/([0-9]{4}/[0-9]{2}/[0-9]{2})/.*' \
         --title '~timemachine posts on ctrl-c.club' \
         --follow \
         --with-body \
         --body-csss 'article' \
         'https://ctrl-c.club/~timemachine/archives/' \
         -o ./feeds/timemachine.xml

newslinkrss \
         -p '.+/~beehiveth/entries/.+.html' \
         --follow \
         --with-body \
         --body-csss 'article' \
         --title '~beehiveth posts on ctrl-c.club' \
         --date-from-url '.+/~beehiveth/entries/(.+).html' \
         --url-date-fmt '%d%m%y' \
         --encoding 'utf-8' \
         'https://ctrl-c.club/~beehiveth/' \
         -o ./feeds/beehiveth.xml

for feed in feeds/*; do
  xq --arg feed_url "https://gmgall.github.io/$feed" '{"title": .rss.channel.title, "link": .rss.channel.link, "description": .rss.channel.description, "feed": $feed_url}' "$feed"
done | jq -s > ./feeds/feeds.json
