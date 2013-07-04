# $MidnightBSD: mports/devel/zthread/Makefile,v 1.3 2008/10/16 21:56:26 laffer1 Exp $

PORTNAME=	zthread
PORTVERSION=	2.3.2
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/ZThread/${PORTVERSION}
DISTNAME=	ZThread-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A platform-independent object-oriented C++ threading library
LICENSE=	mit

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-ftime --disable-static
USE_GMAKE=	yes
MAKE_ARGS+=	INSTALL_PROGRAM="${INSTALL_SCRIPT}"
MAKE_ENV+=	SED=sed # req'd for LIBTOOL?!
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS ChangeLog NEWS README TODO

.include <bsd.port.pre.mk>

post-extract:
	@${FIND} ${WRKSRC} -name CVS -type d -delete

post-patch:
	@${FIND} ${WRKSRC} \( -name '*.orig' -or -name '*.swp' \) -delete

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
