# $MidnightBSD$

PORTNAME=	libdvdnav
PORTVERSION=	5.0.3
CATEGORIES=	multimedia
MASTER_SITES=	http://download.videolan.org/pub/videolan/libdvdnav/${PORTVERSION}/ \
		http://dvdnav.mplayerhq.hu/releases/ \
		http://contribs.martymac.org/FreeBSD-ports/distfiles/ \
		FREEBSD_LOCAL/martymac

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPlayer version of the libdvdnav project

LICENSE=	gpl2

LIB_DEPENDS=	libdvdread.so:${PORTSDIR}/multimedia/libdvdread

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USES=		tar:bzip2 gmake libtool pathfix pkgconfig
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS COPYING ChangeLog README TODO

.include <bsd.port.mk>
