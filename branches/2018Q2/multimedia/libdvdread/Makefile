# $MidnightBSD$

PORTNAME=	libdvdread
PORTVERSION=	5.0.2
CATEGORIES=	multimedia
MASTER_SITES=	http://download.videolan.org/pub/videolan/libdvdread/${PORTVERSION}/ \
		http://dvdnav.mplayerhq.hu/releases/ \
		http://contribs.martymac.org/FreeBSD-ports/distfiles/ \
		FREEBSD_LOCAL/martymac

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPlayer version of the libdvdread project

LICENSE=	gpl2

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		tar:bzip2 gmake libtool pathfix pkgconfig
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS COPYING ChangeLog NEWS README TODO

OPTIONS_DEFINE=	DVDCSS
.if !defined(PACKAGE_BUILDING)
OPTIONS_DEFAULT=	DVDCSS
.endif

# DVDCSS version hardcoded in src/dvd_input.c (dlopen'ed)
DVDCSS_LIB_DEPENDS=	libdvdcss.so.2:${PORTSDIR}/multimedia/libdvdcss

.include <bsd.port.mk>
