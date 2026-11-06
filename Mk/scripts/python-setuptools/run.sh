#!/bin/sh
# Run an explicitly selected backend without executing global .pth files.
set -eu
if [ "$#" -lt 3 ]; then
    echo "usage: $0 venv-python private-backend normal-site [python-arguments ...]" >&2
    exit 64
fi
python=$1
private=$2
normal=$3
shift 3
if [ ! -f "$private/setuptools/__init__.py" ]; then
    echo "selected private setuptools backend is not installed: $private" >&2
    exit 69
fi
PYTHONPATH="$private${PYTHONPATH:+:$PYTHONPATH}:$normal"
export PYTHONPATH
exec "$python" "$@"
