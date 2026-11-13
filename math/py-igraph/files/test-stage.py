import os, pathlib, sys
import igraph, igraph._igraph
import pytest
stage = pathlib.Path(os.environ['IGRAPH_STAGE']).resolve()
def check():
    bad = [(name, getattr(mod, '__file__', None)) for name, mod in tuple(sys.modules.items()) if (name == 'igraph' or name.startswith('igraph.')) and mod is not None and (not getattr(mod, '__file__', None) or not pathlib.Path(mod.__file__).resolve().is_relative_to(stage))]
    print('IGRAPH_STAGE_ORIGINS', [(name, getattr(mod, '__file__', None)) for name, mod in tuple(sys.modules.items()) if (name == 'igraph' or name.startswith('igraph.')) and mod is not None], flush=True)
    if bad:
        raise RuntimeError('Non-staged igraph modules: %r' % (bad,))
check()
result = pytest.main([sys.argv[1]])
check()
sys.exit(result)
