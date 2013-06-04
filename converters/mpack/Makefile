# $MidnightBSD: mports/converters/mpack/Makefile,v 1.3 2013/02/09 03:19:48 laffer1 Exp $

PORTNAME=	mpack
PORTVERSION=	1.6
PORTREVISION=	1
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
