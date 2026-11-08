# Select a coinstallable setuptools backend for PEP517 builds only.
# Usage: USES=python python-setuptools:modern (or :83, :78)
# Requires USE_PYTHON=pep517.  Custom build commands must explicitly invoke
# PYTHON_SETUPTOOLS_CMD instead of PYTHON_CMD; their arguments are unchanged.

.if !defined(_INCLUDE_USES_PYTHON_SETUPTOOLS_MK)
_INCLUDE_USES_PYTHON_SETUPTOOLS_MK= yes

.  if "${python-setuptools_ARGS}" == "modern"
_PYTHON_SETUPTOOLS_PACKAGE= setuptools-modern>=84.2.1
_PYTHON_SETUPTOOLS_ORIGIN= devel/py-setuptools-modern
_PYTHON_SETUPTOOLS_MIN_REL= 31000
.  elif "${python-setuptools_ARGS}" == "83"
_PYTHON_SETUPTOOLS_PACKAGE= setuptools83>=83.0.0<83.0.1
_PYTHON_SETUPTOOLS_ORIGIN= devel/py-setuptools83
_PYTHON_SETUPTOOLS_MIN_REL= 31000
.  elif "${python-setuptools_ARGS}" == "78"
_PYTHON_SETUPTOOLS_PACKAGE= setuptools78>=78.1.1<78.1.2
_PYTHON_SETUPTOOLS_ORIGIN= devel/py-setuptools78
_PYTHON_SETUPTOOLS_MIN_REL= 30900
.  else
IGNORE= USES=python-setuptools requires one argument: modern, 83, or 78
.  endif
_USES_POST+= python-setuptools
.endif

.if defined(_POSTMKINCLUDED) && !defined(_INCLUDE_USES_PYTHON_SETUPTOOLS_POST_MK)
_INCLUDE_USES_PYTHON_SETUPTOOLS_POST_MK= yes
.  if !defined(_PYTHON_FEATURE_PEP517)
IGNORE= USES=python-setuptools requires USE_PYTHON=pep517
.  elif defined(_PYTHON_SETUPTOOLS_MIN_REL)
.    if ${PYTHON_REL} < ${_PYTHON_SETUPTOOLS_MIN_REL}
IGNORE= selected setuptools backend does not support Python ${PYTHON_VER}
.    endif
BUILD_DEPENDS+= ${PYTHON_PKGNAMEPREFIX}${_PYTHON_SETUPTOOLS_PACKAGE}:${_PYTHON_SETUPTOOLS_ORIGIN}@${PY_FLAVOR}
_PYTHON_SETUPTOOLS_VENV= ${WRKDIR}/.python-setuptools-${python-setuptools_ARGS}
_PYTHON_SETUPTOOLS_PYTHON= ${_PYTHON_SETUPTOOLS_VENV}/bin/${PYTHON_VERSION}
_PYTHON_SETUPTOOLS_PRIVATE= ${PYTHON_LIBDIR}/mports-setuptools/${python-setuptools_ARGS}
_PYTHON_SETUPTOOLS_RUNNER= ${SCRIPTSDIR}/python-setuptools/run.sh
PYTHON_SETUPTOOLS_CMD= ${SH} ${_PYTHON_SETUPTOOLS_RUNNER:Q} ${_PYTHON_SETUPTOOLS_PYTHON:Q} ${_PYTHON_SETUPTOOLS_PRIVATE:Q} ${PYTHON_SITELIBDIR:Q}
_USES_build+= 450:python-setuptools-build-env
python-setuptools-build-env:
	${PYTHON_CMD} -S -m venv --without-pip ${_PYTHON_SETUPTOOLS_VENV:Q}
.  endif
.endif
