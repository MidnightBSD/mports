# $MidnightBSD: mports/devel/yasm/Makefile,v 1.6 2009/10/27 03:31:56 laffer1 Exp $

PORTNAME=	yasm
PORTVERSION=	0.8.0
CATEGORIES=	devel lang
MASTER_SITES=	http://www.tortall.net/projects/yasm/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A complete rewrite of the NASM assembler
LICENSE=	agg
# mostly bsd2 with bsd3 and lgpl

USE_ICONV=	yes
USE_AUTOTOOLS=	autoconf libltdl
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CXXFLAGS} -I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.pre.mk>

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=--disable-nls --without-libiconv-prefix --without-libintl-prefix
.else
USE_GETTEXT=	yes
.endif

.if !defined(NOPORTDOCS)
INSTALL_TARGET=	install install-man
MAN1=		yasm.1
MAN7=		yasm_arch.7 yasm_dbgfmts.7 yasm_objfmts.7 yasm_parsers.7
.endif

.include <bsd.port.post.mk>
