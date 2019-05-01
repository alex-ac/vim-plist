import collections
import plistlib

import vim

def dump_view(key, node):
    if isinstance(node, dict):
        if key is not None:
            yield key + ':'
            for k, v in node.items():
                for line in dump_view(k, v):
                    yield '  ' + line
        else:
            for k, v in node.items():
                for line in dump_view(k, v):
                    yield line
    elif isinstance(node, list):
        if key is not None:
            yield key + ':'
        for v in node:
            for line in dump_view(None, v):
                yield '- ' + line
                break
            for line in dump_view(None, v):
                yield '  ' + line
    else: 
        if key is not None:
            yield '{}: {}'.format(key, node)
        else:
            yield str(node)

def load_plist():
    current_buffer = vim.current.buffer
    filename = current_buffer.name
    with open(filename, 'rb') as f:
        data = plistlib.load(f, dict_type=collections.OrderedDict)

    lines = list(dump_view(None, data))

    vim.command('vsplit PLIST_DATA')
    vim.command('normal! ggdG')
    vim.command('setlocal ft=plist-data')
    vim.command('setlocal buftype=nofile')

    view_buffer = vim.current.buffer
    view_buffer[:] = lines
