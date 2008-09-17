# New ports collection makefile for:   dosbox
# Date created:        28 July 2002
# Whom:                Tom Carrick <knyghtmare@knyghtmare.com>
#
# $MidnightBSD: mports/emulators/dosbox/Makefile,v 1.5 2007/10/25 17:23:46 laffer1 Exp $
# $FreeBSD: ports/emulators/dosbox/Makefile,v 1.15 2006/09/20 11:20:42 stas Exp $
#

PORTNAME=	dosbox
PORTVERSION=	0.72
CATEGORIES=	emulators
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An emulator of a PC with DOS
LICENSE=	gpl2

LIB_DEPENDS=	png.5:${PORTSDIR}/graphics/png

GNU_CONFIGURE=	yes
USE_SDL=	sdl net

MAN1=		dosbox.1
PKGMESSAGE=	${WRKDIR}/pkg-message

CPPFLAGS+=		-I${LOCALBASE}/include
CONFIGURE_ENV+=		CPPFLAGS="${CPPFLAGS}"
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS+=	--enable-core-inline

post-patch:
	@${REINPLACE_CMD} -e 's#\/usr\/share\/doc\/dosbox#${DOCSDIR}#g' \
		${WRKSRC}/docs/dosbox.1
	@${SED} 's#%%DOCSDIR%%#${DOCSDIR}#' ${PKGDIR}/pkg-message > \
		${WRKDIR}/pkg-message

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/dosbox ${PREFIX}/bin/dosbox
	${INSTALL_MAN} ${WRKSRC}/docs/dosbox.1 ${PREFIX}/man/man1/
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/NEWS ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/INSTALL ${DOCSDIR}
.endif

.include <bsd.port.mk>
