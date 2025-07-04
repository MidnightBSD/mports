PORTNAME=	rasqal
PORTVERSION=	0.9.33
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	http://download.librdf.org/source/ \
		SF/librdf/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-level interface for RDF
WWW=		https://librdf.org/

LICENSE=	Apache-2.0 gpl2 gpl3 lgpl2.1
LICENSE_COMB=	dual

LIB_DEPENDS=	libraptor2.so:textproc/raptor2 \
		libpcre.so:devel/pcre

USES=		gmake libtool pathfix perl5 pkgconfig ssl
USE_PERL5=	build
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

OPTIONS_RADIO=	DEC
OPTIONS_RADIO_DEC=	GMP MPFR

GMP_DESC=	Use GMP library for decimals
MPFR_DESC=	Use MPFR library for decimals

GMP_CONFIGURE_ON=	--with-decimal=gmp --with-gmp=${LOCALBASE}
GMP_LIB_DEPENDS=	libgmp.so:math/gmp
MPFR_CONFIGURE_ON=	--with-decimal=mpfr --with-mpfr=${LOCALBASE}
MPFR_LIB_DEPENDS=	libmpfr.so:math/mpfr

.include <bsd.mport.options.mk>

.if empty(PORT_OPTIONS:MMPFR) && empty(PORT_OPTIONS:MGMP)
CONFIGURE_ARGS+=--with-decimal=none
.endif

.include <bsd.port.mk>
