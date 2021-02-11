
def section_formatter_supervision(key, section, data):
    from builder.generators import get_section_icon, generate_list_of_items
    res = """ 
        <section class="section summary-section">
            <h2 class="section-title"><i class="{icon}"></i>{title}</h2>
            <div class="summary">
        """.format(
            icon=get_section_icon(key, section),
            title=section.get('title', key.title()),
            id='talks'
    )
    for subkey, subsection in section.get('subsections').items():
        if 'intro' in subsection:
            res += '<p>{intro}</p>'.format(intro=subsection['intro'])
        res += '<ol id="{id}">'.format(id='talks')
        res += generate_list_of_items(subsection.get('items', data.get(subkey, [])), subkey, data)
        res += '</ol>'
    res += """       
            </div>
        </section>
    """
    return res