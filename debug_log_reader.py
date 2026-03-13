
import  codecs

try:
    with codecs.open('build_log.txt', 'r', 'utf-16') as f:
        content = f.read()
except:
    with codecs.open('build_log.txt', 'r', 'utf-8') as f:
        content = f.read()

lines = content.splitlines()
found = False
for i, line in enumerate(lines):
    if "DEBUG: web package compilation trace" in line:
        print(f"FOUND at line {i}:")
        for j in range(i, min(i + 20, len(lines))):
            print(f"{j}: {repr(lines[j])}")
        found = True
        break

if not found:
    print("NOT FOUND")
