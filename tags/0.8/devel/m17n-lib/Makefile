# $MidnightBSD$
# $FreeBSD: ports/devel/m17n-lib/Makefile,v 1.37 2011/08/11 19:19:17 kwm Exp $
#

PORTNAME=	m17n-lib
PORTVERSION=	1.6.4
CATEGORIES=	devel
MASTER_SITES=	http://www.m17n.org/m17n-lib-download/ \
		http://anthesphoria.net/FreeBSD/ports/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for multilingual text handling

LICENSE=	lgpl2.1

BUILD_DEPENDS=	bison:${PORTSDIR}/devel/bison \
		m17n-db>=1.6.2:${PORTSDIR}/devel/m17n-db
LIB_DEPENDS=	fontconfig:${PORTSDIR}/x11-fonts/fontconfig \
		freetype:${PORTSDIR}/print/freetype2 \
		fribidi:${PORTSDIR}/converters/fribidi \
		gd:${PORTSDIR}/graphics/gd \
		otf:${PORTSDIR}/print/libotf
RUN_DEPENDS=	m17n-db>=1.6.2:${PORTSDIR}/devel/m17n-db

MAKE_JOBS_UNSAFE=	yes

USES=		libtool pkgconfig
USE_XORG=	ice sm x11 xaw xft xt
USE_GNOME=	libxml2
USE_AUTOTOOLS=	autoconf 
USE_LDCONFIG=	yes

OPTIONS=	ISPELL	"With Ispell support" off \
		THAI	"With libThai support" off

.include <bsd.port.pre.mk>

CONFIGURE_ARGS+=	--disable-nls

CONFIGURE_ARGS+=	--without-anthy

.if defined(WITH_ISPELL)
BUILD_DEPENDS+=	ispell:${PORTSDIR}/textproc/ispell
RUN_DEPENDS+=	ispell:${PORTSDIR}/textproc/ispell
.else
CONFIGURE_ENV+=	HAVE_ISPELL=no
.endif

.if defined(WITH_THAI)
LIB_DEPENDS+=	thai.0:${PORTSDIR}/devel/libthai
.else
CONFIGURE_ARGS+=	--without-libthai
.endif

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|$${libdir}/pkgconfig|$${prefix}/libdata/pkgconfig|g ; \
		 s|-ldl||g'

.include <bsd.port.post.mk>
