# $MidnightBSD$

PORTNAME=	setuptools
PORTVERSION=	0.6c9
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_CHEESESHOP}
MASTER_SITE_SUBDIR=	source/s/setuptools
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Download, build, install, upgrade, and uninstall Python packages
LICENSE=	unknown

BROKEN=		tries to be clever and detect python path for .pth files

DIST_SUBDIR=	python
USE_PYTHON=	2.3+
USE_PYDISTUTILS=	yes
PYDISTUTILS_NOEGGINFO=	yes # XXX convert easy_install support to python.mk's
PLIST_SUB=	VERSION=${PORTVERSION} PYVER=${PYTHON_VERSION:S/python//}

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
