# $MidnightBSD: mports/devel/zthread/Makefile,v 1.4 2009/10/27 03:29:59 laffer1 Exp $

PORTNAME=	zthread
PORTVERSION=	2.3.2
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/ZThread/${PORTVERSION}
DISTNAME=	ZThread-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A platform-independent object-oriented C++ threading library
LICENSE=	mit

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--without-ftime --disable-static
USE_GMAKE=	yes
MAKE_ARGS+=	INSTALL_PROGRAM="${INSTALL_SCRIPT}"
MAKE_ENV+=	SED=sed # req'd for LIBTOOL?!
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

PORTDOCS=	AUTHORS ChangeLog NEWS README TODO

post-extract:
	@${FIND} ${WRKSRC} -name CVS -type d -delete

post-patch:
	@${FIND} ${WRKSRC} \( -name '*.orig' -or -name '*.swp' \) -delete

.include <bsd.mport.options.mk>

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${INSTALL} -d ${DOCSDIR}
	@cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
