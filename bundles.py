#!/usr/bin/python
"""Script for vim plugins update"""

# ruby original - http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen

from dircache   import opendir
from os         import chmod, makedirs, mkdir, remove, rename, rmdir, system
from os.path    import dirname, exists, expanduser, isdir, join
from shutil     import copytree, rmtree
from stat       import S_IWRITE
from sys        import argv, platform
from urllib     import urlretrieve
from zipfile    import is_zipfile, ZipFile

# from http://stackoverflow.com/questions/1889597/deleting-directory-in-python
def remove_readonly(file_name, path, _):
    """removed read-only entity"""
    if file_name is rmdir:
        chmod(path, S_IWRITE)
        rmdir(path)
    elif file_name is remove:
        chmod(path, S_IWRITE)
        remove(path)

PATHOGEN_GIT = "git://github.com/tpope/vim-pathogen.git"

HG_BUNDLES = [
    'https://bitbucket.org/ns9tks/vim-fuzzyfinder',
    'https://bitbucket.org/sjl/gundo.vim',
    "ssh://hg@bitbucket.org/abudden/taghighlight"
]

GIT_BUNDLES = [
    "git://github.com/klen/python-mode.git",
    "git://github.com/scrooloose/nerdtree.git",
    "git://github.com/scrooloose/nerdcommenter.git",
    "git://github.com/msanders/snipmate.vim.git",
    "git://github.com/scrooloose/snipmate-snippets.git",
    "git://github.com/tpope/vim-ragtag.git",
    "git://github.com/tpope/vim-surround.git",
    "git://github.com/scrooloose/syntastic.git",
    "git://github.com/mattn/zencoding-vim.git",
    "git://github.com/vim-scripts/vimwiki.git",
    "git://github.com/vim-scripts/django.vim.git",
    "git://github.com/mileszs/ack.vim.git",
    "git://github.com/vim-scripts/SuperTab-continued..git",
    "git://github.com/vim-scripts/indentpython.vim--nianyang.git",
    "git://github.com/shemerey/vim-project.git",
    "git://github.com/rygwdn/rope-omni.git",
    "git://github.com/vim-scripts/closetag.vim.git",
    "git://github.com/slack/vim-l9.git",
    "git://github.com/vim-scripts/Color-Sampler-Pack.git",
    "http://github.com/vim-scripts/jpythonfold.vim.git",
    "https://github.com/vim-scripts/Indent-Guides.git",
    "git://github.com/majutsushi/tagbar",
    "https://github.com/vim-scripts/pep8.git",
    "https://github.com/alfredodeza/pytest.vim.git",
    "https://github.com/jmcantrell/vim-virtualenv.git",
    "https://github.com/Rip-Rip/clang_complete.git",
    #"https://bitbucket.org/kh3phr3n/vim-qt-syntax.git",
    "git://github.com/davidhalter/jedi-vim.git",
    "https://github.com/tomasr/molokai.git"
]

SVN_BUNDLES = [
    [ "rainbow_parenthsis", "http://vim-scripts.googlecode.com/svn/trunk/1561%20Rainbow%20Parenthsis%20Bundle/" ],
]

VIM_ORG_SCRIPTS = [
    ["css3",            "vim", "14047",    "syntax",  ""],
    ["jquery",          "vim", "12276",    "syntax",  ""],
    ["python",          "vim", "12804",    "syntax",  ""],
    ["javascript",      "vim", "10728",    "syntax",  ""],
    ["pylint",          "vim", "10365",    "compiler", ""],
    ["tasklist", "vim", "2607", "plugin", ""],
    ["autoclose", "vim", "10873", "plugin", ""],
    ["zenburn",         "vim", "14110",    "colors",  ""],
]

VIM_SRC_URL = 'http://www.vim.org/scripts/download_script.php?src_id={0}'

OTHER_SCRIPTS = [
#    ["http://hlabs.spb.ru/vim/svn.vim", "vim", "syntax"],
#    ["http://hlabs.spb.ru/vim/bzr.vim", "vim", "syntax"],
#    ["http://hlabs.spb.ru/vim/rcs.vim", "vim", "syntax"],
    ["http://leafo.net/lessphp/vim/less.vim", "vim", "syntax"]
]

vim_dir = ''

if platform == 'win32':
    vim_dir = expanduser("~/vimfiles")
else:
    vim_dir = expanduser("~/.vim")

bundles_dir = join( vim_dir, "bundle" )

if not exists(bundles_dir):
    print '{0} does not exists!'.format(bundles_dir)
    mkdir(bundles_dir)

tmp_dir = join( vim_dir, "tmp" )
local_dir = join( vim_dir, "autoload" )
local_old_dir = local_dir + '.old'
if exists( local_old_dir ):
    print '{0} already exists, remove it first!'.format( local_old_dir )
    exit(2)
if exists( local_dir ):
    rename( local_dir, local_old_dir )
print 'Unpacking pathogen from {0} to {1}'.format(PATHOGEN_GIT, tmp_dir)
system( 'git clone {0} "{1}"'.format( PATHOGEN_GIT, tmp_dir ) )
copytree( join(tmp_dir,"autoload"), local_dir )
rmtree( tmp_dir, onerror=remove_readonly )

rename( bundles_dir, bundles_dir+'.old' )

for hg_url in HG_BUNDLES:
    hg_name = hg_url.split('/')[-1]
    if hg_name.find('.') >= 0:
        hg_name = hg_name.rpartition('.')[0]
    if hg_name == None or hg_name == '':
        print '{0} parsing name error'.format( hg_url )
        exit(3)
    local_dir = join( bundles_dir, hg_name )
    print 'Unpacking {0} to {1}'.format( hg_url, local_dir )
    makedirs( local_dir )
    system( 'hg clone {0} "{1}"'.format( hg_url, local_dir ) )
    rmtree( join( local_dir, '.hg' ), onerror=remove_readonly )

for name, ext, id, type, do_after in VIM_ORG_SCRIPTS:
    local_dir = join( bundles_dir, name, type )
    print 'Downloading {0} to {1}'.format( name, local_dir )
    makedirs( local_dir )
    local_file_name = join(local_dir, '{0}.{1}'.format(name, ext))
    urlretrieve( VIM_SRC_URL.format(id), local_file_name )
    if type == 'archive' and do_after.find('extract') == 0:
        if not is_zipfile( local_file_name ):
            print '{0} is not valid zip file!'.format( local_file_name )
        else:
            local_dir = join( bundles_dir, name )
            if do_after.find(':') >= 0:
                local_dir = join(local_dir, do_after.split(':')[1])
            print 'Extracting {0} to {1}'.format( local_file_name, local_dir )
            file = ZipFile( local_file_name, 'r' )
            file.extractall( local_dir )

for url, ext, type in OTHER_SCRIPTS:
    name = url.split('/')[-1].rpartition('.')[0]
    local_dir = join( bundles_dir, name, type )
    print 'Downloading {0} to {1}'.format( url, local_dir )
    makedirs( local_dir )
    local_file_name = join(local_dir, '{0}.{1}'.format(name, ext))
    urlretrieve( url, local_file_name )

for git_url in GIT_BUNDLES:
    git_name = git_url.split('/')[-1]
    if git_name.find('.') >= 0:
        git_name = git_name.rpartition('.')[0]
    if git_name == None or git_name == '':
        print '%(0)s parsing name error' % { '0' : git_url }
        exit(3)
    local_dir = join( bundles_dir, git_name )
    print 'Unpacking {0} to {1}'.format( git_url, local_dir )
    makedirs( local_dir )
    system( 'git clone {0} "{1}"'.format( git_url, local_dir ) )
    rmtree( join( local_dir, '.git' ), onerror=remove_readonly )

for name, svn_url in SVN_BUNDLES:
    local_dir = join( bundles_dir, name )
    print 'Unpacking {0} to {1}'.format( svn_url, local_dir )
    makedirs( local_dir )
    system( 'svn checkout {0} "{1}"'.format( svn_url, local_dir ) )
    rmtree( join( local_dir, '.svn' ), onerror=remove_readonly )

local_dir = ''

print argv[0]
if ( exists(argv[0]) ):
    local_dir = dirname(argv[0])
else:
    local_dir = '.'
local_dir = join( local_dir, 'local' )
if ( exists(local_dir) ):
    local_vim_dir = bundles_dir
    dir_names = opendir( local_dir )
    for name in dir_names:
        from_dir = join(local_dir, name)
        if ( isdir( from_dir ) ):
            to_dir = join(local_vim_dir, name)
            print 'Copying local files from {0} to {1}'.format( from_dir, to_dir )
            copytree( from_dir, to_dir )


rmtree( bundles_dir+'.old', onerror=remove_readonly )

exit(0)

# vim: ts=4 sw=4
