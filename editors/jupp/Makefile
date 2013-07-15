# $MidnightBSD: mports/editors/jupp/Makefile,v 1.11 2013/02/21 01:34:20 laffer1 Exp $

PORTNAME=	jupp
PORTVERSION=	3.1.24
CATEGORIES=	editors
MASTER_SITES=	http://www.mirbsd.org/MirOS/dist/jupp/ \
		http://pub.allbsd.org/MirOS/dist/jupp/
DISTNAME=	joe-${PORTVERSION:C/([0-9]+\.[0-9]+)\.([0-9]+)/\1${PORTNAME}\2/}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The editor which sucks less.

LICENSE=	gpl

CONFLICTS=	joe-[23]*

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-termidx
WRKSRC=		${WRKDIR}/${PORTNAME}

MAN1=		joe.1
MLINKS=		joe.1 jmacs.1 - jpico.1 - jstar.1 - jupp.1 - rjoe.1

pre-configure:
	@${CHMOD} +x ${WRKSRC}/configure

.include <bsd.port.mk>
