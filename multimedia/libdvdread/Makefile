# $MidnightBSD$

PORTNAME=	libdvdread
PORTVERSION=	4.9.9
PORTREVISION=	0
CATEGORIES=	multimedia
MASTER_SITES=	http://dvdnav.mplayerhq.hu/releases/ \
		http://contribs.martymac.org/FreeBSD-ports/distfiles/ \
		LOCAL/martymac

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPlayer version of the libdvdread project

LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		gmake libtool:oldver pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS COPYING ChangeLog NEWS README TODO

OPTIONS_DEFINE=	DVDCSS
.if !defined(PACKAGE_BUILDING)
OPTIONS_DEFAULT=	DVDCSS
.endif

# DVDCSS version hardcoded in src/dvd_input.c (dlopen'ed)
DVDCSS_LIB_DEPENDS=	libdvdcss.so.2:${PORTSDIR}/multimedia/libdvdcss

.include <bsd.port.mk>
