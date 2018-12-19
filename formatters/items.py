LINKS_TO_ICONS = {
    'code': 'fab fa-github',
    'slides': 'fas fa-file-powerpoint',
    'video': 'fas fa-video',
    'bibtex': 'fas fa-quote-right',
    'pdf': 'fas fa-file-pdf',
    'article': 'far fa-newspaper',
    'supplementary material': 'fas fa-mail-bulk',
    'additional material': 'fas fa-mail-bulk',
    'website': 'fas fa-link',
    'instances': 'fas fa-plane-arrival'
}

def item_formatter_publications(item):
    return """
                <li>
                    <cite>{title}</cite>
                    <span class="author">{authors}</span>
                    <span class="in">{place_of_publication}, {date}</span>
                    {links}
                </li> 
            """.format(
        title=item['title'],
        authors=item['authors'],
        place_of_publication=item['journal'] if 'journal' in item else item['conference'],
        date=item['date'],
        links=generate_links_list(item)
    )


def item_formatter_thesis(item):
    return """
                <li>
                    <cite>{title}</cite>
                    <span class="author">Supervisor: {supervisor}</span>
                    <span class="in">{type}</span>
                    {links}
                </li> 
            """.format(
        title=item['title'],
        supervisor=item['supervisor'],
        type=item['type'],
        links=generate_links_list(item)
    )


def item_formatter_supervision(item):
    return """
                <li>
                    <cite>{title}</cite>
                    <span class="in">{student}, {type}, {date}</span>
                    {links}
                </li> 
            """.format(
        student=item['student'],
        type=item['type'],
        title=item['title'],
        date=item['date'],
        links=generate_links_list(item)
    )


def item_formatter_teaching(item):
    return """
                <li>
                    <cite>{title}</cite>
                    <span class="in">{detail}, {date}</span>
                    {links}
                </li> 
            """.format(
        title=item['title'],
        detail=item['detail'],
        date=item['date'],
        links=generate_links_list(item)
    )


def item_formatter_talks(item):
    return """
                <li>
                    <cite>{title}</cite>
                    <span class="in">{event}, {location}{date}</span>
                    {links}
                </li> 
            """.format(
        title=item['title'],
        event=item['event'],
        location=item['location'] + ', ' if 'location' in item else '',
        date=item['date'],
        links=generate_links_list(item)
    )


def item_formatter_awards(item):
    return """
                <li>
                    <cite>{title}</cite>
                    <span class="in">{event}, {location}{date}</span>
                    {links}
                </li> 
            """.format(
        title=item['title'],
        event=item['event'],
        location=item['location'] + ', ' if 'location' in item else '',
        date=item['date'],
        links=generate_links_list(item)
    )

def generate_links_list(item):
    if 'links' in item:
        return """<nav>
                    <ul>
                        {link_list}
                   </ul>
               </nav""".format(link_list=process_links(item['links']))
    return ''

def process_links(links):
    def icon(label):
        i = LINKS_TO_ICONS.get(label)
        if i is not None:
            return '<i class="{}"></i> '.format(i)

    res = ''
    for e in links:
        res += '<li><a href="{url}">[{icon}{label}]</a></li>\n'.format(
            url=e[1],
            label=e[0],
            icon=icon(e[0])
        )
    return res