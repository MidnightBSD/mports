# $MidnightBSD$
# $FreeBSD: ports/audio/freealut/Makefile,v 1.9 2010/12/04 07:30:22 ade Exp $

PORTNAME=	freealut
PORTVERSION=	1.1.0
CATEGORIES=	audio
MASTER_SITES=	http://connect.creativelabs.com/openal/Downloads/ALUT/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The OpenAL Utility Toolkit
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib"
USE_GMAKE=	yes
USE_GNOME=	pkgconfig gnomehack
USE_OPENAL=	al
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's/@CFLAGS@/& -lopenal ${PTHREAD_LIBS}/g' \
		${WRKSRC}/examples/Makefile.in \
		${WRKSRC}/test_suite/Makefile.in

.include <bsd.port.post.mk>
