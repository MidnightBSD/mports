# $MidnightBSD: mports/devel/libzvbi/Makefile,v 1.3 2011/09/22 23:04:19 laffer1 Exp $

PORTNAME=	libzvbi
PORTVERSION=	0.2.33
PORTREVISION=	3
CATEGORIES=	devel
MASTER_SITES=	SF/zapping/zvbi/${PORTVERSION}
DISTNAME=	${PORTNAME:S/lib//}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Routines to access raw VBI capture devices
LICENSE=	gpl2

LIB_DEPENDS+=	png.6:${PORTSDIR}/graphics/png \
		unicode.0:${PORTSDIR}/devel/libunicode

USE_GETTEXT=	yes
USE_BZIP2=	yes
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAN1=		zvbi-ntsc-cc.1

CONFIGURE_ENV= CFLAGS="${CFLAGS} -I${LOCALBASE}/include" LIBS="-L${LOCALBASE}/lib -L/usr/lib"

post-patch:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|#cpu (\([^)]*\))|defined(__\1__)|g' \
		${WRKSRC}/src/misc.h \
		${WRKSRC}/src/exp-gfx.c
	@${REINPLACE_CMD} -e 's|zvbi-atsc-cc$$(EXEEXT)||g; \
		s|zvbi-atsc-cc\.1||g' ${WRKSRC}/contrib/Makefile.in

.include <bsd.port.mk>
