# New ports collection makefile for:	libwww
# Date created:		18 Feb 1996
# Whom:			torstenb
#
# $MidnightBSD$
# $FreeBSD: ports/www/libwww/Makefile,v 1.42 2006/08/15 01:11:31 clsung Exp $
#

PORTNAME=	libwww
PORTVERSION=	5.4.0
PORTREVISION=	3
CATEGORIES=	www devel
MASTER_SITES=	http://www.w3.org/Library/Distribution/
DISTNAME=	w3c-${PORTNAME}-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The W3C Reference Library

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--enable-shared --enable-static --with-zlib
USE_PERL5_BUILD=yes
MAKE_ENV=	objformat=${PORTOBJFORMAT}
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|$${CONFIG_SHELL-/bin/sh} $$ac_aux_dir|$$ac_aux_dir|' \
		${WRKSRC}/configure

post-install:
	${INSTALL_DATA} ${WRKSRC}/modules/expat/xmlparse/xmlparse.h \
		${PREFIX}/include/w3c-libwww/

.include <bsd.port.mk>
