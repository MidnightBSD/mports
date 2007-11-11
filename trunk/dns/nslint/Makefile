# New ports collection makefile for:	nslint
# Date created:		10 Nov 2007
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/dns/nslint/Makefile,v 1.1 2007/11/11 23:25:35 laffer1 Exp $
#

PORTNAME=	nslint
PORTVERSION=	2.1.a6
CATEGORIES=	dns
MASTER_SITES=	ftp://ftp.ee.lbl.gov/ \
		http://critical.ch/distfiles/ \
		http://energy.critical.ch/distfiles/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/.a/a/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perform consistency checks on DNS zone files
LICENSE=	bsd3

GNU_CONFIGURE=	yes

ALL_TARGET=	${PORTNAME}
INSTALL_TARGET=	install install-man

BOOTFILE?=	/etc/namedb/named.boot
CONFFILE?=	/etc/namedb/named.conf

MAN8=		nslint.8
PLIST_FILES=	bin/nslint

post-patch:
	${REINPLACE_CMD} -e '/^\ \{4\}V_CCOPT/d' ${WRKSRC}/configure
	${REINPLACE_CMD} -e 's|/etc/named.boot|${BOOTFILE}|; \
		s|/etc/named.conf|${CONFFILE}|' \
			${WRKSRC}/${PORTNAME}.c \
			${WRKSRC}/${MAN8}

.include <bsd.port.mk>
