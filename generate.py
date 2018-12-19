from jinja2 import Environment, FileSystemLoader
import json
from distutils.dir_util import copy_tree
from os import listdir
from os.path import isfile, join
from shutil import copy
import yaml
from requests.adapters import BaseAdapter
import requests
import os
from bs4 import BeautifulSoup

from builder import generators, utils
from formatters import items, sections



def create_output_dir(output_dir):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

def resolve_url(base_url, output, env):
    return base_url if env == 'prod' else os.path.join(os.path.abspath(__file__), output)

root = os.path.dirname(os.path.abspath(__file__))
templates_dir = os.path.join(root, 'templates')
env = Environment(loader=FileSystemLoader(templates_dir) )

# env = 'prod'
ENV = 'dev'
OUTPUT_DIR = 'output'

BASE_URL = 'https://aquemy.info'

CONFIG = {
    'NAME': u'Alexandre Quemy',
    'SITENAME': u'Alexandre Quemy',
    'SITEURL': 'https://aquemy.info',
    'TAGLINE': 'PhD student in AI & Senior Engineer at IBM',
    'PIC': 'profile.jpeg',
    'EMAIL': 'alexandre.quemy@gmail.com',
    'WEBSITE': 'endomorphis.me',
    'LINKEDIN': 'aquemy',
    'GITHUB': 'aquemy',
    'TWITTER': None,
}
STATIC = [
    {'src': 'templates/static'},
    {'src': 'static', 'mode': 'update' }
]

for e in STATIC:
    output = os.path.join(OUTPUT_DIR, e.get('dst', e.get('src')))
    if e.get('mode') == 'update':
        f = []
        for (dirpath, dirnames, filenames) in os.walk(e.get('src')):
            for filename in filenames:
                input_file = os.path.join(dirpath, filename)
                output_file = os.path.join(output, os.path.join(*dirpath.split('/')[1:]), filename)
                if not isfile(output_file):
                    print('{} -> {}'.format(input_file, output_file))
                    os.makedirs(os.path.dirname(output_file), exist_ok=True)
                    copy(input_file, output_file)

    else:
        copy_tree(e.get('src'), output)


PAGES_FOLDER = 'pages'
PAGES_DESC = {}
pages_files  = [f for f in listdir(PAGES_FOLDER) if '.yml' in f and isfile(join(PAGES_FOLDER, f))]
for path in pages_files:
    print('Load: {}'.format(path))
    name = path.split('.')[0]
    with open(os.path.join(PAGES_FOLDER, path), 'r') as f:
        PAGES_DESC[name] = yaml.safe_load(f)

BASE_URL = resolve_url(BASE_URL, OUTPUT_DIR, ENV)
create_output_dir(OUTPUT_DIR)

data = {
    'config': CONFIG,
    'links_to_icons': items.LINKS_TO_ICONS,
    'data': {},
    'desc': PAGES_DESC
}

DATA = 'data'
data_files = [f for f in listdir(DATA) if 'json' in f and isfile(join(DATA, f))]
for path in data_files:
    print('Load: {}'.format(path))
    name = path.split('.')[0]
    with open(join(DATA, path), 'rb') as f:
        data['data'][name] = json.load(f, encoding='utf-8')

with open(os.path.join('pages', 'research.yml'), 'r') as f:
    page_config = yaml.safe_load(f)

LIST_SECTION_FORMATTERS = {}
data['generate_sections'] = generators.generate_sections
for page, content in PAGES_DESC.items():
    print('Generate: {}'.format(page))
    template_file = content.get('template') if content and 'template' in content else '{}.html'.format(page)
    folder_path = os.path.join(root, OUTPUT_DIR)
    filename = os.path.join(folder_path, '{}.html'.format(page))
    template = env.get_template(template_file)
    with open(filename, 'w') as fh:
        fh.write(template.render(
            **data
        ))

print('Check for broken links')
broken_links = utils.find_broken_links(OUTPUT_DIR, 'index.html')
if broken_links:
    print("The following links were broken:")

    for link in broken_links:
        print ('\t {}'.format(link))
else:
    print('No broken links')