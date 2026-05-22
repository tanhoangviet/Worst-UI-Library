from pathlib import Path
import re

def read(p): return Path(p).read_text(encoding='utf-8')

theme, utils = read('src/core/theme.luau'), read('src/core/utils.luau')
sidebar, topbar = read('src/components/sidebar.luau'), read('src/components/topbar.luau')
dashboard, init = read('src/components/dashboard.luau'), read('src/init.luau')

def strip_module(code):
    for n in ['Theme','Utils','Sidebar','Topbar','Dashboard']:
        code = re.sub(rf'^local\s+{n}\s*=\s*require\([^\n]+\)\n?', '', code, flags=re.M)
    return code.strip()

def patch_init(code):
    mp={'Theme':'theme','Utils':'utils','Sidebar':'sidebar','Topbar':'topbar','Dashboard':'dashboard'}
    for k,v in mp.items():
        code = re.sub(rf'^local\s+{k}\s*=\s*require\([^\n]+\)\n?', f'local {k} = __modules.{v}\n', code, flags=re.M)
    return code.strip()

bundle=f'''local __modules={{}}
__modules.theme=(function()\n{theme.strip()}\nend)()
__modules.utils=(function()\n{utils.strip()}\nend)()
__modules.sidebar=(function()\nlocal Theme=__modules.theme\nlocal Utils=__modules.utils\n{strip_module(sidebar)}\nend)()
__modules.topbar=(function()\nlocal Theme=__modules.theme\nlocal Utils=__modules.utils\n{strip_module(topbar)}\nend)()
__modules.dashboard=(function()\nlocal Theme=__modules.theme\nlocal Utils=__modules.utils\n{strip_module(dashboard)}\nend)()
return (function()\n{patch_init(init)}\nend)()
'''
Path('library.luau').write_text(bundle, encoding='utf-8')
Path('dist/library.readable.luau').write_text(bundle, encoding='utf-8')
Path('dist/library.executor.lua').write_text(bundle, encoding='utf-8')
