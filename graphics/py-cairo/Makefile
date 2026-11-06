PORTNAME=	cairo
PORTVERSION=	1.29.1
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for Cairo

LICENSE=	lgpl2.1 MPL11
LICENSE_COMB=	dual
LICENSE_FILE_lgpl2.1=  ${WRKSRC}/COPYING-LGPL-2.1
LICENSE_FILE_MPL11=   ${WRKSRC}/COPYING-MPL-1.1

PORTSCOUT=	limitw:1,even

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}meson-python>=0.16.0:devel/meson-python@${PY_FLAVOR}

BUILD_RUN_DEPENDS=	cairo>=1.15.10:graphics/cairo

USES=		compiler:c11 gnome pkgconfig python
USE_PYTHON=	autoplist pep517
USE_GNOME=	cairo

PLIST_FILES=	include/pycairo/py3cairo.h

post-install:
	@${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/include/pycairo
	${INSTALL_DATA} ${WRKSRC}/cairo/py3cairo.h ${FAKE_DESTDIR}${TRUE_PREFIX}/include/pycairo
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/cairo/_cairo*.so

PEP517_INSTALL_CMD=	${PYTHON_CMD} -m installer --destdir ${FAKE_DESTDIR} --prefix ${TRUE_PREFIX} ${BUILD_WRKSRC}/dist/pycairo-${DISTVERSION}*.whl

do-install:
	@${MKDIR} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
	@cd ${INSTALL_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PEP517_INSTALL_CMD}
	@${PYTHON_CMD} -B ${PORTSDIR}/Mk/scripts/strip_RECORD.py \
		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/pycairo-${DISTVERSION}*.dist-info/RECORD >> ${_PYTHONPKGLIST}
	@${REINPLACE_CMD} \
		-e '/\.pyc$$/d' \
		-e 's|^|${PYTHONPREFIX_SITELIBDIR}/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../etc/|etc/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../bin/|bin/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../include/|include/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../lib/|lib/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../libdata/|libdata/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../libexec/|libexec/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../man/|man/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../sbin/|sbin/|' \
		-e 's|^${PYTHONPREFIX_SITELIBDIR}/../../../share/|share/|' \
			${_PYTHONPKGLIST}
	@cd ${FAKE_DESTDIR}${TRUE_PREFIX} && ${FIND} lib -name '*.pyc' >> ${_PYTHONPKGLIST}

.include <bsd.port.mk>
