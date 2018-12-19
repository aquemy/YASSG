from os.path import isfile
from requests.adapters import BaseAdapter
import requests
import os
from bs4 import BeautifulSoup

class FileAdapter(requests.adapters.BaseAdapter):
    @staticmethod
    def _chkpath(method, path):
        if method.lower() in ('put', 'delete'):
            return 501, "Not Implemented"  # TODO
        elif method.lower() not in ('get', 'head'):
            return 405, "Method Not Allowed"
        elif os.path.isdir(path):
            return 400, "Path Not A File"
        elif not os.path.isfile(path):
            return 404, "File Not Found"
        elif not os.access(path, os.R_OK):
            return 403, "Access Denied"
        else:
            return 200, "OK"

    def send(self, req, **kwargs):  # pylint: disable=unused-argument
        path = '.' + req.path_url
        response = requests.Response()
        response.status_code, response.reason = self._chkpath(req.method, path)
        if response.status_code == 200 and req.method.lower() != 'head':
            try:
                response.raw = open(path, 'rb')
            except (OSError, IOError) as err:
                response.status_code = 500
                response.reason = str(err)

        if isinstance(req.url, bytes):
            response.url = req.url.decode('utf-8')
        else:
            response.url = req.url

        response.request = req
        response.connection = self

        return response

    def close(self):
        pass

def get_links_from_html(html):
    def get_link(el):
        return el["href"]
    return list(map(get_link, BeautifulSoup(html, features="html.parser").select("a[href]")))

def __find_broken_links(output_folder, file, parent_path, broken_links, searched_links):
    if file not in searched_links and not file.strip().startswith('http') and not file.startswith('mailto:') and not file.startswith('#'):
        try:
            file_path = './' + os.path.join(output_folder, file)
            if not file_path.endswith('.html'):
                if not isfile(file_path):
                    broken_links.append("BROKEN: file " + file + " from " + parent_path)
            else:
                requests_session = requests.session()
                requests_session.mount('file://', FileAdapter())
                requestObj = requests_session.get('file://{}'.format(file_path))
                searched_links.append(file)
                if(requestObj.status_code == 404):
                    broken_links.append([file, parent_path])
                else:
                    for link in get_links_from_html(requestObj.text):
                        broken_links = __find_broken_links(output_folder, link, file, broken_links, searched_links)
        except Exception as e:
            print("ERROR: " + str(e));
            searched_links.append(output_folder)
    return broken_links

def find_broken_links(dir, entrypoint):
    return __find_broken_links(dir, entrypoint, "", [], [])