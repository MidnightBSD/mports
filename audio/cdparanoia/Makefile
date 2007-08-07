# New ports collection makefile for:	cdparanoia
# Date created:		5 Jan 2003
# Whom:			Simon 'corecode' Schubert <corecode@corecode.ath.cx>
#
# $FreeBSD: ports/audio/cdparanoia/Makefile,v 1.12 2006/05/03 05:14:12 edwin Exp $
# $MidnightBSD: mports/audio/cdparanoia/Makefile,v 1.1 2007/01/20 18:01:08 laffer1 Exp $
#

PORTNAME=	cdparanoia
PORTVERSION=	3.9.8
PORTREVISION=	8
CATEGORIES=	audio sysutils
MASTER_SITES=	http://www.xiph.org/paranoia/download/
DISTNAME=	${PORTNAME}-${PORTVERSION:C/^3\./III-alpha/}
EXTRACT_SUFX=	.src.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A CDDA extraction tool (also known as ripper)

USE_GETOPT_LONG=yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes

FAKE_MAKEARGS+=	prefix=${FAKE_DESTDIR}${PREFIX}
MAN1=		cdparanoia.1

post-patch:
	@${REINPLACE_CMD} -e 's/\(^ *default:\)/\1break;/' ${WRKSRC}/interface/utils.h

.include <bsd.port.mk>
