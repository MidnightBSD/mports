from pathlib import Path
import subprocess
import sys
import unidic_lite

root = Path(sys.argv[1])
assert Path(unidic_lite.__file__).is_relative_to(root)
assert unidic_lite.VERSION == "2.1.2", unidic_lite.VERSION
dictionary = Path(unidic_lite.DICDIR)
for name in ["sys.dic", "unk.dic", "matrix.bin", "char.bin", "dicrc"]:
    assert (dictionary / name).stat().st_size > 0, name
result = subprocess.run([sys.argv[2], "-r", "/dev/null", "-d", str(dictionary), "-Owakati"], input="日本語ですよ\n", text=True, capture_output=True, check=True)
assert result.stdout.strip() == "日本 語 です よ", result.stdout
print("Staged UniDic 2.1.2 dictionary import and native MeCab tokenization pass")
