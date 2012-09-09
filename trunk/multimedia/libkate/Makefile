# $MidnightBSD: mports/multimedia/libkate/Makefile,v 1.1 2010/12/24 14:21:02 laffer1 Exp $
# $FreeBSD: ports/multimedia/libkate/Makefile,v 1.6 2010/06/06 20:43:57 naddy Exp $

PORTNAME=	libkate
PORTVERSION=	0.3.7
CATEGORIES=	multimedia
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Codec for karaoke and text encapsulation for Ogg
LICENSE=	bsd3

LIB_DEPENDS=	ogg.7:${PORTSDIR}/audio/libogg \
		png.6:${PORTSDIR}/graphics/png

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_PKGCONFIG=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--program-prefix=''

CFLAGS+=	"-I${LOCALBASE}/include"

MAN1=	kateenc.1 katedec.1

OPTIONS=	DOXYGEN "Build docs with doxygen (requires TeX, QT, etc.)" off \
		HTMLDOCS "Install bundled html documentation" off

PORTDOCS=	*

.include <bsd.port.pre.mk>

.ifdef(WITH_DOXYGEN)
BUILD_DEPENDS+=	doxygen:${PORTSDIR}/devel/doxygen
.else
CONFIGURE_ARGS+=	--disable-doc
.endif

post-patch:
	@${REINPLACE_CMD} -E -e "s|^(katepcdir =).*|\1 ${LOCALBASE}/libdata/pkgconfig|" \
	${WRKSRC}/Makefile.in

post-install:
.for f in ${MAN1}
	${INSTALL_MAN}  ${WRKSRC}/doc/man/${f}  ${PREFIX}/man/man1
.endfor
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
. for FILE in README AUTHORS COPYING THANKS ChangeLog
	${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
. endfor
. if defined(WITH_HTMLDOCS)
	${CP} -RPpn ${WRKSRC}/doc/html ${DOCSDIR}/html
. endif
.endif

.include <bsd.port.post.mk>
