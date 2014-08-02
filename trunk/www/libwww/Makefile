# $MidnightBSD$

PORTNAME=	libwww
PORTVERSION=	5.4.0
PORTREVISION=	6
CATEGORIES=	www devel
MASTER_SITES=	http://www.w3.org/Library/Distribution/
DISTNAME=	w3c-${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The W3C Reference Library

LICENSE=	other

USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared --enable-static --with-zlib 
#--with-ssl=${OPENSSLBASE}/lib
USE_PERL5_BUILD=yes
USE_LDCONFIG=	yes
USES=		gmake tar:tgz
#USE_OPENSSL=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|$${CONFIG_SHELL-/bin/sh} $$ac_aux_dir|$$ac_aux_dir|' \
		${WRKSRC}/configure

post-install:
	${INSTALL_DATA} ${WRKSRC}/modules/expat/xmlparse/xmlparse.h \
		${PREFIX}/include/w3c-libwww/

.include <bsd.port.mk>
