# $MidnightBSD: mports/net/vnc2swf/Makefile,v 1.1 2008/06/18 05:54:13 laffer1 Exp $

PORTNAME=	vnc2swf
PORTVERSION=	0.5.0
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	http://www.unixuser.org/~euske/${PORTNAME}/ \
		ftp://ftp.rewt.org.uk/pub/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	VNC Session Recorder to SWF Flash (Movie) format
LICENSE=	gpl2

USE_XORG=	xmu x11 xi xaw
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

PLIST_FILES=	bin/vnc2swf bin/recordwin

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's| -g||g'

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/vnc2swf ${PREFIX}/bin/vnc2swf
	${INSTALL_SCRIPT} ${WRKSRC}/recordwin.sh ${PREFIX}/bin/recordwin

.include <bsd.port.mk>
