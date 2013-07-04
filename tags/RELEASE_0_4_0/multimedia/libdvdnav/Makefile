# $MidnightBSD: mports/multimedia/libdvdnav/Makefile,v 1.7 2011/09/05 20:07:44 laffer1 Exp $

PORTNAME=	libdvdnav
PORTVERSION=	4.1.4.r1219
CATEGORIES=	multimedia
# Svn repository URL : svn://svn.mplayerhq.hu/dvdnav/trunk/libdvdnav
MASTER_SITES=	http://contribs.martymac.org/FreeBSD-ports/distfiles/ \
		http://www1.mplayerhq.hu/MPlayer/releases/dvdnav/ \
		http://www2.mplayerhq.hu/MPlayer/releases/dvdnav/ \
		http://www3.mplayerhq.hu/MPlayer/releases/dvdnav/ \
		http://www4.mplayerhq.hu/MPlayer/releases/dvdnav/ \
		http://www5.mplayerhq.hu/MPlayer/releases/dvdnav/ \
		ftp://ftp1.mplayerhq.hu/MPlayer/releases/dvdnav/ \
		ftp://ftp2.mplayerhq.hu/MPlayer/releases/dvdnav/ \
		FREEBSD_LOCAL/martymac

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPlayer version of the libdvdnav project
LICENSE=	gpl2

LIB_DEPENDS=	dvdread.4:${PORTSDIR}/multimedia/libdvdread

USE_BZIP2=	yes
HAS_CONFIGURE=	yes
CONFIGURE_SCRIPT=	configure2
CONFIGURE_ARGS=	--prefix="${PREFIX}" \
		--libdir="${PREFIX}/lib" \
		--libdatadir="${PREFIX}/libdata/pkgconfig" \
		--shlibdir="${PREFIX}/lib" \
		--incdir="${PREFIX}/include/dvdnav" \
		--disable-opts \
		--disable-debug \
		--cc="${CC}"
USE_GMAKE=	yes
CONFLICTS=	libdvdnav-mplayer-[0-9]*
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|^threadlib="-lpthread"|threadlib="${PTHREAD_LIBS}"|g' \
		${WRKSRC}/configure2

.include <bsd.port.mk>
