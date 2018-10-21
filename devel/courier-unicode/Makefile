# $MidnightBSD$
# $FreeBSD: head/devel/courier-unicode/Makefile 481732 2018-10-10 11:54:58Z madpilot $

PORTNAME=	courier-unicode
PORTVERSION=	2.1
CATEGORIES=	devel mail
MASTER_SITES=	SF/courier/${PORTNAME}/${PORTVERSION}

MAINTAINER=	porgs@MidnightBSD.org
COMMENT=	Courier implementation of Unicode Standard related algorithms

LICENSE=	gpl3

CONFLICTS=	libunicode-[0-9]*

USES=		compiler:c++11-lang iconv libtool localbase:ldflags \
		perl5 tar:bzip2
USE_PERL5=	build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} 's/-liconv/${ICONV_LIB}/' ${WRKSRC}/configure

.include <bsd.port.mk>
