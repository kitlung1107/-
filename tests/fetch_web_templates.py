"""Fetch only the two Web templates from the official 4.7.2 archive."""
import io
import pathlib
import urllib.request
import zipfile

URL = 'https://github.com/godotengine/godot-builds/releases/download/4.7.2-stable/Godot_v4.7.2-stable_export_templates.tpz'
SIZE = 1281349702

class RemoteZip(io.RawIOBase):
    def __init__(self):
        self.pos = 0
    def seekable(self):
        return True
    def seek(self, offset, whence=0):
        self.pos = offset if whence == 0 else self.pos + offset if whence == 1 else SIZE + offset
        return self.pos
    def tell(self):
        return self.pos
    def read(self, size=-1):
        size = SIZE - self.pos if size < 0 else min(size, SIZE - self.pos)
        if size <= 0:
            return b''
        req = urllib.request.Request(URL, headers={'Range': f'bytes={self.pos}-{self.pos+size-1}'})
        with urllib.request.urlopen(req) as response:
            if response.status != 206:
                raise RuntimeError('Server must support range requests')
            data = response.read()
        self.pos += len(data)
        return data

destination = pathlib.Path('tools/web_templates')
destination.mkdir(parents=True, exist_ok=True)
with zipfile.ZipFile(RemoteZip()) as archive:
    for name in ['web_nothreads_debug.zip', 'web_nothreads_release.zip']:
        member = next(item for item in archive.namelist() if item.endswith('/' + name))
        (destination / name).write_bytes(archive.read(member))
        print('Fetched', name, flush=True)
