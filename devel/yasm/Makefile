# $MidnightBSD$

PORTNAME=	yasm
PORTVERSION=	1.2.0
PORTREVISION=	3
CATEGORIES=	devel lang
MASTER_SITES=	http://www.tortall.net/projects/yasm/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Complete rewrite of the NASM assembler

LICENSE=	bsd3

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--disable-python --disable-python-bindings
CPPFLAGS+=	${CXXFLAGS} -I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=	gettext iconv
.else
CONFIGURE_ARGS+=--disable-nls --without-libiconv-prefix --without-libintl-prefix
.endif

INSTALL_TARGET=	install install-man

post-patch:
	 @${REINPLACE_CMD} -e '/echo.*RANLIB/,+1d' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
