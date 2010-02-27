# $MidnightBSD: mports/audio/cdparanoia/Makefile,v 1.5 2009/07/12 15:55:10 laffer1 Exp $

PORTNAME=	cdparanoia
PORTVERSION=	3.9.8
PORTREVISION=	8
CATEGORIES=	audio sysutils
MASTER_SITES=	http://www.xiph.org/paranoia/download/
DISTNAME=	${PORTNAME}-${PORTVERSION:C/^3\./III-alpha/}
EXTRACT_SUFX=	.src.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A CDDA extraction tool (also known as ripper)
LICENSE=	gpl2

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
MAKE_JOBS_UNSAFE=	yes

FAKE_OPTS=	prefixhack
MAN1=		cdparanoia.1

post-patch:
	@${REINPLACE_CMD} -e 's/\(^ *default:\)/\1break;/' ${WRKSRC}/interface/utils.h

.include <bsd.port.mk>
