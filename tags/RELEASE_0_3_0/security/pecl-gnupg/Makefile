# Ports collection makefile for:  pear-gnupg
# Date created:			  16 March 2006
# Whom:				  mnag@FreeBSD.org
#
# $MidnightBSD: mports/security/pecl-gnupg/Makefile,v 1.2 2010/01/02 00:06:37 laffer1 Exp $
# $FreeBSD: ports/security/pecl-gnupg/Makefile,v 1.7 2007/10/04 06:00:23 edwin Exp $
#

PORTNAME=	gnupg
PORTVERSION=	1.3.1
CATEGORIES=	security
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A pecl wrapper around the gpgme library
LICENSE=	bsd2

LIB_DEPENDS=	gpgme.18:${PORTSDIR}/security/gpgme

USE_PHP=	yes
USE_PHPEXT=	yes
PHP_MODNAME=	gnupg

CONFIGURE_ARGS=	--with-gnupg=${LOCALBASE}/include/gpgme
CFLAGS+=		-I${LOCALBASE}/include
LDFLAGS=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e "s|\$$GNUPG_DIR/lib|${LOCALBASE}/lib|" -e "s|-ldl||g" \
		${WRKSRC}/config.m4

.include <bsd.port.mk>
