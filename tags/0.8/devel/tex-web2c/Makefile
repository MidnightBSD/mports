# $MidnightBSD$
# $FreeBSD: head/devel/tex-web2c/Makefile 375598 2014-12-25 20:54:41Z bapt $

PORTNAME=	web2c
PORTVERSION=	20150521
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	TEX_CTAN/systems/texlive/Source/
PKGNAMEPREFIX=	tex-
DISTNAME=	texlive-${PORTVERSION}-source
DIST_SUBDIR=	TeX

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TeX implementation translating WEB to C

LICENSE=	publicdom

LIB_DEPENDS=	libopenjpeg.so:${PORTSDIR}/graphics/openjpeg15 \
		libpng.so:${PORTSDIR}/graphics/png \
		libzzip.so:${PORTSDIR}/devel/zziplib \
		libmpfr.so:${PORTSDIR}/math/mpfr

USES=		pkgconfig libtool tar:xz iconv
USE_TEX=	kpathsea ptexenc
USE_XORG=	pixman
USE_GNOME=	cairo
USE_LDCONFIG=	yes
EXTRACT_AFTER_ARGS=	${EXTRACT_FILES:S,^,${DISTNAME}/,}
EXTRACT_FILES=	build-aux \
		libs/xpdf \
		texk/web2c
WRKSRC=		${WRKDIR}/${DISTNAME}/texk/web2c
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-luatex \
		--disable-luajittex \
		--disable-xetex \
		--disable-aleph \
		--disable-ptex \
		--disable-tex \
		--disable-latex \
		--disable-pdftex \
		--disable-eptex \
		--disable-uptex \
		--disable-euptex \
		--disable-synctex \
		--with-x=no \
		--without-mf-x-toolkit \
		--with-system-zlib \
		--with-system-zziplib \
		--host=${ARCH}-portbld-freebsd9.1 \
		--build=${ARCH}-portbld-freebsd9.1
.for L in pixman cairo gmp mpfr libpng icu kpathsea ptexenc
CONFIGURE_ARGS+=--with-system-$L \
		--with-$L-include=${LOCALBASE}/include \
		--with-$L-libdir=${LOCALBASE}/lib
.endfor
CFLAGS+=	-I${LOCALBASE}/include
INSTALL_TARGET=	install-strip

INFO=	web2c

pre-configure:
	for D in libs/xpdf; do \
		cd ${WRKDIR}/${DISTNAME}/$$D && \
		${SETENV} ${CONFIGURE_ENV} ${SH} ${CONFIGURE_SCRIPT} ${CONFIGURE_ARGS}; \
	done

.include <bsd.port.mk>
