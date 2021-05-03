# Created by: Leland Wang <llwang@infor.org>

PORTNAME=	sgflib
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	games python
MASTER_SITES=	http://gotools.sourceforge.net/sgflib/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Smart Game Format parser library for Python

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/lgpl.txt

USES=		python:3.6+ shebangfix
USE_PYTHON=	flavors
NO_BUILD=	yes
NO_ARCH=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local/bin/python|${python_CMD}|' \
		${WRKSRC}/*.py
	@${FIND} ${WRKSRC} -name "*.bak" -delete

do-install:
	@${MKDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
	(cd ${WRKSRC} && ${INSTALL_SCRIPT} sgflib.py typelib.py \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR})

.include <bsd.port.mk>
