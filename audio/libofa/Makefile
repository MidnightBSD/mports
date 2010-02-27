# $MidnightBSD: mports/audio/libofa/Makefile,v 1.3 2009/09/20 00:36:15 laffer1 Exp $

PORTNAME=	libofa
PORTVERSION=	0.9.3
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	http://www.musicdns.org/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Open Fingerprint Architecture Library
LICENSE=	gpl2
# two licenses, this one i can parse

LIB_DEPENDS=	fftw3.5:${PORTSDIR}/math/fftw3 \
		expat.6:${PORTSDIR}/textproc/expat2 \
		curl.5:${PORTSDIR}/ftp/curl

USE_AUTOTOOLS=	libtool:22
USE_GNOME=	pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

post-configure:
	@${REINPLACE_CMD} -e "s|pcdir =.*|pcdir = ${PREFIX}/libdata/pkgconfig|g" \
		${WRKSRC}/Makefile

.include <bsd.port.post.mk>
