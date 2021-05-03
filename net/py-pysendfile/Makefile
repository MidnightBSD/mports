# Created by: Kubilay Kocak <koobs@FreeBSD.org>

PORTNAME=	pysendfile
PORTVERSION=	2.0.1
CATEGORIES=	net python devel
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to sendfile(2)

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

CONFLICTS_INSTALL=	py*-sendfile-[0-9]*

USES=		python:3.6+
USE_PYTHON=	distutils autoplist

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/sendfile*.so

.include <bsd.port.mk>
