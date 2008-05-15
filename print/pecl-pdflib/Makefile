# New ports collection makefile for:	pecl-pdflib
# Date created:			25 Jun 2004
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $MidnightBSD: mports/print/pecl-pdflib/Makefile,v 1.2 2007/02/23 18:39:39 laffer1 Exp $
# $FreeBSD: ports/print/pecl-pdflib/Makefile,v 1.9 2006/11/06 22:27:23 ale Exp $
#

PORTNAME=	pdflib
PORTVERSION=	2.1.2
CATEGORIES=	print
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A PECL extension to create PDF on the fly

LIB_DEPENDS=	pdf.8:${PORTSDIR}/print/pdflib

USE_PHP=	gd
USE_PHP_BUILD=	yes
USE_PHPEXT=	yes
PHP_MODNAME=	pdf

CONFIGURE_ARGS=	--with-pdflib=${LOCALBASE}

.include <bsd.port.mk>
