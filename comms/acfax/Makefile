PORTNAME=	acfax
PORTVERSION=	0.981011
PORTREVISION=	5
CATEGORIES=	comms hamradio
MASTER_SITES=	ftp://ftp.funet.fi/pub/ham/unix/Linux/misc/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/^0.//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Receive faxes using sound card and radio

LICENSE=	gpl2

LIB_DEPENDS=	libXaw3d.so:x11-toolkits/Xaw3d \
		libgnuregex.so.6:devel/libgnuregex

PLIST_FILES=	bin/acfax
WRKSRC=		${WRKDIR}/${PORTNAME}

USES=		imake xorg
USE_XORG=	x11 xext xmu xt sm ice

post-extract:
	@${TOUCH} ${WRKSRC}/acfax.man

post-patch:
	@${REINPLACE_CMD} -e 's|regex.h|gnuregex.h|' ${WRKSRC}/RegExp.h
	@${REINPLACE_CMD} -e 's| -O2 -Wall||g ; \
		 s|-lm|-lm -lgnuregex|' ${WRKSRC}/Imakefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/acfax ${PREFIX}/bin

.include <bsd.port.mk>
