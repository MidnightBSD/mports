# $MidnightBSD$

PORTNAME=	weplab
PORTVERSION=	0.1.5
PORTREVISION=	1
CATEGORIES=	net-mgmt
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WepLab is a tool designed to teach how WEP works

LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_CSTD=	gnu89

MAN1=		weplab.1
PLIST_FILES=	bin/weplab

post-patch:
	@${REINPLACE_CMD} -E 's,^(CC|CFLAGS|LDFLAGS) *=,\1 ?=,g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
