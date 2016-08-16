# Created by: Gea-Suan Lin <gslin@gslin.org>
# $FreeBSD: head/net/py-s3cmd/Makefile 412985 2016-04-10 21:32:30Z bofh $
# $MidnightBSD$

PORTNAME=	s3cmd
DISTVERSION=	1.6.1
CATEGORIES=	net python
MASTER_SITES=	SF/s3tools/${PORTNAME}/${DISTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unix-like tools to manipulate stored files from the command line

LICENSE=	gpl2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dateutil>0:${PORTSDIR}/devel/py-dateutil

USES=		python:2
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

OPTIONS_DEFINE=	DOCS

post-patch:
	${REINPLACE_CMD} -e 's,share/man,man,' ${WRKSRC}/setup.py

post-patch-DOCS-on:
	${REINPLACE_CMD} -e 's,doc/packages,doc,' ${WRKSRC}/setup.py

post-patch-DOCS-off:
	${REINPLACE_CMD} -e '/(doc_path+/d' ${WRKSRC}/setup.py

.include <bsd.port.mk>
