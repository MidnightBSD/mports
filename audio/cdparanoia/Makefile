# $MidnightBSD: mports/audio/cdparanoia/Makefile,v 1.4 2008/03/24 19:47:10 ctriv Exp $

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

FAKE_OPTS=	prefixhack
MAN1=		cdparanoia.1

post-patch:
	@${REINPLACE_CMD} -e 's/\(^ *default:\)/\1break;/' ${WRKSRC}/interface/utils.h

.include <bsd.port.mk>
