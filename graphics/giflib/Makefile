# $MidnightBSD$
# $FreeBSD: ports/graphics/giflib/Makefile,v 1.48 2010/12/04 07:31:57 ade Exp $

PORTNAME=	giflib
PORTVERSION=	4.1.6
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}%204.x/${PORTNAME}-${PORTVERSION}
PKGNAMESUFFIX=	${NOX11SUFFIX}${PKGNAMESUFFIX2}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools and library routines for working with GIF images
LICENSE=	mit

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

.if defined(WITHOUT_X11)
PLIST_SUB+=	X11='@comment '
CONFIGURE_ARGS+=	--with-x=no
NOX11SUFFIX=	-nox11
.else
USE_XORG=	sm x11
PLIST_SUB+=	X11=''
CPPFLAGS+=	-I${LOCALBASE}/include
CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}"
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.png ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.txt ${DOCSDIR}
.endif

.include <bsd.port.mk>
