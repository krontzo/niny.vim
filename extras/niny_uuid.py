import uuid

url = 'https://github.com/9gress0r/niny'
niny_uuid = uuid.uuid5(uuid.NAMESPACE_URL, url)

print(str(niny_uuid).upper())

"""
46ddc982-5c78-5543-bc99-85a3bb6cd6f3
46DDC982-5C78-5543-BC99-85A3BB6CD6F3
"""
