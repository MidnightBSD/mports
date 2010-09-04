# $MidnightBSD: mports/print/foomatic-db/Makefile,v 1.1 2009/09/26 22:22:45 laffer1 Exp $

PORTNAME=	db
PORTVERSION=	20090530
PORTREVISION=	1
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_LOCAL:S,$,acm/foomatic/,} \
		${MASTER_SITE_GOOGLE_CODE}
PKGNAMEPREFIX=	foomatic-
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${FOOMATICVER}-${PORTVERSION}
DIST_SUBDIR=	foomatic

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foomatic database
LICENSE=	gpl2

LIB_DEPENDS=	xml2.5:${PORTSDIR}/textproc/libxml2 \
		curl.6:${PORTSDIR}/ftp/curl

PROJECTHOST=	bsdistfiles
USE_GMAKE=	yes
USE_PERL5=	yes
USE_AUTOTOOLS=	automake:15:env autoconf:262

GNU_CONFIGURE=	yes

FOOMATICVER=	4.0
WRKSRC=	${WRKDIR}/${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}

pre-configure:
	@cd ${WRKSRC} && ${ACLOCAL} && ${AUTOCONF}

.include <bsd.port.mk>
