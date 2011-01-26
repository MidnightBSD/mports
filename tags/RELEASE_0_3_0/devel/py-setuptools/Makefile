# $MidnightBSD: mports/devel/py-setuptools/Makefile,v 1.2 2010/02/27 21:13:43 laffer1 Exp $

PORTNAME=	setuptools
PORTVERSION=	0.6c11
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Download, build, install, upgrade, and uninstall Python packages
LICENSE=	unknown

DIST_SUBDIR=	python
USE_PYTHON=	2.4+
USE_PYDISTUTILS=	yes
PYDISTUTILS_NOEGGINFO=	yes # XXX convert easy_install support to python.mk's
PLIST_SUB=	VERSION=${PORTVERSION} PYVER=${PYTHON_VERSION:S/python//}
MAKE_ENV+=	PYTHONPATH=${PREFIX}/lib/python2.6/site-packages/

.include <bsd.port.pre.mk>

.if ${PYTHON_SUFFIX} < 25
PLIST_SUB+=	PYTHON_CURRENT="@comment "
PLIST_SUB+=	PYTHON_OLD=""
.else
PLIST_SUB+=	PYTHON_CURRENT=""
PLIST_SUB+=	PYTHON_OLD="@comment "
.endif

pre-install:
	${MKDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

post-install:
	${INSTALL_DATA} ${WRKSRC}/site.py ${PYTHON_SITELIBDIR}
.for opt in -Qold -O
	${PYTHON_CMD} ${opt} -m compileall -l -x \
		'^[^s][^i]?[^t]?[^e]?[^.][^p][^y]$$' ${PYTHON_SITELIBDIR}
.endfor

.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.txt ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
