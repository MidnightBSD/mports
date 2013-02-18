# $MidnightBSD: mports/devel/py-setuptools/Makefile,v 1.3 2010/05/16 16:15:57 laffer1 Exp $

PORTNAME=	setuptools
PORTVERSION=	0.6c11
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Download, build, install, upgrade, and uninstall Python packages
LICENSE=	unknown

DIST_SUBDIR=	python
USE_PYTHON=	-2.7
USE_PYDISTUTILS=	yes
PYDISTUTILS_NOEGGINFO=	yes # XXX convert easy_install support to python.mk's
PLIST_SUB=	VERSION=${PORTVERSION} PYVER=${PYTHON_VERSION:S/python//}

.include <bsd.port.pre.mk>

SUB_FILES=	pkg-install
SUB_LIST=	EASYINSTALL_PTH=${EASYINSTALL_PTH}

EASYINSTALL_PTH=	${PYTHON_SITELIBDIR}/easy-install.pth

pre-install:
	${MKDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

post-install:
	${INSTALL_DATA} ${WRKSRC}/site.py ${PYTHON_SITELIBDIR}
.for opt in -Qold -O
	${PYTHON_CMD} ${opt} -m compileall -l -x \
		'^[^s][^i]?[^t]?[^e]?[^.][^p][^y]$$' ${PYTHON_SITELIBDIR}
.endfor
	${CP} ${EASYINSTALL_PTH} ${EASYINSTALL_PTH}.dist

.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.txt ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
