# $MidnightBSD$
# $FreeBSD: head/print/tex-ptexenc/Makefile 365637 2014-08-22 11:04:23Z hrs $

PORTNAME=	ptexenc
PORTVERSION=	1.3.3
PORTREVISION=	0
CATEGORIES=	print
MASTER_SITES=	TEX_CTAN/systems/texlive/Source/
PKGNAMEPREFIX=	tex-
DISTNAME=	texlive-20150521-source
DIST_SUBDIR=	TeX

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for Japanese pTeX and its tools

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYRIGHT

USES=		iconv libtool pkgconfig tar:xz
USE_TEX=	kpathsea
USE_LDCONFIG=	yes
WRKSRC=		${WRKDIR}/${DISTNAME}/texk/ptexenc
EXTRACT_AFTER_ARGS=	${EXTRACT_FILES:S/^/${DISTNAME}\//}
EXTRACT_FILES=	build-aux texk/ptexenc
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-kanji-iconv \
		--with-system-kpathsea \
		--with-kpathsea-includes=${LOCALBASE}/include \
		--with-kpathsea-libdir=${LOCALBASE}/lib
LIBS+=		-L${ICONV_PREFIX}/lib ${ICONV_LIB}
CPPFLAGS+=	-I${ICONV_PREFIX}/include
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
