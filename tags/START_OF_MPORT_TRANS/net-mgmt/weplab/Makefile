# New ports collection makefile for:	weplab
# Date created:				24 Aug 2006
# Whom:					Anton Karpov <toxa@toxahost.ru>
#
# $FreeBSD: ports/net-mgmt/weplab/Makefile,v 1.1 2006/08/24 13:13:41 garga Exp $
# $MidnightBSD$
#

PORTNAME=	weplab
PORTVERSION=	0.1.5
CATEGORIES=	net-mgmt
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WepLab is a tool designed to teach how WEP works

GNU_CONFIGURE=	yes

MAN1=		weplab.1
PLIST_FILES=	bin/weplab

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 500000
BROKEN=	Doesn't build on 4.x
.endif

post-patch:
	@${REINPLACE_CMD} -E 's,^(CC|CFLAGS|LDFLAGS) *=,\1 ?=,g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.post.mk>
