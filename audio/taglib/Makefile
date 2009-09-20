# $MidnightBSD: mports/audio/taglib/Makefile,v 1.4 2008/09/07 20:37:19 laffer1 Exp $

PORTNAME=	taglib
PORTVERSION=	1.5
CATEGORIES=	audio
MASTER_SITES=	http://ktown.kde.org/~wheeler/files/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for manipulating ID3 tags and Ogg comments
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes

CONFIGURE_TARGET=
CONFIGURE_ARGS+=	--build=${MACHINE_ARCH}-portbld-freebsd6.0

post-patch:
	@${REINPLACE_CMD} -e \
	"s|\$$(libdir)/pkgconfig|${PREFIX}/libdata/pkgconfig|g" \
	${WRKSRC}/taglib/Makefile.in ${WRKSRC}/bindings/c/Makefile.in \
	${WRKSRC}/Makefile.in 

.include <bsd.port.mk>
