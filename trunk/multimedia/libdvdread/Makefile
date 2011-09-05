# $MidnightBSD: mports/multimedia/libdvdread/Makefile,v 1.6 2010/11/13 19:02:51 laffer1 Exp $

PORTNAME=	libdvdread
PORTVERSION=	4.1.4.r1219
CATEGORIES=	multimedia
# Svn repository URL : svn://svn.mplayerhq.hu/dvdnav/trunk/libdvdread
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
COMMENT=	MPlayer version of the libdvdread project
LICENSE=	gpl2

.if !defined(PACKAGE_BUILDING)
LIB_DEPENDS=	dvdcss.${DVDCSS_LIBVERSION}:${PORTSDIR}/multimedia/libdvdcss
.endif

USE_BZIP2=	yes
CFLAGS+=	"-I${LOCALBASE}/include"
LDFLAGS+=	"-L${LOCALBASE}/lib"
HAS_CONFIGURE=	yes
CONFIGURE_SCRIPT=	configure2
CONFIGURE_ARGS=	--prefix="${PREFIX}" \
		--libdir="${PREFIX}/lib" \
		--libdatadir="${PREFIX}/libdata/pkgconfig" \
		--shlibdir="${PREFIX}/lib" \
		--incdir="${PREFIX}/include/dvdread" \
		--disable-opts \
		--disable-debug \
		--extra-cflags="${CFLAGS}" \
		--extra-ldflags="${LDFLAGS}"
USE_GMAKE=	yes
USE_LDCONFIG=	yes

# DVDCSS version hardcoded in src/dvd_input.c (dlopen'ed)
DVDCSS_LIBVERSION=	3

post-patch:
	@${REINPLACE_CMD} -e 's|-ldl ||g' \
		${WRKSRC}/Makefile
	@${REINPLACE_CMD} -E -e 's|(libdvdcss.so)\.2|\1.${DVDCSS_LIBVERSION}|' \
		${WRKSRC}/src/dvd_input.c

.include <bsd.port.mk>
