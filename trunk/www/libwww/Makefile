# $MidnightBSD: mports/www/libwww/Makefile,v 1.2 2008/08/21 17:24:31 laffer1 Exp $

PORTNAME=	libwww
PORTVERSION=	5.4.0
PORTREVISION=	4
CATEGORIES=	www devel
MASTER_SITES=	http://www.w3.org/Library/Distribution/
DISTNAME=	w3c-${PORTNAME}-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The W3C Reference Library
LICENSE=	other

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--enable-shared --enable-static --with-zlib 
#--with-ssl=${OPENSSLBASE}/lib
USE_PERL5_BUILD=yes
MAKE_ENV=	objformat=${PORTOBJFORMAT}
USE_LDCONFIG=	yes
#USE_OPENSSL=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|$${CONFIG_SHELL-/bin/sh} $$ac_aux_dir|$$ac_aux_dir|' \
		${WRKSRC}/configure

post-install:
	${INSTALL_DATA} ${WRKSRC}/modules/expat/xmlparse/xmlparse.h \
		${PREFIX}/include/w3c-libwww/

.include <bsd.port.mk>
