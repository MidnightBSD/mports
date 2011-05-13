# $MidnightBSD: mports/converters/mpack/Makefile,v 1.1 2008/05/31 03:04:55 laffer1 Exp $
# $FreeBSD: ports/converters/mpack/Makefile,v 1.20 2006/10/31 15:52:49 dinoex Exp $

PORTNAME=	mpack
PORTVERSION=	1.6
PORTREVISION=	0
CATEGORIES=	converters mail news
MASTER_SITES=	ftp://ftp.andrew.cmu.edu/pub/mpack/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	External MIME packer/unpacker
LICENSE=	bsd3

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
GNU_CONFIGURE=	yes

MAN1=		mpack.1 munpack.1

PLIST_FILES=	bin/mpack bin/munpack

.include <bsd.port.mk>
