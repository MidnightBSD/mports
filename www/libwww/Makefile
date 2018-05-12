# $MidnightBSD$

PORTNAME=	libwww
PORTVERSION=	5.4.0
PORTREVISION=	8
CATEGORIES=	www devel
MASTER_SITES=	http://www.w3.org/Library/Distribution/
DISTNAME=	w3c-${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The W3C Reference Library

LICENSE=	w3cipr
LICENSE_NAME=	W3C IPR SOFTWARE NOTICE
LICENSE_FILE=	${WRKSRC}/LICENSE.html
LICENSE_PERMS=	dist-mirror pkg-mirror

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-zlib --with-ssl=${OPENSSLBASE}
USES=		perl5 gmake libtool tar:tgz ssl
USE_PERL5=	build
USE_LDCONFIG=	yes

post-install:
	${INSTALL_DATA} ${WRKSRC}/modules/expat/xmlparse/xmlparse.h \
		${PREFIX}/include/w3c-libwww/

.include <bsd.port.mk>
