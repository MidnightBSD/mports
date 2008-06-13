# New ports collection makefile for:	msn-proxy
# Date created:			20 January 2008
# Whom:				Luiz Otavio O Souza <loos.br@gmail.com>
#
# $MidnightBSD: mports/net-im/msn-proxy/Makefile,v 1.1 2008/01/21 21:47:44 laffer1 Exp $
# $FreeBSD: ports/net-im/msn-proxy/Makefile,v 1.1 2008/01/21 19:11:20 miwi Exp $
#

PORTNAME=	msn-proxy
PORTVERSION=	0.5
PORTREVISON=	1
CATEGORIES=	net-im
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Messenger proxy/control daemon
LICENSE=	other
#almost mit/bsd ish in nature.

LIB_DEPENDS=	event-1.3e:${PORTSDIR}/devel/libevent

USE_MYSQL=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}
DOCS=		INSTALL

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for FILE in ${DOCS}
	@${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}/${FILE}
.endfor
.endif

.include <bsd.port.mk>
