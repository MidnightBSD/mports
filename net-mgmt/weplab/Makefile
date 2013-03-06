# $MidnightBSD: mports/net-mgmt/weplab/Makefile,v 1.2 2007/06/06 21:13:19 ctriv Exp $

PORTNAME=	weplab
PORTVERSION=	0.1.5
CATEGORIES=	net-mgmt
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WepLab is a tool designed to teach how WEP works
LICENSE=	gpl2

GNU_CONFIGURE=	yes

MAN1=		weplab.1
PLIST_FILES=	bin/weplab

post-patch:
	@${REINPLACE_CMD} -E 's,^(CC|CFLAGS|LDFLAGS) *=,\1 ?=,g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
