import formatters.items
from formatters.sections import section_formatter_supervision

LIST_FORMATTERS = {}
LIST_SECTION_FORMATTERS = {
    'supervision': 'section_formatter_supervision'
}
SECTION_TO_ICON = {
    'talks': 'fa fa-comments',
    'supervision': 'fa fa-chalkboard-teacher',
    'thesis': 'fa fa-scroll',
    'awards': 'fa fa-award',
    'publications': 'fa fa-book'
}

def init_formatters():
    pass

def get_section_icon(key, section):
    icon_name = section.get('icon')
    if icon_name is None:
        return SECTION_TO_ICON.get(key)
    else:
        return SECTION_TO_ICON.get(icon_name, section.get('icon'))

def generate_sections(sections, data):
    def get_formatter(key):
        formatter_name = LIST_SECTION_FORMATTERS.get(key, 'section_formatter_{}'.format(key))
        return globals().get(formatter_name)
    res = ''
    for key, section in sections.items():
        formatter = get_formatter(key)
        if formatter is not None:
            res += formatter(key, section, data)
        else:
            res += """ 
                <section class="section summary-section">
                    <h2 class="section-title"><i class="{icon}"></i>{title}</h2>
                    <div class="summary">
                        <ol id="{id}">
                           {items}
                        </ol>
                    </div>
                </section>
            """.format(
                icon=get_section_icon(key, section),
                title=section.get('title', key.title()),
                id='talks', #section.get('id', key),
                items=generate_list_of_items(section.get('items', data.get(key, [])), key, data)
            )
    return res


def generate_list_of_items(items, item_type, data):
    def get_formatter(item_type):
        formatter_name = LIST_FORMATTERS.get(item_type, 'item_formatter_{}'.format(item_type))
        return getattr(formatters.items, formatter_name)
    res = ''
    for item in items:
        res += get_formatter(item_type)(item)
    return res


