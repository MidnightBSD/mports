# $MidnightBSD: mports/devel/yasm/Makefile,v 1.9 2011/09/22 23:03:05 laffer1 Exp $

PORTNAME=	yasm
PORTVERSION=	1.2.0
PORTREVISION=	0
CATEGORIES=	devel lang
MASTER_SITES=	http://www.tortall.net/projects/yasm/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A complete rewrite of the NASM assembler
LICENSE=	bsd3

USE_AUTOTOOLS=	autoconf libltdl
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--disable-python --disable-python-bindings
CONFIGURE_ENV=	CPPFLAGS="${CXXFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAKE_JOBS_SAFE=	yes

.include <bsd.port.pre.mk>

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls --without-libiconv-prefix --without-libintl-prefix
.else
USE_GETTEXT=	yes
USE_ICONV=	yes
.endif

INSTALL_TARGET=	install install-man
MAN1=		yasm.1
MAN7=		yasm_arch.7 yasm_dbgfmts.7 yasm_objfmts.7 yasm_parsers.7

.include <bsd.port.post.mk>
