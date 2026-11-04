PORTNAME=	eric7
DISTVERSION=	26.10
CATEGORIES=	devel python
MASTER_SITES=	PYPI
DISTNAME=	eric_ide-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full featured Python editor and IDE based on Qt6
WWW=		https://eric-ide.python-projects.org/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/docs/LICENSE.txt

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}asttokens>0:devel/py-asttokens@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}chardet>0:textproc/py-chardet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}coverage>=6.5.0:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}docutils>0:textproc/py-docutils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}editorconfig>0:editors/py-editorconfig@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}enchant>0:textproc/py-enchant@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jedi>0:devel/py-jedi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}markdown>0:textproc/py-markdown@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}parso>0:textproc/py-parso@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pip>0:devel/py-pip@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>0:sysutils/py-psutil@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>0:textproc/py-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyusb>=1.2.0:devel/py-pyusb@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>0:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}semver>0:devel/py-semver@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sqlite3>0:databases/py-sqlite3@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}tomlkit>0:textproc/py-tomlkit@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}trove-classifiers>0:devel/py-trove-classifiers@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}watchdog>=5.0.0:devel/py-watchdog@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		desktop-file-utils pyqt:6 python
USE_PYQT=	pyqt6:run qscintilla2:run
USE_PYTHON=	autoplist noflavors pep517

PEP517_INSTALL_CMD=	${PYTHON_CMD} -m installer --destdir ${FAKE_DESTDIR} \
			--prefix ${TRUE_PREFIX} \
			${BUILD_WRKSRC}/dist/${DISTNAME}-py3-none-any.whl

NO_ARCH=	yes

OPTIONS_DEFINE=		WEBENGINE
OPTIONS_DEFAULT=	WEBENGINE

WEBENGINE_DESC=	Web browser and help viewer (QtWebEngine)
WEBENGINE_USE=	PYQT=webengine:run

# The PyPI distribution is "eric-ide", so the pep517 do-install from
# USES=python cannot find the dist-info by ${PORTNAME}; same steps otherwise.
do-install:
	@${MKDIR} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
	@cd ${INSTALL_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PEP517_INSTALL_CMD}
	@${PYTHON_CMD} -B ${PORTSDIR}/Mk/scripts/strip_RECORD.py \
		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/${DISTNAME}.dist-info/RECORD \
		>> ${_PYTHONPKGLIST}
	@${REINPLACE_CMD} -e '/\.pyc$$/d' \
		-e 's|^|${PYTHONPREFIX_SITELIBDIR}/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../bin/|bin/|' \
		${_PYTHONPKGLIST}
	@cd ${FAKE_DESTDIR}${TRUE_PREFIX} && ${FIND} lib -name '*.pyc' >> ${_PYTHONPKGLIST}

post-install:
	@${MKDIR} ${PREFIX}/share/applications
.for f in eric7_browser eric7_ide eric7_mpy eric7_tray
	${SED} -e 's|@BINDIR@|${TRUE_PREFIX}/bin|g' \
		${WRKSRC}/src/eric7/data/linux/${f}.desktop \
		> ${PREFIX}/share/applications/${f}.desktop
.endfor
	@${MKDIR} ${PREFIX}/share/metainfo
	${INSTALL_DATA} ${WRKSRC}/src/eric7/data/linux/eric7.appdata.xml \
		${PREFIX}/share/metainfo
	@${MKDIR} ${PREFIX}/share/icons/hicolor/48x48/apps \
		${PREFIX}/share/icons/hicolor/scalable/apps
.for i in eric ericMPy ericTray ericWeb
	${INSTALL_DATA} ${WRKSRC}/src/eric7/pixmaps/${i}48_icon.png \
		${PREFIX}/share/icons/hicolor/48x48/apps/${i}.png
.endfor
	${INSTALL_DATA} ${WRKSRC}/src/eric7/pixmaps/eric.svg \
		${PREFIX}/share/icons/hicolor/scalable/apps/eric.svg
.for i in ericMPy ericWeb
	${INSTALL_DATA} ${WRKSRC}/src/eric7/pixmaps/${i}48.svg \
		${PREFIX}/share/icons/hicolor/scalable/apps/${i}.svg
.endfor

.include <bsd.port.mk>
