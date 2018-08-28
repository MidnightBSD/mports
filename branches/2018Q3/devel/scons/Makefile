# $MidnightBSD$
# $FreeBSD: ports/devel/scons/Makefile,v 1.29 2007/07/30 09:41:26 alexbl Exp $

PORTNAME=	scons
PORTVERSION=	3.0.1
CATEGORIES=	devel python
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build tool alternative to make

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USES=		python:2
USE_PYTHON=	distutils autoplist

PLIST_SUB+=	SCONS_VER=${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} \
		-e 's,distutils\.command\.install$$,setuptools\.command\.install,' \
		-e 's,distutils\.command\.install\.,setuptools\.command\.install\.,' \
		${WRKSRC}/setup.py
	@${FIND} ${WRKSRC} -name \*.orig -delete

.include <bsd.port.mk>
