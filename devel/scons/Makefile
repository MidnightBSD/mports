# $MidnightBSD$
# $FreeBSD: ports/devel/scons/Makefile,v 1.29 2007/07/30 09:41:26 alexbl Exp $

PORTNAME=	scons
PORTVERSION=	2.3.0
PORTREVISION=	2
CATEGORIES=	devel python
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build tool alternative to make

LICENSE=	mit

RUN_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_PYTHON=		2
USE_PYDISTUTILS=	yes
PYDISTUTILS_AUTOPLIST=	yes

PLIST_SUB+=	SCONS_VER=${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} \
		-e 's,distutils\.command\.install$$,setuptools\.command\.install,' \
		-e 's,distutils\.command\.install\.,setuptools\.command\.install\.,' \
		${WRKSRC}/setup.py
	@${FIND} ${WRKSRC} -name \*.orig -delete
.include <bsd.port.mk>
